use strict;
use Encode;
use CGI;
use JSON;
use File::Slurp;
use HTML::Entities;
use Crypt::Lite;

use lib '/web/virtual/fb24_2/';

use Mysql;
#use Lingua::Translit;

use Mail::Sender::Easy qw(email);
use Digest::MD5 qw(md5_hex);

use Socket;

my $socket;

require "$main::master->{'_path'}/cgibin/cookielib2.pl";
require "$main::master->{'_path'}/cgibin/zufallstexte.pl";
require "$main::master->{'_path'}/cgibin/spiele2.pl";
require "$main::master->{'_path'}/cgibin/arzt.pl";
require "$main::master->{'_path'}/cgibin/vornamen.pl";
require "$main::master->{'_path'}/cgibin/sprueche.pl";

# Programmspezifische PLs
#require "resource/seeder.pl";

our $besucher={};
our $filecache={};

our @smileys=("angry.png§:\\[","cheesy.png§:\\)\\)","cool.png§8\\)","cry.png§:\\{","embarassed.png§X\\|","grin.png§:<","kiss.png§:x","laugh.png§:\\]","lipsrsealed.png§:o","rolleyes.png§8\\|","sad.png§:\\(","shocked.png§8!","smiley.png§:\\)","tongue.png§:p","undecided.png§:\\?","wink.png§P\\)");

#$main::LINGUA = new Lingua::Translit("ISO 9");

#
# In init() kommen alle Anweisungen rein,
# die nur einmal gemacht werden müssen.
# Die Trennung ist notwendig, da manche Skripte
# als FCGI laufen.
#
sub init
{
	srand(time);
}

sub socket()
{
	my ($was,$second)=@_;
	# Socket zum Dämon initialisieren
	$socket = IO::Socket::INET->new( Proto => "tcp",
		PeerAddr => '127.0.0.1',
		PeerPort => 11015,
	) || -1;
	if($socket<1)
	{
		warn("SOCKET INAKTIV!");
		$main::DAEMON_AKTIV=0;
		return(&to_json({'status'=>-1}));


		if(!$second)
		{
			`perl daemon.cgi &`;
			&socket($was,1);
		} else
		{
			$main::DAEMON_AKTIV=0;
			return;
		}
	};
	$socket->autoflush(1);

	my $EOL = "\015\012";
	print $socket "$was".$EOL x 2;
	my $antwort;
	while (my $line = <$socket>) {
		$antwort.=$line;
		last if $antwort=~s/$EOL//;
	}
	#&main::logge_int("Antworte mit $antwort");
	return $antwort;
}

sub initLokal
{
	my $seite=shift;
	$CGI::LIST_CONTEXT_WARN = 0;
	# Eingaben?
	my $vars={ '_zeit' => &zeit };
	my @namen=$seite->param;
	foreach my $i (@namen)
	{
		my $key=$i;
		$key=~s/\[\]$//;
		#warn("$i = ".$seite->param($i));

		eval{
			my @temp=$seite->param($i);
			#&main::logge_int("T: $i = @temp") if $i=~/art/;
			if($#temp==0)
			{
				$vars->{$i}=&cleanText($seite->param($i));
			} else
			{
				$vars->{$key}=&cleanText(join(",",$seite->param($i)));
			}
#			&main::logge_int("$i = ".ref($seite->param($i)));
#			if(ref($i) eq "ARRAY")
#			{
#
#
#				if($#temp==0)
#				{
#					$vars->{$i}=&cleanText($seite->param($i));
#				}else
#				{
#					$vars->{$key}=&cleanText(join(",",$seite->param($i)));
#				}
#			} else
#			{
#				my $wert=$seite->param($i);
#				$vars->{$i}=&cleanText($wert);
#			}
		};
		if($@)
		{
			$vars->{$i}=&cleanText($seite->param($i));
		}
	}
	#exit;
	$vars=&checkCookies($vars);

	# Zufallszahl für aktuellen Prozeß
	$vars->{'_id'}=int(rand(10000000));
	{
		$vars->{'_id'}=int(rand(10000000));
	}

	$vars->{'todo'}=~s/[\/\.]//g;
	$vars->{'seite'}=~s/[\/\.]//g;
	return($vars);
}

sub checkCookies
{
	my $vars=shift;
	my %Cookies=&GetCookies();
	foreach my $i (%Cookies)
	{
		$Cookies{$i}=~s/<.*?>//g;
	}
	$vars->{'cookiestring'}='';
	$vars->{'_user'}='';

	if(length($Cookies{'kommentar_id'})>1)
	{
		$vars->{'_user_kommentar_id'}=$Cookies{'kommentar_id'};
	} else
	{
		$vars->{'_user_kommentar_id'}='';
	}

	if ($vars->{'todo'} eq "doLogout")
	{
   		&main::logge_int("LogOUT von $Cookies{'id'}");
		$vars->{'cookiestring'}.=&SetCookies("id",'');
		$vars->{'cookiestring'}.=&SetCookies("p",'');

		$vars->{'seite'}="start";
		delete($vars->{'todo'});
		my $antw="Content-type: text/html\n";
		$antw.="Location: /index.html\n";
		$antw.=$vars->{'cookiestring'}."\n\n";
		print $antw;
		#&main::logge_int("A: $antw");
		$vars->{'STOP'}=1;
		return $vars;
	}
	if((length($Cookies{'id'})<3 or !exists($Cookies{'id'})) and $vars->{'todo'} ne "doLogin")
	{
		$vars->{'_eingeloggt'}=0;
		return $vars
	}

	$vars->{'_user'}=$Cookies{'id'};
	$vars->{'_user'}=~s/[^0-9A-Za-z\-_]//g;

	my $cookieset=0;
	# Login?
	if ($vars->{'todo'} eq "doLogin")
	{
		# User möchte einloggen
		my $user=lc($vars->{'ud'});
		my $pass=$vars->{'pd'};

		my $status={};
		my $chead="";
		if(length($user)<5)
		{
			$status->{'status'}="0";
			$status->{'fehler_msg'}="Kein gültiger Username";
			$status->{'fehler_feld'}="login-user";
			$status->{'fehler_direkt'}="fehlertext";
		} elsif(length($pass)<4)
		{
			$status->{'status'}="0";
			$status->{'fehler_msg'}="Kein gültiges Passwort";
			$status->{'fehler_feld'}="login-pass";
			$status->{'fehler_direkt'}="fehlertext";
		} elsif(!-e "$main::master->{'_path_profiles'}/$user.profil")
		{
			$status->{'status'}="0";
			$status->{'fehler_msg'}="Kein gültiger User";
			$status->{'fehler_feld'}="login-user";
			$status->{'fehler_direkt'}="fehlertext";
		} else
		{
			my $ok=&main::socket(to_json({
				'todo'=>'doLogin',
				'nickname'=>$user,
				'passwort'=>$pass
			}));
			&main::logge_int("Antwort: $ok für $user / $pass");
			if($ok eq "0")
			{
				$status->{'status'}="0";
				$status->{'fehler_msg'}="Ungültiges Passwort";
				#$status->{'fehler_hilfe'}="Bitte überprüfe nochmal das Passwort, vielleicht hast du dich vertippt?";
				$status->{'fehler_feld'}="login-pass";
				$status->{'fehler_direkt'}="fehlertext";
			} elsif($ok<0)
			{
				$status->{'status'}="0";
				$status->{'fehler_msg'}="Ungültiges Profil";
				$status->{'fehler_feld'}="login-pass";
				$status->{'fehler_direkt'}="fehlertext";
			} else
			{
				$vars->{'cookiestring'}=&SetCookies("id",$user);
				$vars->{'cookiestring'}.=&SetCookies("p",$ok);
				$cookieset=1;
				$vars->{'_eingeloggt'}=1;
				$status->{'status'}="1";
				#$status->{'evl'}="\$.cookie('id','$user');\$.cookie('p','$ok');document.location.reload(true)";
				#$status->{'evl'}="document.location.reload(true)";
				$status->{'reload'}=1;
				$status->{'formersatz'}="<h3>Du bist nun erfolgreich eingeloggt</h3><p>Bitte einen Moment Geduld, Seite lädt neu ...</p>";
			}
		}
		#&main::logge_int("Status: $status");
		print "Content-type: text/html\n$vars->{'cookiestring'}\n\n".&to_json($status);
		exit;
	} elsif(exists($Cookies{'id'}) and defined($Cookies{'p'}) and $Cookies{'id'}!~/^gast\d+$/)
	{
		# Vorhandenen Cookie überprüfen
		my $ok=&main::socket(to_json({
			'todo'=>'checkLogin',
			'nickname'=>$Cookies{'id'},
			'code'=>$Cookies{'p'}
		}));
		#&main::logge_int("Checke ID $Cookies{'id'} / $Cookies{'p'} = $ok");
		if($ok!=1)
		{
			$vars->{'cookiestring'}=&SetCookies('p','');
			my $t=int(rand(100000)+1123);
			$vars->{'cookiestring'}.=&SetCookies('id',"gast$t");
			$vars->{'_eingeloggt'}=0;
			$vars->{'_user'}="gast$t";
			$vars=ladeKonfiguration($vars);
			$cookieset=1;
		} else
		{
			$vars=&ladeKonfiguration($vars);
			$vars->{'_eingeloggt'}=1;
		}
	} elsif(exists($Cookies{'id'}) and !defined($Cookies{'p'}) and $Cookies{'id'}=~/^gast\d+$/)
	{
		#&main::logge_int("!!!!!!!!!!!!!!!!!!! $Cookies{'id'}");
		$vars->{'_user'}=$Cookies{'id'};
		$vars->{'_eingeloggt'}=0;
	}  else
	{
		#&main::logge_int("########## $Cookies{'id'}");
		$vars->{'_eingeloggt'}=0;
		#$vars->{'_user'}='';
	}

	if(length($vars->{'_user'})<1)
	{
		my $t=int(rand(100000)+1123);
		if($cookieset<1)
		{
			#$vars->{'cookiestring'}.=&SetCookies('id',"gast$t");
			#$vars->{'cookiestring'}=&SetCookies('p','');
		}
		$vars->{'_eingeloggt'}=0;
		$vars->{'_user'}="gast$t";
		#$vars=ladeKonfiguration($vars);
	}

	$vars->{'_eingeloggt'}||=0;
	#&main::logge_int("UUUUUUUUUUUUUUUUUUUUUUUUU: $vars->{'_user'}");
	return($vars);
}



sub ladeKonfiguration
{
	my $vars=shift;
	# Konfiguration vorhanden?
	#warn("Lade Konfiguration $main::global{'_path_tmp'}/pro-file/$main::global{'USER'}.profil");
	if($main::MACHINE<1)
	{
		if (-e "$main::master->{'_path_tmp'}/pro-file/$vars->{'_user'}.profil")
		{
			eval{
				$vars->{'_config'}=Storable::lock_retrieve("$main::global{'_path_tmp'}/pro-file/$vars->{'_user'}.profil");
			};
		} elsif (-e "$main::master->{'_path_profiles'}/$vars->{'_user'}.profil")
		{
			warn("=================== Lade Profil $vars->{'_user'}!");
			eval{
				$vars->{'_config'}=Storable::lock_retrieve("$main::master->{'_path_profiles'}/$vars->{'_user'}.profil");
			};
			#`cp $main::global{'_path_profiles'}/$main::global{'USER'}.profil $main::global{'_path_tmp'}/pro-file/$main::global{'USER'}.profil`;
		}
	}
	return($vars);
}

sub saveKonfiguration
{
	if(!$main::MACHINE)
	{
		foreach my $i (keys %main::aus)
		{
			next if $i eq "f" or $i eq "fname" or $i eq "update" or $i eq "noupdate" or $i eq "modul";
			next if $i eq "args" or $i eq "modul_new" or $i eq "pjxrand";
			$main::config->{$i}=$main::aus{$i};
		}
		storeKonfiguration();
	}
}

sub storeKonfiguration
{
	my $c=shift;
	#Storable::lock_store($main::config,"/web/virtual/amtadmin/pro-file/$main::global{'USER'}.profil");
	return if $main::MACHINE>0;
	#Storable::lock_store($main::config,"$main::PFAD_TMP/pro-file/$main::global{'USER'}.profil");
	Storable::nstore($c->{'_config'},"$main::master->{'_path_profiles'}/$c->{'_user'}.profil");
}

# Erzeugt einen Startwert für den Zufallsprozessor
# anhand eines übergebenen Strings
sub makeZufallszahl
{
	my $string=shift;
	my $sr=0;
	foreach my $x (split(//,$string))
	{
		$sr+=ord($x);
	}
	srand($sr);
}

sub get404Text
{
	return <<EOF;
Status: 404 Not Found
Content-type: text/html\n\n
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
         "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title>404 - Not Found</title>
 </head>
 <body>
  <h1>404 - Not Found</h1>
 </body>

</html>
EOF
}

sub get410Text
{
	return <<EOF;
Status: 410 Gone
Content-type: text/html\n\n
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
         "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title>410 - Gone</title>
 </head>
 <body>
  <h1>410 - Gone</h1>
 </body>

</html>
EOF
}

sub showTemplate
{
	my $vars=shift;
	#warn("HOSSA: $vars->{'cookiestring'}");
	my $austausch={};
	my $glob={};

	my $akt=$vars->{'seite'} || $vars->{'todo'} || "start";

	my $template_text='';#=$main::cache->{'templates'}->{$akt} || "";

	#warn("OK1: $akt");
	&main::logge_int("OK2: $akt");
	if(length($template_text)<3)
	{
		$template_text=&hole_file("templates/$akt.tmpl");
		my $chr=chr(239).chr(187).chr(191);
		$template_text=~s/^$chr//;
	}
	if (!$template_text)
	{
		open(LE,">>/web/virtual/fb24svn/logs/error.log");
		print LE "showTemplate: $akt nicht gefunden ($ENV{'HTTP_REFERER'})!\n";
		close(LE);
		return($vars);
	}
	#&main::logge_int("============= 2b");
	while ($template_text=~s/\{\!(.*?)\!\}/X-_X-_X-_/s)
	{
		my $exec=$1;
		#&main::logge_int("============= EXEC:\n$exec");
		#my $text=encode_utf8(eval $exec);
		#&main::logge_int("EXEC: ".substr($exec,0,20)." ... ".substr($exec,length($exec)-20,20));
		my $text=(eval $exec);# || &main::logge_int("Fehler2 in $akt: $@",0);;
		if($@)
		{
			&main::logge_int("Fehler in $akt: $@",0);
		}
		#&main::logge_int("ERG: $text");
		$template_text=~s/X-_X-_X-_/$text/g;
	}
	#&main::logge_int("AAAA: ".$vars->{'leistungen'});
	#&main::logge_int("============= 2c");
	foreach my $i (keys %{$vars})
	{
		#&main::logge_int("A $i / $vars->{$i}");
		next if $i=~/\[\]/;
		$template_text=~s/##$i##/$vars->{$i}/g;# || &main::logge_int("Fehler bei $i");
		#&main::logge_int("B2");
	}

	foreach my $i (keys %{$austausch})
	{
		$template_text=~s/##$i##/$austausch->{$i}/g;
	}
	$template_text=&main::ersetze_inline($template_text);

	$vars->{'_html'}=&checkFormfelder($template_text,$vars,$austausch);


	# Interessante Links
	if ($vars->{'_html'}=~s/§§interessant;(.*?);(.*?)§§/jaksdfhue83/s)
	{
		my ($farbe,$text)=($1,$2);
		my $st="";
		if($text!~/pfeil|ip p_/)
		{
			foreach my $i (split(/\|/,$text))
			{
				my ($titel,$link)=split(/§/,$i);
				$st.="<i class='fa fa-arrow-circle-right text-$farbe'></i> <a href='$link' title='Zum Thema $titel'>$titel</a><br/>";
			}
		} else
		{
			$st.=$text;
		}
		$vars->{'_html'}=~s/jaksdfhue83/<div class='kasten $farbe'><h2>Verwandte Themen<\/h2><div class='text fb-container'>Vielleicht interessiert du dich auch für folgende Themen:<br\/><br\/>$st<\/div><\/div>/;
	}
	$vars->{'_html'}=~s/##.*?##//g;
	return($vars);
}

sub ersetze_inline
{
	my $text=shift;
	while($text=~s/§§artikellink;(.*?)§§/sdgiour/)
	{
		my($link,$foto,$titel,$desc)=split(/;/,$1);
		my $alt=&getArtikellink($link,$foto,$titel,$desc);
		$text=~s/sdgiour/$alt/;
	}
	return($text);
}

sub getArtikellink
{
	my($link,$foto,$titel,$desc)=@_;
	my $foto2=$foto;
	$foto2=~s/\./_button\./;
	if(-e "$main::master->{'_path'}/g/fotos/$foto2")
	{
		$foto=$foto2;
	} else
	{
		&main::logge_int("Hinweis: Kein Button-Foto gefunden für: $foto bei $ENV{'REQUEST_URI'}");
		$foto2=~s/_button/_klein/;
		if(-e "$main::master->{'_path'}/g/fotos/$foto2")
		{
			$foto=$foto2;
		} else
		{
			&main::logge_int("Hinweis: Kein kleines Foto gefunden für: $foto");
		}
	}
	if(length($desc)<5)
	{
		&main::logge_int("Hinweis: Kein _beschreibung_kurz bei $titel via bei $ENV{'REQUEST_URI'}");
	}
	#&main::logge_int("Suche1 $main::master->{'_path'}/g/fotos/$foto2");

	return	<<EOF;
<div class='artikellink' onclick='location.href="$link";'><div class='backimg' imgsrc='/g/fotos/$foto'></div><div class='info'><div class="desc v">$desc</div><div class='titel'>$titel</div></div></div>
EOF
#
}

sub getArtikellinkKlein
{
	my($link,$foto,$titel,$desc)=@_;
	my $foto2=$foto;
	$foto2=~s/\./_button\./;
	&main::logge_int("Suche2 $main::master->{'_path'}/g/fotos/$foto2");
	if(-e "$main::master->{'_path'}/g/fotos/$foto2")
	{
		$foto=$foto2;
	}
	return	<<EOF;
<div class='artikellink-klein' onclick='location.href="$link";'>
	<img class='backimg' src='/g/fotos/$foto'/>
	<div class='info'>
		<p class="hoveralls_text">$desc</p>
		<a class="hoveralls_link" href="$link" > </a>
		<div class='titel kasten-innen'>
		<b>$titel</b>
	</div>
	</div>
</div>
EOF
}

sub getKastenSideinfo()
{
	my($farbe,$titel,$links)=@_;
	my $tmp="";
	srand;
	my $rand=int(rand(10000));
	foreach my $i (split(/,/,$links))
	{
		next if length($i)<3;
		my($link,$titel,$badge)=split(/§/,$i);
		$tmp.="<i class='fa fa-arrow-circle-right text-$farbe'></i> <a href='$link'><b>$titel</b></a>";
		$tmp.=" $badge" if length($badge)>1;
		$tmp.="<br/>\n";
	}
	$tmp=~s/\n+/ /g;
	return <<EOF;
<section id="menu_$rand" class='kasten $farbe'>
	<h2>$titel</h2>
	<div class="text fb-container" style='line-height:26px;'>
		$tmp
	</div>
</section>
EOF
}

sub checkFormfelder
{
	my ($inhalt,$variable,$variable2)=@_;
	while($inhalt=~s/##liste;(.*?);(.*?)(;.*?)?(;.*?)?(;.*?)?##/JAIWEW23892J/)
	{
		my $feld=$1;
		my $werte=$2;
		my $size=$3||"5";
		my $width=$4;
		my $multiple=$5;
		my $tmp;
		$width=~s/^;+//g;
		$size=~s/^;+//g;
		$multiple=~s/^;+//g;
		$tmp="<select class='form-control' $multiple id='$feld' name='$feld' size='$size'";
		if($width>0)
		{
			$tmp.=" style='width:${width}px;'";
		}
		$tmp.=">\n";
		foreach my $i (split(/,/,$werte))
		{
			my($k,$v);
			if($i=~/§/)
			{
				($k,$v)=split(/§/,$i);
			} else
			{
				$k=$i;
				$v=$i;
			}
			$tmp.="<option value='$k'";
			#&main::logge_int("Suche $feld ($k) = $variable->{$feld} / $variable2->{$feld}");
			if($variable->{$feld}=~/$v/i or $variable2->{$feld}=~/$v/i)
			{
            		$tmp.=" selected='selected'";
			} elsif($variable->{$feld} eq $k or $variable2->{$feld} eq $k)
			{
				&main::logge_int("SELECTED");
            		$tmp.=" selected='selected'";
			}
			$tmp.=">$v</option>";
		}
		$tmp.="\n</select>\n";
      $inhalt=~s/JAIWEW23892J/$tmp/;
	}

	while($inhalt=~s/##select(x)?;(.*?);(.*?)(;.*?)?##/JAIWEW23892J/)
	{
		my $ohne_css=$1;
		my $feld=$2;
		my $werte=$3;
		my $js=$4;
		my $tmp;
		if(length($js)>0)
		{
			$js=~s/^;//;
			$js=" onchange=\"$js\"";
		}
		$tmp="<select ";
		if($ohne_css ne "x")
		{
			$tmp.="class='form-control' ";
		}
		$tmp.="id='$feld' name='$feld' size='1'$js>\n";
		foreach my $i (split(/,/,$werte))
		{
			$tmp.="<option value='$i'";
			if($variable->{$feld}=~/$i/ or $variable2->{$feld}=~/$i/)
			{
				$tmp.=" selected='selected'";
			}
			$tmp.=">$i</option>";
		}
		$tmp.="\n</select>\n";
		$inhalt=~s/JAIWEW23892J/$tmp/;
	}

	while($inhalt=~s/##checkboxes;(.*?);(.*?);(.*?)##/JAIWEW23892J/)
	{
		my $feld=$1;
		my @felder=split(/\//,$feld);
		$feld=$felder[$#felder];

		my $werte=$2;
		my $js=$3;
		my $tmp;
		my $css="mod";
		my $lfd=0;
		my $k_id=int(rand(10000));
		foreach my $i2 (split(/,/,$werte))
		{
			++$lfd;
			my ($i,$value)=split(/\/\//,$i2);
			$value||=$i;
			my $id=$feld.$lfd.$k_id;
			my $checked="";
			if($variable->{$feld}=~/$value/ or $variable2->{$feld}=~/$value/)
			{
				#&main::logge_int("T: $i = $variable->{$feld}");
				$checked=" checked='checked'";
			}
			$tmp.=<<EOF;
	<label class='anicheck' for="$id">
		<input type="checkbox" name="$feld" id="$id" value="$value"$checked/>
		<i></i> <span>$i</span>
	</label>
EOF
			next;
			$tmp.="\t<input ";
			$tmp.="onclick=\"$js('$i:',this.checked);\" " if length($js)>2;
			$tmp.="class='$css' " if length($css)>0;


			my $helpid=$lfd.$k_id;
			$tmp.="id='$feld$helpid' ";
			$tmp.="type='checkbox' name='$feld' value='$i'";
			if($variable->{$feld}=~/$i/ or $variable2->{$feld}=~/$i/)
			{
				#warn("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
				$tmp.=" checked='checked'";
			}
			$tmp.=" /><label for='$feld$lfd$k_id' class='l$css'>$i</label><br>\n";
		}
		$inhalt=~s/JAIWEW23892J/$tmp/g;
	}
	while($inhalt=~s/##radio;(.*?);(.*?);(.*?);(.*?)##/JAIWEW23892J/)
	{
		my $feld=$1;
		$feld=~s/&auml;/ä/g;
		my $werte=$2;
		my $js=$3;
		my $trenn=$4 || "<br>";
		my $tmp;
		my $lfd=0;
		my $k_id=int(rand(10000));
		foreach my $j (split(/,/,$werte))
		{
			my ($wert,$i)=split(/§/,$j);

			++$lfd;
			my $id=$feld.$lfd.$k_id;
			my $checked="";
			if($variable->{$feld}=~/$wert/i or $variable2->{$feld}=~/$wert/i)
			{
            	$checked=" checked";
			}
			$tmp.=<<EOF;
	<label class='anicheck' for="$id">
		<input type="radio" name="$feld" $checked id="$id" value="$wert"/>
		<i></i> <span>$i</span>
	</label>
EOF
			next;
			$i||=$wert;
			$tmp.="<input type=radio id='$feld' name='$feld' value='$wert'";

         $tmp.=">$i$trenn";
		}
      $inhalt=~s/JAIWEW23892J/$tmp/g;
	}
	return($inhalt);
}


sub checkLogin
{
	my ($user,$pass)=@_;
	#warn("Login: Check $user / $pass");
	if (length($user)<3)
	{
		return("Ung&uuml;ltiger Username");
	} elsif (length($pass)<3)
	{
		return("Ung&uuml;ltiges Passwort");
	} elsif (!-e "/web/virtual/amtadmin/daten/nick/".lc($user))
	{
		return("Falscher Username $user");
	} else
	{
		if (!-e "/web/virtual/amtadmin/pro-file/".lc($user).".profil")
		{
			return("Useraccount existiert nicht mehr");
		}
		my $temp=Storable::lock_retrieve("/web/virtual/amtadmin/pro-file/".lc($user).".profil");
		if(length($temp->{'pass'})<2)
		{
			my @t=SDBasic->hole_file("/web/virtual/amtadmin/daten/nick/".lc($user));
			$temp->{'pass'}=$t[0];
		}
      if ($temp->{'pass'} ne $pass)
      {
			return("Falsches Passwort!");
		} else
		{
			# Alles stimmt, neues Cookie setzen
         #&warne("Setze neues Cookie: $main::aus{'user'} / $user");
			&SetCookiePath("/");
			&SetCookieExpDate("Thu, 31-May-2012, 12:00:00 GMT");
			&SetCookies('myinfo2_id',$user);
			#my $eol = $temp->{'pass'};
			#	  chomp $eol;
			#	  require Digest::MD5;
			#	  import Digest::MD5 qw(md5_base64);
			#&SetCookies('myinfo2_p',md5_base64($eol));
			#$main::global{'USER'}=$main::aus{'user'};
			return(1);
		}
	}
}

sub checkdir()
{
	my $pfad=shift;
	if(!-e "/web/virtual/baby/community/members/$pfad")
	{
		mkdir("/web/virtual/baby/community/members/$pfad",0777);
	}
}


sub save_tmp_session
{
   srand;
	my $r=int(rand(100000000));
	while(-e "$main::global{'_path_tmp'}/sess_$r")
	{
		$r=int(rand(100000000));
	}
	Storable::store(\%main::aus,"$main::global{'_path_tmp'}/sess_$r");
	return($r);
}

sub systemmeldung
{
	my ($msg,$from,$subject,$datei)=@_;
	$subject||="Systemmeldung";
	$from||="Allgemein";
#	if(length($datei)>2)
#	{
#		$from.='@familienbande24.de' if $from!~/\@/;
#		$subject=$subject;
#		$msg=encode_utf8($msg);
#
#		 SDBasic->sensmail(
#			  from=>"$from",
#				to=>'support@nettz.de',
#				subject=>$subject,
#				message=>$msg,
#				datei=>["$datei"]
#		);
#	} else
#	{
		$from.='@familienbande24.de' if $from!~/\@/;
		#$msg=decode_utf8($msg);
		#$subject=decode_utf8($subject);
		eval {
			#&main::logge_int("Sende Systemmeldung: $from => $subject\n$msg\n\nFile: $datei");

		};

		my $attachement={};
		if(length($datei)>2)
		{
			$datei=~/^.*\/(.*?)$/;
			$attachement->{$1}->{'file'}=$datei;
			$attachement->{$1}->{'ctype'}='image/jpg',
			&main::logge_upload("Datei: $datei = $1");
		}
		email({
				'to'=>'support@nettz.de',
				'from'=>$from,
				'smtp'=>'localhost',
				'charset'=>'UTF-8',
				#'charset'=>'ISO-8859-1',
				'_attachments'=>$attachement,
				'subject'=>$subject,
				'_text'=>$msg,
#				'_text_info' => {
#					charset=>'UTF-8'
#				}
			}) or die "email() failed: $@";

		# Kopie an Mods?
#		if($subject=~/Vornamenerweiterung/)
#		{
#			email({
#				'to'=>'jasmina@familienbande24.de',
#				'from'=>$from,
#				'smtp'=>'127.0.0.1',
#				'charset'=>'UTF-8',
#
#				'subject'=>$subject,
#				'_text'=>$msg
#			}) or die "email() failed: $@";
#		}
		 #SDBasic->sensmail2(
		#	from=>"$from",
		#	to=>'support@nettz.de',
		#	subject=>$subject,
		#	message=>$msg
		#);
#	}
}


sub systemmeldung2
{
	my ($msg,$from,$subject,$datei)=@_;
	$subject||="Systemmeldung";
	$from||="Allgemein";
	$from.='@familienbande24.de' if $from!~/\@/;
	email({
		'to'=>'support@nettz.de',
		'from'=>$from,
		'smtp'=>'localhost',
		#'charset'=>'UTF-8',
		'charset'=>'ISO-8859-1',
		'subject'=>$subject,
		'_text'=>$msg
	}) or die "email() failed: $@";
}

sub systemmeldung_utf8
{
	my ($msg,$from,$subject,$datei)=@_;
	$subject||="Systemmeldung";
	$from||="Allgemein";
	$from.='@familienbande24.de' if $from!~/\@/;
	email({
		'to'=>'support@nettz.de',
		'from'=>$from,
		'smtp'=>'localhost',
		'charset'=>'UTF-8',
		#'charset'=>'ISO-8859-1',
		'subject'=>$subject,
		'_text'=>$msg
	}) or die "email() failed: $@";
}

sub db_connect
{
	my ($lokal,$force)=@_;
	if($main::ZWANG_LOKAL and !$force)
	{
		$lokal=1;
	} else
	{
		$lokal=0;
	}
	#&main::logge_int("Lokal/Force: $lokal/$force");
	if(!defined($main::DB))
	{
		if((!defined($main::DB) and !$lokal) or ($force>0 and $lokal<1))
		{
			&main::logge_int("DB-Connect extern");
			#$main::DB=Mysql->connect("www.familienbande24.de","baby","baby","meine-fb-db");
			$main::DB=Mysql->connect("212.114.34.206","baby","baby","meine-fb-db");
			#$main::DB=Mysql->connect("192.168.1.15","baby","baby","meine-fb-db");
			$main::DB->query("SET NAMES utf8");
		} elsif($lokal>0)
		{
			&main::logge_int("DB-Connect INTERN");
			#$main::DB=Mysql->connect("212.114.34.206","baby","baby","meine-fb-db");
			$main::DB=Mysql->connect("192.168.1.15","baby","baby","meine-fb-db");
			$main::DB->query("SET NAMES utf8");
		}
	}
}

sub mischeListe{
	my @liste=@_;
	if($#liste>0)
	{
      for(my $i = @liste; --$i; ){
			my $j = int rand ($i+1);
			next if $i == $j;
			@liste[$i,$j] = @liste[$j,$i];
		}
	}
	return(@liste);
}

sub getFileCache
{
	my ($file,$encode,$reverse)=@_;

	if(!exists($filecache->{$file}) or $main::CACHE_AKTIV<2)
	{
		#warn("Lade $file");
		my @temp=();
		if($besucher->{$ENV{'REMOTE_ADDR'}}->{'gast'}>0)
		{
			my $fg=$file;
			$fg=~s/^(.*)\/(.*?)\.tmpl$/$1\/gast_$2.tmpl/;
			if(-e $fg)
			{
				$file=$fg;
			}
		}

		if(-e $file)
		{
			open(MI,"<$file");
			while(my $zeile=<MI>)
			{
				next if length($zeile)<2;
				chop($zeile);
				if(defined($encode) and $encode eq "utf8")
				{
					$zeile=encode_utf8($zeile)
				}
				push(@temp,$zeile);
			}
			close(MI);
			if($reverse)
			{
				@temp=reverse(@temp);
			}
		} else
		{
			#warn("subs2.pl: getFileCache: $file existiert nicht");
		}
		$filecache->{$file}=\@temp;
		return(\@temp);
	} elsif($main::CACHE_AKTIV>1)
	{
#		warn("File $file gecacht: $main::STAT{'filecache_cache'}->{$file}");
		++$main::STAT{'filecache_cache'}->{$file};
	}
	$filecache->{$file};
}

sub hole_file_alt
{
	my ($file,$encode)=@_;
	#open(MI,"<:utf8","$file");
	open(MI,"<$file");
	my @temp;
	while(my $zeile=<MI>)
	{
		next if length($zeile)<2;
		chop($zeile);
		#if(defined($encode) and $encode eq "utf8")
		#{
			#$zeile=encode_utf8($zeile);
		#}
		#push(@temp,decode_utf8($zeile));
		push(@temp,$zeile);
	}
	close(MI);
	return(@temp);
}

sub eingabe
{
	my($daten,%form);
	read (STDIN, $daten, $ENV{'CONTENT_LENGTH'});

	$daten.="&".$ENV{'QUERY_STRING'};
	#warn("Lese $ENV{'CONTENT_LENGTH'} / $daten");
	if(@ARGV)
	{
		$daten.="&".$ARGV[0];
	}

	#$daten||=;
	foreach my $satz (split(/&/,$daten))
	{
		my ($name,$wert) = split(/=/, $satz);
		$wert =~ tr/+/ /;
		$wert =~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
		my $temp=chr(12);
		$wert=~s/$temp/\n/g;

		$name =~ tr/+/ /;
		$name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
		if(exists($form{$name}))
		{
			$form{$name}.=",$wert";
		} else
		{
			$form{$name}=$wert;
		}
	}
	return (%form);
}

sub zeit
{
	# Liefert eine Hash-Variable mit 2 Keys zurck:
	# $zeit{'uhr'}
	# $zeit{'datum'}
	my %azeit;
	my @z=localtime;
	$z[4]++;
	foreach my $i (@z) { $i="0$i" if length($i)<2; }
	$z[5]=(1900+$z[5]);
	$azeit{'datum'}="$z[3].$z[4].$z[5]";
	$azeit{'uhr'}="$z[2]:$z[1]:$z[0]";
	$azeit{'HH'}=$z[2];
	$azeit{'MIN'}=$z[1];
	$azeit{'TT'}=$z[3];
	$azeit{'MM'}=$z[4];
	$azeit{'JJJJ'}=$z[5];
	$azeit{'jahr'}=$z[5];
	return \%azeit;
}

sub zeitWort()
{
	my ($start,$uhr)=@_;
	use Date::Calc;
	my @temp;
	my $zeit=&zeit;

	return("$start $uhr") if $uhr!~/^\d\d:\d\d:\d\d/;
    #eval{
    	#warn("Y: $start $uhr");
    	@temp=Date::Calc::Delta_YMDHMS(
    		reverse(split(/\./,$start)),
    		split(/:/,$uhr),
    		$zeit->{'JJJJ'},$zeit->{'MM'},$zeit->{'TT'},
    		split(/:/,$zeit->{'uhr'})
    	);

    	#&main::logge_int("XXXXX: = @temp");
    	if($temp[0]>1)
    	{
    		return("Vor $temp[0] Jahren");
    	} elsif($temp[0]==1)
    	{
    		return("Letztes Jahr");
    	} elsif($temp[1]>1)
    	{
    		return("Vor $temp[1] Monaten");
    	} elsif($temp[1]==1)
    	{
    		return("Letzter Monat");
    	} elsif($temp[2]>25)
    	{
    		return("Vor fast einem Monat");
    	} elsif($temp[2]<24 and $temp[2]>17)
    	{
    		return("Vor drei Wochen");
    	} elsif($temp[2]<=17 and $temp[2]>11)
    	{
    		return("Vor zwei Wochen");
    	} elsif($temp[2]<=11 and $temp[2]>6)
    	{
    		return("Letzte Woche");
    	} elsif($temp[2]>4)
    	{
    		return("Vor einigen Tagen");
    	} elsif($temp[2]>1)
    	{
    		return("Vor $temp[2] Tagen");
    	} elsif($temp[2]==1)
    	{
    		return("Gestern");
    	} elsif($temp[3]==1)
    	{
    		return("Vor einer Stunde");
    	} elsif($temp[3]>1)
    	{
    		return("Vor $temp[3] Stunden");
    	}  elsif($temp[4]>25 and $temp[4]<35)
    	{
    		return("Vor einer halben Stunde");
    	}  elsif($temp[4]>3)
    	{
    		return("Vor $temp[4] Minuten");
    	} else
    	{
    		return("eben gerade");
    	}

    	#return $span->format_duration($dur); # 1 year, 2 months, 3 minutes, and 1 second
   # };
    #warn("FEHLER: $start / $uhr =  $@");
    return("$start $uhr");

  #  print $span->format_duration_between($dta, $dtb);
}


sub loescheCache
{
	my $wo=shift;
	my $was1=shift;
	my $was2=shift;
	#warn("Lösche Cache $wo / $was1 / $was2");
	if($wo eq "vorname")
	{
		if(exists($main::cache->{'vorname'}->{'details'}->{$was1}->{$was2}))
		{
			warn("RAM gelöscht");
			delete($main::cache->{'vorname'}->{'details'}->{$was1}->{$was2});
		} else
		{
			warn("Nicht im RAM! $was1 / $was2");
		}
		if(-e "/rd/vornamen_${was1}_$was2.idx")
		{
			unlink("/rd/vornamen_${was1}_$was2.idx");
			warn("Aus /rd gelöscht");
		} else
		{
			warn("Nicht auf /rd gefunden");
		}
	}
}


sub logge_alt
{
	my ( $user, $dom, $msg ) = @_;
	open( DO, ">>$main::global{'_path_data'}/master.log" );
	print DO "$main::global{'zeit'}->{'datum'}\t$main::global{'zeit'}->{'uhr'}\t$user\t$dom\t$msg\n";
	close(DO);
}

sub finish
{
	my $vars=shift;
	# Userprofil speichern?
	if ( $vars->{'_todo_userconfigsave'} == 1 )
	{
		&storeKonfiguration($vars);
	}
	if($main::VERBOSE>20)
	{
		exit(1);
	}
	if($main::ZWANG_LOKAL>0)
	{
		#&main::logge_int("TT");
		exit;
	}
	exit;
	$vars={};
}

sub hole_file
{
	my ($file,$enc)=@_;
	local $/;
	$enc||="utf8";
	open(my $hlf,"<",$file) || warn("hole_file: $file = $!");
	my $s=<$hlf>;
	close($hlf);
	return($s);
}

sub getText
{
	my($text,$thema)=@_;

	$thema||="0";
	my $akt;
	my $antwort={};
	my @themen;
	my $lfd=-1;
	my $akt_id=0;
	my $akt_seite=0;
	my $seitenname;
	my $nobr=0;

	my $t=join("\n",&hole_file("$main::master->{'_path_data'}/texte/$text.txt"));

	while ($t=~s/\{\!(.*?)\!\}/X-_X-_X-_/s)
	{
		my $exec=$1;
		foreach my $i (keys %main::TEMP)
		{
			$exec=~s/##$i##/$main::TEMP{$i}/g
		}
		my $text='';
		if(length($exec)>0)
		{
			$text=encode_utf8(eval $exec);
			if($@)
			{
				warn("Fehler in $text: $@\nReferer: $ENV{'HTTP_REFERER'}");
			}
		}
		$t=~s/X-_X-_X-_/$text/g;
	}

	foreach my $i (split(/\n/,$t))
	{
		if($i=~/^\[(.*?)\]/)
		{
			$akt=$1;

			# Konfigurationseinstellung?
			if($akt!~/^_/)
			{
				# Nein, also eine Seiten-ID?
				if($akt=~/page:(.*?)$/)
				{
					my ($seitenname,$desc,$foto,$fotowidth,$fotokommentar)=split(/§/,$1);
					++$akt_seite;
					$antwort->{'seiten'}->{$akt_seite}->{'titel'}=$seitenname;
					$antwort->{'seiten'}->{$akt_seite}->{'_foto'}=$foto;
					$antwort->{'seiten'}->{$akt_seite}->{'_desc'}=$desc;
					$antwort->{'seiten'}->{$akt_seite}->{'_foto_breite'}=$fotowidth;
					$antwort->{'seiten'}->{$akt_seite}->{'_foto_kommentar'}=$fotokommentar;
				} else
				{
					# sonst ist es eine Themenüberschrift
					#warn("O: $akt_seite / $akt");
					if($akt_seite>0)
					{
						#++$subakt;
						push(@{$antwort->{'seiten'}->{$akt_seite}->{'themen'}},$akt);
					} else
					{
						# Wenn alles auf eine Seite, direkt in den Themen-Array
						push(@{$antwort->{'themen'}},$akt);
					}
				}
				++$lfd;
			}
			next;
		}
		#exit;
		$akt_id=$lfd if($akt eq $thema) or ($lfd==$thema);
		$i=~s/\s+$//;
		$nobr=1 if($i=~/<script/);
		$nobr=0 if($i=~/<\/script/);
		$i.="<br/>" if $i!~/>$/ and $akt!~/^_/ and $nobr<1;
		$i.="X\n" if $nobr>0;
		#warn("Y: $subakt$akt");
		if($akt_seite>0)
		{
			$antwort->{"$akt_seite$akt"}.="$i\n";
		} else
		{
			$antwort->{$akt}.=$i;
		}
	}
	foreach my $i (sort keys %{$antwort})
	{
		#next if $i=~/^_/;
		$antwort->{$i}=~s/(<br\/>)+$//;
		foreach my $j (keys %main::TEMP)
		{
			$antwort->{$i}=~s/##$j##/$main::TEMP{$j}/g
		}
	}
	$antwort->{'_farbe'}||="rosa";

	return($antwort);
}


# Blendet einen Info-Kasten ein, in dem über die Qualität des Artikels
# abgestimmt werden und man Zugriffe etc. anschauen kann.

sub makeSeitenvote
{
	my $vorgabe=shift;
}

sub makeTextlike
{
	my $vorgabe=shift;

	#
	# Container für Voting+Seiteninfos
	#
	my $string=<<EOF;
<div id='seitenvote' class='kasten $vorgabe->{'farbe'}'>
    <h2>Diese Seite bewerten</h2>
	<div class='fb-container text'>
		<div id='herzen' class='ttpr' onclick="voteText('$vorgabe->{'thema'}','$vorgabe->{'sid'}');" title='Klicke hier, wenn dir diese Seite geholfen oder gefallen hat!'>
        	<div id='herzen-counter'>$vorgabe->{'likes'}</div>
        </div>
        <div class='social-vote tc'>
        	<br/><br/>
        	<span class='kommentar schrift-gross'><i>Social Links kommen in Kürze ...</i></span>
        </div>
	</div>
</div>
EOF
	return($string);
}

sub makeKommentareDisquas
{
	my $vorgabe=shift;
	my $string=<<EOF;
	<div class='kasten $vorgabe->{'farbe'}' id='cont_kommentare'>
		<h2>$vorgabe->{'titel'}</h2>
		<div class='fb-container text'>
			Unsere Kommentarfunktion wird derzeit überarbeitet und ist daher leider zur Zeit nicht verfügbar.
		</div>
	</div>
EOF
	#return($string);
	$string=<<EOF;
<div class='kasten $vorgabe->{'farbe'}' id='cont_kommentare'>
	<h2>$vorgabe->{'titel'}</h2>
	<div class='fb-container text'>
		$vorgabe->{'desc'}
		<div id="disqus_thread"></div>
		<script type="text/javascript">
		    var disqus_shortname = 'familienbande24';
		    var disqus_identifier = '$vorgabe->{'titel_artikel'}';
		    var disqus_title = '$vorgabe->{'titel_artikel'}';
		    (function() {
		        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
		        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		    })();
		</script>
		<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
	</div>
</div>
EOF
	return($string);
}

sub makeKommentare
{
	my $vorgabe=shift;
	my $vars=shift;
	my $smileys;

	my $anz_k=0;
	my $anz_r=0;

	my($komm_html,$kommentare);
	my $erg=&main::socket(to_json({
		'todo'		=> 'getKommentare',
		'thema'	=> $vorgabe->{'thema'},
		'subthema'	=> $vorgabe->{'subthema'},
	}));
	#my $string_anzahl="";
	my $maxid;
	if($erg==-1)
	{
		my @temp=&mischeListe("Noch keine Beiträge in dieser Diskussion","Es sind noch keine Kommentare vorhanden","Leider sind noch keine Kommentare vorhanden","Noch niemand hat eine Nachricht hinterlassen","Diese Diskussion ist noch leer","Diese Diskussion ist leider noch leer");
		$komm_html=shift(@temp);
	} else
	{
		$kommentare=from_json($erg);
		$kommentare->{'voting'}->{'stimmen'}||=123;

		my $template_kommentar=&main::hole_file("$main::master->{'_path_templates'}/sub/kommentare/kommentar.tmpl");
		use LWP::Simple;
		foreach my $kid (sort {$a<=>$b }keys %{$kommentare->{'kommentare'}})
		{
			$kommentare->{'kommentare'}->{$kid}->{'voting'}->{'stimmen'}||="0";

			my $text=$template_kommentar;
			$maxid=$kid if $kid>$maxid;
			$text=~s/##kid##/$kid/g;
			$text=~s/##thema##/$vorgabe->{'thema'}/g;
			$text=~s/##stimmen##/$kommentare->{'kommentare'}->{$kid}->{'voting'}->{'stimmen'}/g;
			$text=~s/##user_md5##/$kommentare->{'kommentare'}->{$kid}->{'user_md5'}/g;

			my $hex=$kommentare->{'kommentare'}->{$kid}->{'user_md5'};

			if(!defined($main::cache->{'gravatar'}->{$hex}) && !-e "$main::master->{'_path'}/g/grav/$hex.png")
			{
				LWP::Simple::getstore("https://www.gravatar.com/avatar/$hex?s=80&d=wavatar","$main::master->{'_path'}/g/grav/$hex.png");
				$main::cache->{'gravatar'}->{$hex}=1;
			}

			my $depth=0;
			$text=~s/##depth##/$depth/g;

			my $autor=$kommentare->{'kommentare'}->{$kid}->{'user'};
			if($kommentare->{'_user'}->{$autor}->{'anz_kommentare'}>1)
			{
				$text=~s/##user_beitraege##/$kommentare->{'_user'}->{$autor}->{'anz_kommentare'} Beiträge/;
			} else
			{
				$text=~s/##user_beitraege##/1 Beitrag/;
			}
			$text=~s/##text##/$kommentare->{'kommentare'}->{$kid}->{'text'}/;
			$text=~s/##user##/$kommentare->{'kommentare'}->{$kid}->{'user'}/g;
			$text=&main::wandelSmileys($text);

			my $user_kurz=$autor;
			if(length($user_kurz)>11)
			{
				$user_kurz=substr($user_kurz,0,9)."...";
			}
			$text=~s/##user_kurz##/$user_kurz/g;

			$text=~s/##zeit##/$kommentare->{'kommentare'}->{$kid}->{'zeit'}/eg;
			$text=~s/##zeit_el##/ucfirst($kommentare->{'kommentare'}->{$kid}->{'zeit_el'})/eg;
			my $funkt="";
			my $link="";
			#&main::logge_int("A: $kommentare->{'kommentare'}->{$kid}->{'user'}");
			#&main::logge_int("B: $vars->{'_user_kommentar_id'}");
			if($kommentare->{'kommentare'}->{$kid}->{'user'} eq $vars->{'_user'} or $vars->{'_user_kommentar_id'} eq $kommentare->{'kommentare'}->{$kid}->{'user'})# or exists(($kommentare->{'kommentare'}->{$kid}->)
			{
				#$funkt="<a href='javascript:void(0);' class='v' onclick='delEintrag($kid);'><i class='fa fa-remove'></i>  Eintrag löschen</a>";
				$text=~s/##vote_up##/<br\/>/;
			} else
			{
				$funkt="<a href='javascript:void(0);' class='v' onclick='meldeEintrag($kid);' title='Dieser Eintrag ist Pfui und gehört gelöscht? Klick hier um den Text zu melden'><i class='fa fa-bug'></i> Desinfizieren!</a>";
				$link="<a href='javascript:void(0);' class='v' onclick='KommentarAntwort(\"kommentar-$kid\");\$(this).addClass(\"hidden\");' id='button-antwort-$kid' title='Du möchtest auf diesen Beitrag antworten? Klicke hier!'><i class='fa fa-reply'></i> Deine Antwort</a>";

				my $dum="<div onclick=\"voteKommentar('v','$vorgabe->{'thema'}','$kid','+1','$vorgabe->{'subthema'}')\" class='vote fa fa-chevron-up ttpg' style='color:#008800;margin-bottom:8px;' title='Das ist ein guter Beitrag!'></div>";
				$text=~s/##vote_up##/$dum/;
				$dum="<div onclick=\"voteKommentar('v','$vorgabe->{'thema'}','$kid','-1','$vorgabe->{'subthema'}')\" class='vote fa fa-chevron-down ttpg' style='color:#880000' title='Kein guter Beitrag :('></div>";
				$text=~s/##vote_down##/$dum/;
			}
			$text=~s/##funktionen##/$funkt/;
			$text=~s/##link-antwort##/$link/;

			my $kh;
			if(exists($kommentare->{'kommentare'}->{$kid}->{'parent'}) && length($kommentare->{'kommentare'}->{$kid}->{'parent'})>0)
			{
				my $parent=$kommentare->{'kommentare'}->{$kid}->{'parent'};
				$parent=~s/^kommentar-//;
				#&main::logge_int("Parent: $kid / $kommentare->{'kommentare'}->{$kid}->{'parent'}");
				++$anz_r;
				$text=~s/##mix##//;
				$komm_html=~s/(§§antworten $parent§§)/$text\n$1/;

			} else
			{
				++$anz_k;
				$text=~s/##mix##/mix/;
				$komm_html.=$text;

			}
		}
	}
	$komm_html=~s/§§antworten \d+§§//g;

	$anz_k||="Keine";
	$anz_r||="noch keine";

	my $anzahl_text="";
	if($anz_k>1)
	{
		$anzahl_text=$anz_k." Kommentare";
	} elsif ($anz_k==1)
	{
		$anzahl_text=$anz_k." Kommentar";
	} else
	{
		$anzahl_text="Noch keine Kommentare";
	}
	if($anz_r>1)
	{
		$anzahl_text.=", $anz_r Reaktionen";
	} elsif ($anz_r==1)
	{
		$anzahl_text.=" und eine Reaktion";
	} elsif($anz_r>0)
	{
		$anzahl_text.=" und noch keine Reation";
	}


	$kommentare->{'voting'}->{'stimmen'}||="0";

	$vorgabe->{'titel'}||="Meinungen, Feedback und Kommentare";
	#$komm_html="";

	# Zufallstext für Anzahl der Kommentare
	my @zufall=&mischeListe("Gerade wurde ein neuer Kommentar geschrieben","Es ist ein neuer Kommentar vorhanden");
	my $kom1=shift(@zufall);
	@zufall=&mischeListe("neue Kommentare sind vorhanden","neue Kommentare angekommen","neue Kommentare da");
	my $kom2=shift(@zufall);

#<script type='text/javascript'>
#	var last=0;
#	var mid=$maxid;
#
#	\$(document).ready(function()
#	{
#		setInterval("updateKommentare();",5000);
#	});
#
#	function updateKommentare()
#	{
#		var e=\$.post("/fb.fcgi",{todo:'getUpdate',sub:'kommentare','last':last,thema:'$vorgabe->{'thema'}'},function(data)
#		{
#			var erg=eval("("+data+")");
#			if(erg['status']==1)
#			{
#				last=erg['last'];
#				var anz=0;
#				for (var e in erg['kommentare'])
#				{
#					var p=parseInt(\$('#kommentar-punkte-'+e).html());
#					var pn=parseInt(erg['kommentare'][e]['voting']['stimmen']);
#					if(p>pn)
#					{
#						\$('#kommentar-punkte-'+e).fadeOut().html(pn).fadeIn();
#						highlight(\$('#kommentar-punkte-'+e).parent(),"#44cc44");
#					} else if(p<pn)
#					{
#						\$('#kommentar-punkte-'+e).fadeOut().html(pn).fadeIn();
#						highlight(\$('#kommentar-punkte-'+e).parent(),"#cc4444");
#					}
#					anz++;
#				}
#				if(anz>\$('#kommentare li').length)
#				{
#					var tx="<span class='fa fa-info-circle'></span>&nbsp;&nbsp;&nbsp;&nbsp;";
#					var anz_neu=(anz-\$('#kommentare li').length);
#					if(anz_neu>1)
#					{
#						tx+="Es sind "+anz_neu+" $kom2";
#					} else
#					{
#						tx+="$kom1";
#					}
#					var z=Math.random()*10000;
#					var l="\\"location.href='$ENV{'DOCUMENT_NAME'}?z="+z+"#kommentar-"+mid+"'\\"";
#					tx+=" &nbsp;&nbsp;&nbsp;&nbsp;<a class='ic_$vorgabe->{'farbe'}' onclick="+l;
#					\$('#kommentar-update-info').html(tx+"\\"'>Zeigen</a>").slideDown(2000).fadeIn(1000);
#				}
#			}
#		});
#	}
#</script>
	my $login='';
	my $img_avatar='';

	if($vars->{'_eingeloggt'}<1)
	{
		$login="<span class='font-sm text-muted'>Dein Name: (oder <a href='javascript:void(0);' onclick='showLogin();'>Login</a>)</span><input name='name' id='name' minlength='5' maxlength='30' class='form-control required' value='$vars->{'_user_kommentar_id'}' placeholder='Bitte gib deinen Namen ein'>";
		if(length($vars->{'_user_kommentar_id'})>2)
		{
			my $hex=md5_hex($vars->{'_user_kommentar_id'});
			if(!defined($main::cache->{'gravatar'}->{$hex}) && !-e "$main::master->{'_path'}/g/grav/$hex.png")
			{
				LWP::Simple::getstore("https://www.gravatar.com/avatar/$hex?s=80&d=wavatar","$main::master->{'_path'}/g/grav/$hex.png");
				$main::cache->{'gravatar'}->{$hex}=1;
			}
			$img_avatar="/g/grav/$hex.png";
		} else
		{
			$img_avatar="/g/grav/empty.png";
		}
	} else
	{
		$login="<p><span class='text-muted'>Du schreibst als:</span> <b>$vars->{'_user'}</b></p>";
		my $hex=md5_hex($vars->{'_user'});
		$img_avatar="https://www.gravatar.com/avatar/$hex?s=80&d=wavatar";
	}
	my ($head,$foot);
	if(!$vorgabe->{'no_kasten'})
	{
		$head=<<EOF;
	<div id='kommentare' class='kasten $vorgabe->{'farbe'}'>
	    <h2>$vorgabe->{'titel'}</h2>
		<div class='fb-container text'>
EOF
		$foot="</div></div>";
	}
	#&main::logge_int("Thema: $vorgabe->{'subthema'}");
	my $string=<<EOF;
<!-- Container für Kommentarfunktion-->
$head
		$vorgabe->{'text_einleitung'}
		<div class='clearfix'>

			<!-- Prototyp-Container für neuen Eintrag -->

			<hr noshade>
			<div id='kommentar-update-info' class='v'></div>
			<div class='pull-right'>
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> Älteste oben <span class="caret"></span></button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li id='sk_nu'><a href="javascript:void(0);" onclick="sortKommentare('nu');">Älteste oben</a></li>
					    <li id='sk_no'><a href="javascript:void(0);" onclick="sortKommentare('no');">Neueste oben</a></li>
					    <li role="separator" class="divider"></li>
					    <li id='sk_bo'><a href="javascript:void(0);" onclick="sortKommentare('bo');">Bestbewertete oben</a></li>
					    <!--li id='sk_bu'><a href="javascript:void(0);" onclick="sortKommentare('bu');">Bestbewertete unten</a></li-->
					  </ul>
				</div>
			</div>
			<h4 id='kommentar-counter-text'>$anzahl_text</h4>
			<!-- Hier beginnen die Kommentare -->

			<!-- Zunächst noch ein Container -->

			<ul class='liste-kommentare' id='liste-kommentare'>
				<div class='cont_kommentare-neu'></div>
				$komm_html

			</ul>
			<hr noshade>
			<div class='well well-sm text-muted'>
				<div class='pull-left font-xxlg' style='margin-right:8px;'><i class='fa fa-info-circle'></i></div>
				Jeder kann sich an unserer Diskussion beteiligen! Gib einfach deinen Kommentar und deinen (Fantasie-)Namen ein. Wir behalten uns vor, Einträge bei Verstößen gegen die Netiquette zu löschen!
			</div>
			<div id='proto-direkt-login' style='display:block;' class="form-container">
				<form class='validieren' accept-charset="UTF-8">
			        	<input type='hidden' name='todo' value='saveKommentar'/>
			        	<input type='hidden' name='zusatz' value='kommentar'/>
			        	<input type='hidden' name='parent' id='parent' class='f_parent' value=''/>
			        	<input type='hidden' name='thema' value='$vorgabe->{'thema'}'/>
			        	<input type='hidden' name='subthema' value='$vorgabe->{'subthema'}'/>

					<div class='row'>
						<div class='col-xs-2 text-right'>
							<img id='ncmt_av' src="$img_avatar" style='width:80%' class='foto'/>
				        	</div>
			        		<div class='col-xs-10'>
			            		<div class='row'>
			            			<div class='col-xs-6'>
					          		<span class='font-sm text-muted string_text'>Dein Text:</span>
					          	</div>
					          	<div class='col-xs-6 text-right'>
					          		<a onclick=\"insSmi(':)','text');\"><img src='/g/smileys/smiley.png' style='border:0px;' title='Klick um Smiley einzufügen'/></a>
					          		<a onclick=\"insSmi('P)','text');\"><img src='/g/smileys/wink.png' style='border:0px;' title='Klick um Smiley einzufügen'/></a>
					          		<a onclick=\"insSmi(':{','text');\"><img src='/g/smileys/cry.png' style='border:0px;' title='Klick um Smiley einzufügen'/></a>
					          		<a onclick=\"insSmi('8)','text');\"><img src='/g/smileys/cool.png' style='border:0px;' title='Klick um Smiley einzufügen'/></a>
					          		<a onclick=\"insSmi(':[','text');\"><img src='/g/smileys/angry.png' style='border:0px;' title='Klick um Smiley einzufügen'/></a>
					          		<div class='hidden'><span class='font-sm text-muted'>Smiley einfügen:</span> <i class='fa fa-smile-o'></i></div>
					          	</div>
					          </div>
			            		<textarea name='text' id='text' minlength='10' maxlength='1000' class='dynamisch required form-control kommentar-textfeld' placeholder='Hinterlasse eine Nachricht, Frage oder Anmerkung ...'></textarea>
			            		<div id='btn_comm_sbm'>
				            		<div class='pull-right'>
					            		<div class='text-right'>
					            			<button type='submit' class='btn button-$vorgabe->{'farbe'} button_km_sbm'><i class='fa fa-check'></i> Kommentar speichern</button>
					            		</div>
								</div>
								$login
							</div>
			            	</div>
					</div>
		           </form>
		        </div>
		</div>
$foot
EOF
	return($string);
}

sub check_no_utf8
{
	my $text=shift;
	#if($text=~/Ã¶|Ã¼/)
	if($text=~/[äöüéáèàß]/)
	{
		#warn("Text hat UTF8!");
		#$text=decode_utf8($text);
	}
	if($text=~/Ã¶|Ã¼/)
	{
		#warn("Text ist Latin!");
		#$text=decode_utf8($text);
	}
	return($text);
}

sub check_is_utf8
{
	my $text=shift;
	use Test::utf8;
	my $valid=is_valid_string($text);
	my $is_sane=is_sane_utf8($text);
#	&main::logge_int("Check auf UTF8:	Ausdruck $text\nValid 		=	$valid\nIs sane	=	$is_sane\n");
	if($is_sane==0)
	{
		return($text);
	} else
	{
		return(encode_utf8(decode_utf8($text)));
	}
	#if($text=~/Ã¶|Ã¼/)
	if($text=~/[äöüéáèàß]/)
	{
		#warn("Text hat UTF8!");
		#$text=decode_utf8($text);
		return(1);
	}
	if($text=~/Ã¶|Ã¼/)
	{
		#warn("Text ist Latin!");
		#$text=decode_utf8($text);
		return(0);
	}
	return(-1);
}
# Folgende Routine erledigt Validierungen und Speicherung
# von neuen User-Anmeldungen - entweder via Anmeldeformular
# oder aus den Kommentaren heraus z. B.
sub doAnmeldung()
{
	my $vars=shift;
	my $user=lc($vars->{'nick'});
	my $mail=lc($vars->{'adr_email'});
	my $erg={};

	if(length($user)<5)
	{
		$erg={
			'status'=>-1,
			'fehler_msg'=>"Der gewünschte Nickname ist zu kurz",
			'fehler_feld'=>'nick',
			'fehler_hilfe'=>"Dein Nickname muss mindestens 5 Zeichen lang sein."
		}
	} elsif($user!~/^[a-z0-9\-_]+$/)
	{
		$erg={
			'status'=>-1,
			'fehler_msg'=>"Ungültige Sonderzeichen im Nicknamen",
			'fehler_feld'=>'nick',
			'fehler_hilfe'=>"Im Nicknamen sind nur Buchstaben von A bis Z, Zahlen, - (Bindestrich) und _ (Unterstrich) erlaubt"
		}
	} elsif(-e "$main::master->{'_path_profiles'}/$user.profil")
	{
	     $erg={
			'status'=>-1,
			'fehler_msg'=>"Nickname schon vergeben",
			'fehler_feld'=>'nick',
			'fehler_hilfe'=>"Der von dir gewünschte Nickname $user ist leider schon vergeben :(<br/><br/>Bitte wähle einen anderen Nicknamen oder ergänze $user mit einer Zahl oder ähnlichem."
		}
	} elsif($user=~/\b(admin|fick|sex|porno?)\b/)
	{
	     $erg={
			'status'=>0,
			'fehler_msg'=>"Ungültiger Nickname",
			'fehler_feld'=>'nick',
			'fehler_hilfe'=>"Der von dir gewünschte Nickname $user ist leider ungültig :(<br/><br/>Bitte wähle einen anderen Nicknamen."
		}
	} else
	{
		my @z=&main::hole_file("$main::master->{'_path_profiles'}/zuordnung.lst");
		if (grep(/\t$mail\t/,@z))
		{
			$erg={
				'status'=>0,
				'fehler_msg'=>"Ungültige Mailadresse",
				'fehler_feld'=>'adr_email',
				'fehler_hilfe'=>"Die angegebene Mailadresse $mail ist schon für einen anderen Nicknamen vergeben. Wenn du dich schon bei uns angemeldet hast, dich aber nicht an dein Passwort erinnerst, kannst du dir dieses zuschicken lassen:<br/><br/><a href='/pwverg.html'>Vergessenes Passwort zusenden</a>"
			}
		} else
		{
			# Zufallspasswort
			my $pass;
			if(!$vars->{'_passneu'})
			{
				my @zufall=(
					'angel','auto',
					'ballon','blume','bus','becher','berg','baby','babies','burg',
					'eltern','erde','fenster','feuer',"fluss",
					'garten','glas',
					'haus','hund','info',
					'komet','katze','kinder',
					'meer','meteor','mond',"myinfo",
					'papier','platte',"programm",'regen','ring','radio',
					'segel','sonne','stern','see','stift',
					'tempel','tiger','tisch','tuch','turm',
					'wand','wasser','wetter','wiese','wunder',
					'zebra',
				);

				srand;
				$pass=(int(rand(100))-1).($zufall[int(rand($#zufall))]).(int(rand(100))-1);
			} else
			{
				$pass=$vars->{'_passneu'};
			}
			open(D,">>$main::master->{'_path_profiles'}/zuordnung.lst");
			print D "$user	$mail	$pass\n";
			close(D);
my $text=<<EOF;
Hallo $user,

vielen Dank für deine Anmeldung bei der Familienbande24, der grossen Community rund um Schwangerschaft, Babies, Kinder und Familie.

- Dein NICKNAME

Du bist mit dem folgenden Nicknamen bei uns angemeldet:

	$user


- Dein PASSWORT

Wir haben folgendes Passwort für dich erzeugt:

	$pass

Bitte notiere dir dieses Passwort und/oder bewahre diese Mail sorgfältig auf.


Um dich einzuloggen, kannst du auf jeder unserer Seiten unten links bei

"Mein Profil"

deine Zugangsdaten eingeben. Wenn du Fragen oder Probleme hast, kannst du dich
gerne per Mail oder Feedback-Formular an uns wenden!


Alle Leistungen, Seiten und Tools bei uns sind und bleiben absolut kostenlos!

Und nun wünschen wir dir viel Spaß in der Familienbande24-Community!


Mit freundlichen Grüssen,

Dein Familienbande24-Team
support\@familienbande24.de
EOF

			email({
				'to'=>$mail,
				'from'=>'support@familienbande24.de',
				'smtp'=>'127.0.0.1',
				'charset'=>'UTF-8',
				'subject'=>"Deine Anmeldung bei der Familienbande24",
				'_text'=>decode_utf8($text)
			}) or die "email() failed: $@";


			my $profil={
				'start_datum'=>$vars->{'_zeit'}->{'datum'},
				'start_zeit'=>$vars->{'_zeit'}->{'uhr'},
				'pass'=>$pass,
				'mail'=>$mail
			};

			#foreach my $i (sort keys %$vars)
			#{
				#&main::logge_int("A: $i = $vars->{$i}");
			#}

			# Zusätzliche Variablen, je nach Anwendung
			foreach my $i ('subid','ref')
			{
				if(exists($vars->{$i}) and length($vars->{$i})>0)
				{
					$profil->{$i}=$vars->{$i};
				}
			}
			$profil->{'subid'}||=$profil->{'sid'};

			store($profil,"$main::master->{'_path_profiles'}/$user.profil");

			if(length($profil->{'subid'})>0)
			{
				$text.="\n\n$vars->{'ref'}: ID = $profil->{'subid'}"
			}

			email({
				#'to'=>$main::master->{'mails_empfaenger'},
				'to'=>'support@nettz.de',
				'from'=>$mail,
				'smtp'=>'127.0.0.1',
				'charset'=>'UTF-8',
				'subject'=>"Anmeldung FB24",
				'_text'=>decode_utf8($text)
			}) or die "email() failed: $@";



			# Wir bereiten die Cookies vor,
			# damit der User direkt eingeloggt ist
			my $eol = "ijwe".$user."isdf".$pass;
			my $code=Digest::MD5::md5_base64($eol);
			$erg->{'evl'}="\$.cookie('id','$user');\$.cookie('p','$code');updateUI();";
			$erg->{'USER'}=$user;

			$erg->{'status'}=1;
			$erg->{'msg'}="<h3>Vielen Dank für deine Anmeldung!</h3>Wir haben dir soeben an <i>$mail</i> eine eMail mit deinen Zugangsdaten geschickt.<br/><br/>Wenn du Fragen oder Probleme hast, stehen wir dir gerne zu Verfügung:<br/><br/><a href='/feedback.html'>Zum Kontakt-Formular</a>";
		}
	}
	return($erg);
}

sub makeHero
{
	my ($foto,$titel,$inhalt)=@_;

	my $text=<<EOF;
	<div class="hero" style='background:#ccc;background: transparent url(/g/fotos/$foto) no-repeat 100% 10%/cover !important;'>
		<div class="container" style="min-height:423px;">
			<div class="row align-items-end">
                <div class="col-sm-10 offset-md-1">
                    <div class="card largeDoubleSearch">
					    <div class="card-body">
					        <h1>$titel</h1>
							<form>
								$inhalt
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
EOF
	return($text);
}


sub makeEinleitung
{
	my($titel,$desc,$brot,$foto,$foto_breite,$foto_alt,$share_link)=@_;
	my $foto_orig=$foto;

	#&main::logge_int("F: $foto");
	# Foto
	my $meta;
	if(length($foto)>2)
	{
		$foto_breite||="220";
		$foto_breite.="px";

		if(length($foto_alt)<1)
		{
			my $stitel=$titel;
			$stitel=~s/<.*?>//g;
			my @temp=&mischeListe(
				"Themenfoto Einleitung",
				"Themenfoto zu $stitel",
				"Foto zu $stitel",
				"Foto: $stitel",
				"Foto zum Artikel $stitel",
				"Themenbild zu $stitel",
				"Bild zu $stitel",
				"Bild zum Artikel $stitel"
			);
			$foto_alt=shift(@temp);
		}

		#&main::logge_int("Breite: $foto_breite ($foto)");
		if($foto!~/^https?:/ and $foto!~/^\/g\/vornamen\/bilder\// and $foto!~/^\/g\/jugendlexikon/ and $foto!~/^\/g\/sprueche/)
		{
			if(-e "$main::master->{'_path'}/g/fotos/$foto")
			{
				$foto="/g/fotos/$foto";
				#$meta="<meta name='shareaholic:image' content='https://www.familienbande24.de$foto' />\n";
				#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de$foto' />\n";
				$meta.="<meta name='og:image' content='https://www.familienbande24.de$foto' />\n";
				$foto="<div class='pull-right'><img src='$foto' alt='$foto_alt' style='width:$foto_breite' id='_fotomain'/></div>";
			} else
			{
				$foto='';
			}
		} elsif($foto=~/^https?:/)
		{
			#$meta="<meta name='shareaholic:image' content='$foto' />\n";
			#$meta.="<meta name='twitter:image' content='$foto' />\n";
			$meta.="<meta name='og:image' content='$foto' />\n";
			$foto="<div class='pull-right'><img src='$foto' alt='$foto_alt' style='width:$foto_breite' id='_fotomain'/></div>";
		} elsif($foto!~/^\/g\/vornamen\/bilder\//)
		{
			$foto=~s/^\///;
			#$meta="<meta name='shareaholic:image' content='https://www.familienbande24.de/$foto' />\n";
			#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de/$foto' />\n";
			$meta.="<meta name='og:image' content='https://www.familienbande24.de/$foto' />\n";

			$foto="<img src='/$foto' alt='$foto_alt' class='pull-right responsive hidden-xs' style='width:$foto_breite;' id='_fotomain'/>";

		} else
		{
			#$meta.="<meta name='shareaholic:image' content='https://www.familienbande24.de$foto' />\n";
			#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de$foto' />\n";
			$meta.="<meta name='og:image' content='https://www.familienbande24.de$foto' />\n";
			$foto="<a href='javascript:void(0);' onclick='showFotodialog(\"$foto_orig\",\"$share_link\");'><img src='$foto'  id='_fotomain' alt='$foto_alt' class='pull-right responsive hidden-xs' style='width:$foto_breite;'/></a>";

		}

	}

	# Ersten Satz der Beschreibung herauslösen, nur dieser wird bei Mobile-Ansicht gezeigt
	my $desc_mini='';

	if($desc=~s/^(.*?[\!\.] )(.{5})/$2/)
	{
		$desc_mini=$1." <span class='hidden-lg hidden-md'><a href='javascript:void(0);' onclick=\"\$('#cont_main_desc').removeClass('hidden-xs');\$(this).hide();\">Weiterlesen</a></span>";
	}

	# Titel incl. Breadcrumps
#	my $brotkrumen="<a class='btn btn-default' href='/' title='Zurück zur Startseite'>&nbsp;<i class='fa fa-lg fa-home'></i>&nbsp;</a>";
#	foreach my $i (split(/: /,$titel))
#	{
#		$brotkrumen.="$i ";
#	}
	#$titel=$brotkrumen;
	$brot=~s/<a(.*?)>(.*?)<\/a>/<a $1><div>$2<\/div><\/a>/g;
	if(length($brot)>5)
	{
		$brot=<<EOF;
	<div class='btn-group btn-breadcrumb' style='width:100%;'>
		<a class='btn btn-default' href='/index.html' title='Zurück zur Startseite'>&nbsp; <i class='fa fa-lg fa-home'></i>&nbsp;</a>
		$brot
	</div>
EOF
	} else
	{
		$brot="";
	}

	my $subtext="$desc_mini <span id='cont_main_desc' class='hidden-xs'>$desc</span>";
	my $subtitel='';
	my $ftext="";
	my $titel1="<h2>$titel</h2>";
	my $titel2='';
	if(length($subtitel)>0)
	{
		 $titel2="<h3>$subtitel</h3>";
	 }
	return <<EOF;
$meta
<div class='kasten-einleitung rund gradi schatten clearfix'>
	$titel1
	$titel2
	$brot
	<div class="text padding-20">
		$foto
		<div id='_ia_einl_uiw'>$subtext</div>
	</div>
</div>
EOF
}

sub makeEinleitung_alt
{
	my($titel,$desc,$brot,$foto,$foto_breite,$foto_alt,$share_link)=@_;
	my $foto_orig=$foto;

	#&main::logge_int("F: $foto");
	# Foto
	my $meta;
	if(length($foto)>2)
	{
		$foto_breite||="220";
		$foto_breite.="px";

		if(length($foto_alt)<1)
		{
			my $stitel=$titel;
			$stitel=~s/<.*?>//g;
			my @temp=&mischeListe(
				"Themenfoto Einleitung",
				"Themenfoto zu $stitel",
				"Foto zu $stitel",
				"Foto: $stitel",
				"Foto zum Artikel $stitel",
				"Themenbild zu $stitel",
				"Bild zu $stitel",
				"Bild zum Artikel $stitel"
			);
			$foto_alt=shift(@temp);
		}

		#&main::logge_int("Breite: $foto_breite ($foto)");
		if($foto!~/^https?:/ and $foto!~/^\/g\/vornamen\/bilder\// and $foto!~/^\/g\/jugendlexikon/ and $foto!~/^\/g\/sprueche/)
		{
			if(-e "$main::master->{'_path'}/g/fotos/$foto")
			{
				$foto="/g/fotos/$foto";
				#$meta="<meta name='shareaholic:image' content='https://www.familienbande24.de$foto' />\n";
				#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de$foto' />\n";
				$meta.="<meta name='og:image' content='https://www.familienbande24.de$foto' />\n";
				$foto="<div class='pull-right'><img src='$foto' alt='$foto_alt' style='width:$foto_breite' id='_fotomain'/></div>";
			} else
			{
				$foto='';
			}
		} elsif($foto=~/^https?:/)
		{
			#$meta="<meta name='shareaholic:image' content='$foto' />\n";
			#$meta.="<meta name='twitter:image' content='$foto' />\n";
			$meta.="<meta name='og:image' content='$foto' />\n";
			$foto="<div class='pull-right'><img src='$foto' alt='$foto_alt' style='width:$foto_breite' id='_fotomain'/></div>";
		} elsif($foto!~/^\/g\/vornamen\/bilder\//)
		{
			$foto=~s/^\///;
			#$meta="<meta name='shareaholic:image' content='https://www.familienbande24.de/$foto' />\n";
			#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de/$foto' />\n";
			$meta.="<meta name='og:image' content='https://www.familienbande24.de/$foto' />\n";

			$foto="<img src='/$foto' alt='$foto_alt' class='pull-right responsive hidden-xs' style='width:$foto_breite;' id='_fotomain'/>";

		} else
		{
			#$meta.="<meta name='shareaholic:image' content='https://www.familienbande24.de$foto' />\n";
			#$meta.="<meta name='twitter:image' content='https://www.familienbande24.de$foto' />\n";
			$meta.="<meta name='og:image' content='https://www.familienbande24.de$foto' />\n";
			$foto="<a href='javascript:void(0);' onclick='showFotodialog(\"$foto_orig\",\"$share_link\");'><img src='$foto'  id='_fotomain' alt='$foto_alt' class='pull-right responsive hidden-xs' style='width:$foto_breite;'/></a>";

		}

	}

	# Ersten Satz der Beschreibung herauslösen, nur dieser wird bei Mobile-Ansicht gezeigt
	my $desc_mini='';

	if($desc=~s/^(.*?[\!\.] )(.{5})/$2/)
	{
		$desc_mini=$1." <span class='hidden-lg hidden-md'><a href='javascript:void(0);' onclick=\"\$('#cont_main_desc').removeClass('hidden-xs');\$(this).hide();\">Weiterlesen</a></span>";
	}

	# Titel incl. Breadcrumps
#	my $brotkrumen="<a class='btn btn-default' href='/' title='Zurück zur Startseite'>&nbsp;<i class='fa fa-lg fa-home'></i>&nbsp;</a>";
#	foreach my $i (split(/: /,$titel))
#	{
#		$brotkrumen.="$i ";
#	}
	#$titel=$brotkrumen;
	$brot=~s/<a(.*?)>(.*?)<\/a>/<a $1><div>$2<\/div><\/a>/g;
	if(length($brot)>5)
	{
		$brot=<<EOF;
	<div class='btn-group btn-breadcrumb' style='width:100%;'>
		<a class='btn btn-default' href='/index.html' title='Zurück zur Startseite'>&nbsp; <i class='fa fa-lg fa-home'></i>&nbsp;</a>
		$brot
	</div>
EOF
	} else
	{
		$brot="";
	}

	my $subtext="$desc_mini <span id='cont_main_desc' class='hidden-xs'>$desc</span>";
	my $ftext="";
	return <<EOF;
$meta
<div class='kasten-einleitung rund gradi schatten clearfix'>
	$brot
	<h1 class='mtitel'>$titel</h1>
	<div class="text padding-20">
		$foto
		<div id='_ia_einl_uiw'>$subtext</div>
	</div>
</div>
EOF
}

sub warnhash
{
	my $t=shift;
	foreach my $i (%$t)
	{
		warn("$i = $t->{$i}");
	}
}

sub addMerkzettel
{
	my($user,$art,$id,$zusatz)=@_;
	$id=~s/(^|-|\s)(.)/$1\u$2/g;

	my $vars={
		start=>time
	};

	if($art eq "vornamen")
	{
		# Haben wir kein Geschlecht? Dann holen ...
		if(!defined $zusatz)
		{
			if(exists($main::cache->{'vornamen'}->{$id}))
			{
				my $vid=$main::cache->{'vornamen'}->{$id};
				$vars->{'g'}=$main::cache->{'vornamen'}->{$vid}->{'geschlecht'};
			}
		} else
		{
			$vars->{'g'}=$zusatz;
		}
	}
	&main::logge_int("Setze Merkzettel");
	my $erg=&main::socket(&to_json({
		'_user'=>$user,
		'todo'=>'setConfig',
		'key'=>"merklisten:$art:$id",
		'value'=>$vars
	}));
	return(1);
}

sub getMerkzettel
{
	my($user,$art)=@_;
	my @temp;
	my $e=&main::socket(to_json({
		'_user'=>$user,
		'todo'=>'getConfig',
		'key'=>"merklisten:$art"
	}));
	$e||="{}";
	my $erg;
	eval{
		$erg=&from_json($e);
	};
	foreach my $i (keys %$erg)
	{
		$erg->{$i}->{'vorname'}=$i;
		push(@temp,$erg->{$i});
	}
	return(\@temp);
}



# Fügt Tausenderkommas und Dezimalpunkte in eine Zahl ein
sub commify
{
  my ($nr,$punkttrenner)=@_;
  1 while $nr=~s/^(-?\d+)(\d{3})/$1,$2/;
  if($punkttrenner)
  {
  	$nr=~s/,/\./g;
  }
  return $nr;
}

sub cleanText
{
	my $text=shift;
	return if length($text)<1;
	#return($text);
	#$text=~s/ß/&szlig;/g;
	#&main::logge_int("A: $text");
	eval {
	   $text= decode('UTF-8', $text, Encode::FB_CROAK|Encode::LEAVE_SRC);
	   1  # No exception
	};
	#&main::logge_int("B: $text");
	if($@) {
		#
		eval {
			#warn("B2");
			$text= decode('Windows-1252', $text);
		};
		if($@)
		{
			#warn("C2");
			$text= decode_utf8($text);
		}
	}
	#&main::logge_int("C: $text");
	$text=~s/&amp;/&/g;
	#$text=~s/&lt;/</g;
	#$text=~s/&gt;/>/g;
	$text=decode_entities($text);
	$text=~s/<\/?(p|br)\/?>//g;
	$text=~s/&nbsp;/ /g;

	my $dum=chr(195).chr(164);
	$text=~s/$dum/ä/g;

	$dum=chr(195).chr(182);
	$text=~s/$dum/ö/g;

	#$dum=chr(252);
	#$text=~s/$dum/ü/g;

	$text=~s/Ã¼/ü/g;
	$dum=chr(195).chr(188);
	$text=~s/$dum/ü/g;
	$text=~s/Ã„/Ä/g;
	$text=~s/Ã–/Ö/g;
	$text=~s/Ãœ/Ü/g;
	$text=~s/­/-/g;
	#my $dum=chr(226).chr(128).chr(147);
	#$text=~s/$dum/ß/g;
	#$text=~s/ÃŸ/ß/g;

	$dum=chr(150);
	$text=~s/$dum/–/g;
	$text=~s/^\s+//;
	$text=~s/\s+$//;

	$text=~s/%([0-9A-Z][0-9A-Z])/chr(hex($1))/eg;
	return($text);
	#return($text);
	#return(decode_utf8($text));
}

sub logge
{
	my($msg,$level)=@_;
	my $z=&main::zeit;
	if(defined($main::VERBOSE) && $level<=$main::VERBOSE)
	{
		#warn($msg);
		print STDERR "$z->{'datum'} $z->{'uhr'}\t$msg\n";
	} elsif(!defined($main::VERBOSE))
	{
		print STDERR "$z->{'datum'} $z->{'uhr'}\t$msg\n";
	}
}

sub getCleanFilename
{
	my $file=decode_utf8(shift);
	$file=~s/([^0-9a-zA-Z\- ])/"_".sprintf("%02X",ord($1))/ge;
	return($file);
}

sub BEGIN
{
	#
	# Fehlerausgaben umleiten
	#
	&main::logge("Lade Einstellungen",9);

	# Wo sind wir, was machen wir?
	my $pfad="./";
	if(!-e "$pfad/.einstellungen")
	{
		$pfad="/web/virtual/fb24_2/";
	}
	open(D,"<","$pfad/.einstellungen");
	while(my $i=<D>)
	{
		chomp($i);
		next if length($i)<3 or $i=~/^#/;
		my($k,$v)=split(/\t+/,$i);
		$main::master->{$k}=$v;
	}

	#return;
	#open STDERR, ">>/var/log/baby.log";

}

sub getMonatsname
{
	my $m=shift;
	my @monatsnamen=("Januar","Februar","März","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember");
	return($monatsnamen[$m-1]);
}

sub getMonatszahl
{
	my $m=shift;
	my $lfd=0;
	foreach my $i ("Januar","Februar","März","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember")
	{
		++$lfd;
		return($lfd) if $m eq $i;
	}
	return($m);
}

sub decode_vars
{
	my $vars=shift;
	my $neu={};
	foreach my $i (keys %$vars)
	{
		next if ref($vars->{$i}) eq "HASH";
		#&main::logge_int("A: $i / $vars->{$i} / ".ref($vars->{$i}));
		$neu->{decode_utf8($i)}=decode_utf8($vars->{$i});
		#&main::logge_int("B: $i / ".$neu->{decode_utf8($i)});
	}
	return($neu);
}

sub encode_vars
{
	my $vars=shift;
	my $neu={};
	foreach my $i (keys %$vars)
	{
		next if ref($vars->{$i}) eq "HASH";
		#&main::logge_int("A: $i / $vars->{$i} / ".ref($vars->{$i}));
		$neu->{encode_utf8($i)}=encode_utf8($vars->{$i});
		#&main::logge_int("B: $i / ".$neu->{decode_utf8($i)});
	}
	return($neu);
}

sub check_schmutz
{
	my $string=shift;
	if ($string=~/^(homo|bitch|dumm[iy])$/i)
	{
		&main::logge_int("SCHMUTZ 1: $string");
		return(1);
	} elsif($string=~/arschloch|fickdich|hitler|idiot|nuttenbengel|missgestalt|bastard|aidsgesicht|judensau|dummername|schwanzlut|inzucht|arschgeburt|dildo|dumpfbacke|diagnose|missgeburt|pimmel|idiot|condom|missgeburt|aschlegge|ha?esslich|dumme ?sau|dreckskind|grosser ?schwanz|asozial|muschikop|penis|[fv]otze|schlampe|wi(ch|x+)(er)(a+)|fettsack|huh?ren(sohn|tochter)|fick|hässlich|schwuchtel|schwul|nigg(er|a)/i)
	{
		&main::logge_int("SCHMUTZ 21: $string");
		return(1);
	}
	return(-1);
}

sub getHoroskopHeute
{
	my $vars=shift;
	my $datum=$vars->{'_zeit'}->{'JJJJ'}.$vars->{'_zeit'}->{'MM'}.$vars->{'_zeit'}->{'TT'};
	if(!exists($main::cache->{'horoskop'}->{$datum}))
	{
		&main::logge_int("Suche $main::master->{'_path_data'}/horoskope/$datum.txt");
		if(-e "$main::master->{'_path_data'}/horoskope/$datum.txt")
		{
			my @z=split(/\n/,&main::hole_file("$main::master->{'_path_data'}/horoskope/$datum.txt"));
			foreach my $i ("Widder§21032004","Stier§21042005","Zwilling§21052106","Krebs§22062207","Löwe§23072308","Jungfrau§24082209","Waage§23092210","Skorpion§23102211","Schütze§23112112","Steinbock§22122001","Wassermann§21012002","Fische§21022003")
			{
				my ($s,$d)=split(/§/,$i);
				$main::cache->{'horoskop'}->{$datum}->{decode_utf8($s)}->{'text'}=shift(@z);
			}
		}
	} else
	{
		&main::logge_int("Nix da!");
	}
	return($datum);
}

sub getSatz
{
	my @v=@_;
	my @s=&mischeListe(@v);
	while($s[0]=~s/\((.*?\|.*?)\)/auihfh/)
	{
		my @dum=split(/\|/,$1);
		my $wort=&getSatz(@dum);
		$s[0]=~s/auihfh/$wort/;
	}
	return(shift(@s));
}

sub getListe
{
	my($liste,$min,$max,$kein_oder)=@_;
	my @x=&mischeListe(@$liste);
	&main::logge_int("Check: @x / $min / $max");
	foreach my $zeile (@x)
	{
		while($zeile=~s/\((.*?)\|(.*?)\)/hf7awf/g)
		{
			my $klammer=&main::getSatz(split(/\|/,"$1\|$2"));
			#&main::logge_int("Klammerfelder: $klammer");
			$zeile=~s/hf7awf/$klammer/g;
		}
		if($zeile=~/\|/)
		{
			$zeile=&main::getSatz(split(/\|/,$zeile));
		}
	}

	if($min==2 && $max==3)
	{
		if($kein_oder<1)
		{
			return(&getSatz(
				"$x[0], $x[1] oder $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] oder $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0] oder $x[1]",
				"$x[0] und $x[1]",
				"$x[0] und $x[1]",
			));
		} else
		{
			return(&getSatz(
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0], $x[1] und $x[2]",
				"$x[0] und $x[1]",
				"$x[0] und $x[1]",
			));
		}
	} elsif($min==1 && $max==3)
	{
		return(&getSatz(
			"$x[0], $x[1] oder $x[2]",
			"$x[0], $x[1] und $x[2]",
			"$x[0], $x[1] und $x[2]",
			"$x[0], $x[1] oder $x[2]",
			"$x[0], $x[1] und $x[2]",
			"$x[0], $x[1] und $x[2]",
			"$x[0] oder $x[1]",
			"$x[0] und $x[1]",
			"$x[0] und $x[1]",
			"$x[0] oder gar $x[1]",
			"$x[0] und $x[1]",
			"$x[0] und $x[1]",
			"$x[0] oder $x[1]",
			"$x[0] und $x[1]",
			"$x[0] und $x[1]",
			"$x[0] oder gar $x[1]",
			"$x[0] und $x[1]",
			"$x[0] und $x[1]",
		));
	} elsif($min==2 && $max==2)
	{
		if($kein_oder<1)
		{
			return(&getSatz(
				"$x[0] und $x[1]",
				"$x[0] oder $x[1]",
			));
		} else
		{
			return("$x[0] und $x[1]");
		}
	}
}

sub getSocialIcons
{
	my $seitentitel=uri_escape(shift);
	my $text=shift;
	$text=~s/<br\/?>/\n/g;
	$text=~s/&mdash;/-/g;
	$text=~s/&nbsp;/ /g;
	$text=~s/&quot;/"/g;
	$text=~s/<.*?>//g;
	if(length($text)>140)
	{
		$text=uri_escape(substr($text,0,136))." ...";
	} elsif(length($text)<1)
	{
		$text=$seitentitel;
	} else
	{
		$text=uri_escape($text);
	}
	$text=~s/"/%22/g;
	#$text.="\n";

	my $URL=$ENV{'REQUEST_URI'};
	my $S=$ENV{'HTTP_HOST'};
	$S=~s/\/$//;
	$S="https://$S";
	$URL=$S.$URL;
	$URL=$ENV{'HTTP_REFERER'} if $ENV{'HTTP_REFERER'} eq 'https://www.familienbande24.de/nachwuchs/hebammen/suche.html';
	if($URL!~/fb\.fcgi$/)
	{
		use URI::Escape;
		my $encoded = uri_escape($URL);
		return <<EOF;
	<ul class="social-icons icon-rounded list-unstyled list-inline">
		<li><a title='Bei Facebook teilen' href='javascript:void(0);' onclick='openShare("https://www.facebook.com/sharer.php?u=$encoded",null,null,null,600,600)'><i class='fa fa-facebook'></i></a></li>
		<li><a title='Bei Google+ posten' href='javascript:void(0);' onclick='openShare("https://plus.google.com/share?url=$encoded",null,null,null,600,600)'><i class='fa fa-google-plus'></i></a></li>
		<li><a title='Bei Twitter tweeten' href='javascript:void(0);' onclick='openShare("https://twitter.com/intent/tweet?text=$text&url=$encoded",null,null,null,500,400)'><i class='fa fa-twitter'></i></a></li>
		<li><a title='Bei Pinterest pinnen' href='javascript:void(0);' onclick='openShare("https://pinterest.com/pin/create/button/?url=$encoded&description=$seitentitel&media=_FOTOMAIN",null,null,null,700,600)'><i class='fa fa-pinterest'></i></a></li>
		<li><a title='Bei LinkedIn veröffentlichen' href='javascript:void(0);' onclick='openShare("https://www.linkedin.com/shareArticle?url=$encoded",null,null,null,600,600)'><i class='fa fa-linkedin'></i></a></li>
		<li><a href="whatsapp://send?text=$text+$encoded" data-action="share/whatsapp/share" title='Per WhatsApp senden'><i class='fa fa-whatsapp'></i></a></li>
	</ul>
EOF
	} else
	{
		&main::logge_int("Kein Social wg. URL: $URL / Referer: $ENV{'HTTP_REFERER'}");
		return('');
	}
}

sub getSatz
{
	my @v=@_;
	my @s=&mischeListe(@v);
	while($s[0]=~s/\((.*?\|.*?)\)/auihfh/)
	{
		my @dum=split(/\|/,$1);
		my $wort=&getSatz(@dum);
		$s[0]=~s/auihfh/$wort/;
	}
	return(shift(@s));
}

sub wandelSmileys
{
	my $text=shift;
	foreach my $j (@smileys)
	{
			my ($gr,$sym)=split(/§/,$j);
			$text=~s/#$sym#/<img src='\/g\/smileys\/$gr'\/>/g;
      }
      return($text);
}

sub kodiereString
{
	my $string=shift;
	my $code=shift || 'yXuisere2org5Posdfhr';
	my $crypt = Crypt::Lite->new( debug => 0, encoding => 'hex8' );
	return( $crypt->encrypt($string, $code))
}

sub dekodiereString
{
	my $string=shift;
	my $code=shift || 'yXuisere2org5Posdfhr';
	my $crypt = Crypt::Lite->new( debug => 0, encoding => 'hex8' );
	return( $crypt->decrypt($string, $code))
}

sub getWerbung
{
	my ($art,$rubrik,$subrubrik)=@_;
	srand;
	if($art eq 'quadrat')
	{
		my @banner=(

			# Google Adsense
			'<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 300 x 250 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-1705169096959369"
     data-ad-slot="1761788486"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>',

			# Amazon 300 x 250
			'<iframe src="https://rcm-eu.amazon-adsystem.com/e/cm?o=3&p=12&l=ez&f=ifr&linkID=064cc4dd19a9c983bd9176365139ca34&t=nettzde&tracking_id=nettzde" width="300" height="250" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe>',
			'<div data-nx-container="content"></div>'

		);
		#my $r=rand(10);
		#&main::logge_int("R: $r");
		#if($r>8)
		#{
		#	return($banner[1]);
		#}
		return($banner[0]);
	} elsif($art eq 'footer')
	{
		my @banner=(
			'<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="autorelaxed"
     data-ad-client="ca-pub-1705169096959369"
     data-ad-slot="9830017280"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>',
	'<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Responsive -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1705169096959369"
     data-ad-slot="1702264880"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>'
		);

		my $r=rand(10);
		#&main::logge_int("R: $r");

		if($r>8)
		{
			return($banner[1]);
		}
		return($banner[0]);
	} elsif($art eq 'artikel')
	{
		if(rand(10)>100)
		{
			#return('');
			return('<script type="text/javascript" src="//cdn.conative.de/serve/domain/211/config.js" async></script>');
		} else
		{
			return('');
		}
	} elsif($art eq 'infeed-rosa')
	{
		return('<div class="text-center"><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle"     style="display:block"     data-ad-format="fluid"     data-ad-layout="image-side"     data-ad-layout-key="-ha-s+2d-5h+7u"     data-ad-client="ca-pub-1705169096959369"     data-ad-slot="5210680885"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script></div><br/>');
	} elsif($art eq 'infeed-gruen')
	{
		return('<div class="text-center"><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle"     style="display:block"     data-ad-format="fluid"     data-ad-layout="image-side"     data-ad-layout-key="-g0+3r+5i-bg+4u"     data-ad-client="ca-pub-1705169096959369"     data-ad-slot="5431006880"></ins><script>(adsbygoogle = window.adsbygoogle || []).push({});</script></div><br/>');
	}
}

1;
