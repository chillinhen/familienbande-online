#!/usr/bin/env perl

use strict;

$|=1;

# Module
use FCGI;
use CGI::Fast;
use DBI;
use Storable;
use warnings;
use warnings qw( FATAL utf8 );
use Encode;
use Time::HiRes 'time';
use utf8;
use HTML::Packer;
use IO::Compress::Gzip qw(gzip $GzipError) ;
my $HTMLPACKER = HTML::Packer->init();

#use Devel::Size qw(size total_size);

$main::VERBOSE=0;
$main::ZWANG_LOKAL=1;

# Subs
#require "$main::master->{'_path_module'}/cgibin/subs.pl";
require "cgibin/subs.pl";

# Datenbank-Inhalte vorab in den Cache laden?
foreach my $i (keys %$main::master)
{
	next if $i!~/^_db_(.*?)$/;
	my $key=$1;
	if(-e "$main::master->{'_path_data'}/cache/_cache_$key.txt" && -M "$main::master->{'_path_data'}/cache/_cache_$key.txt"<2)
	{
		&main::logge_int("Lade DB in cache: $key",5);
		$main::cache->{'db'}->{$key}=Storable::retrieve("$main::master->{'_path_data'}/cache/_cache_$key.txt");
		&main::logge("DB $key in Cache geladen",5);
	} else
	{
		&main::logge_int("Lade DB extern: $key",5);
		my($url,$datenbank,$user,$pass,$tab,$primary,$query,$encode)=split(/;/,$main::master->{$i});
		my $db=DBI->connect("DBI:mysql:$datenbank;host=$url",$user,$pass);
		my $sth=$db->prepare("SET NAMES utf8");
		$sth->execute;

		my $sth=$db->prepare("select $query from $tab");
		$sth->execute;
		while(my $hit=$sth->fetchrow_hashref)
		{
			$main::cache->{'db'}->{$key}->{$hit->{$primary}}=$hit;
		}
		Storable::store($main::cache->{'db'}->{$key},"$main::master->{'_path_data'}/cache/_cache_$key.txt");
		&main::logge("DB $key geladen und Cache erstellt",5);
	}
}

# Geburtenverteilung für Vornamen laden
if(-e "$main::master->{'_path_data'}/vornamen/stats-geburten-komplett.idx")
{
	eval{
		$main::cache->{'geburten'}->{'vornamen'}=Storable::retrieve("$main::master->{'_path_data'}/vornamen/stats-geburten-komplett.idx");
	};
}

# Monatsverteilung für Vornamen laden
if(-e "$main::master->{'_path_data'}/vornamen/stats-nach-monaten.idx")
{
	eval{
		$main::cache->{'statistik'}->{'vornamen'}=Storable::retrieve("$main::master->{'_path_data'}/vornamen/stats-nach-monaten.idx");
	};
	if($@)
	{
		&main::logge_int("Fehler bei Monatsstatistik: $@!",0);
	}
} else
{
	&main::logge_int("Keine Monatsstatistik!",0);
}

# Vornamen-Index erstellen
foreach my $id (keys %{$main::cache->{'db'}->{'vornamen'}})
{
	$main::cache->{'vornamen'}->{$main::cache->{'db'}->{'vornamen'}->{$id}->{'vorname'}}=$id;
	$main::cache->{'vornamen_vids'}->{$id}=$main::cache->{'db'}->{'vornamen'}->{$id}->{'vorname'};
}

my $VORNAMEN={};
$main::VORNAMEN_VIDS={};
$main::VORNAMEN_GESCHLECHT={};
if (-e "$main::master->{'_path_data'}/cache/vornamen.txt")
{
	warn("INIT: Lade vornamen.txt");
	open(D,"<$main::master->{'_path_data'}/cache/vornamen.txt");
	while(my $zeile=<D>)
	{
		chomp($zeile);
		my ($vorname,$geschlecht,$vid)=split(/\t/,$zeile);
		$main::VORNAMEN_VIDS->{$vid}=$vorname;
		$main::VORNAMEN_GESCHLECHT->{$vorname}.=$geschlecht;
	}
} else
{
	&main::logge_int("Kein Vornamen-Geschlechts-Index gefunden!");
}


# Häufige Quellen aus Cache laden?
my $cache_aktiv=$main::master->{'_cache_aktiv'};
$cache_aktiv=0;

# Templates vorab laden?
if($cache_aktiv>0)
{
	opendir(DIR,"$main::master->{'_path_templates'}");
	foreach my $file (readdir(DIR))
	{
		next if $file!~/^(.*?)\.tmpl$/ or ($cache_aktiv<1 and ($file ne "header.tmpl" and $file ne "footer.tmpl"));
		$main::cache->{'templates'}->{$1}=&hole_file("$main::master->{'_path_templates'}/$file");
	}
}

#
# Dämon aktiv?
#
$main::DAEMON_AKTIV=0;
my $erg=&from_json(decode_utf8 &main::socket('{"todo":"alive"}'));
if($erg->{'status'}==1)
{
	$main::DAEMON_AKTIV=1;
}

# Counter für Durchlauf
my $durchlauf=0;

# Startup
&init();

# Variable für statische, aber zur Laufzeit konstruierte
# Texte wie z. B. Kurzliste der beliebtesten Artikel usw.
$main::STATISCH={};

$main::HELPER={};
my $statisch_aktiv=1;

&main::logge("Beginne Listening ...",1);
#my $t=&main::socket(to_json({
#				'todo'=>'getVotes',
#				'thema'=>'spiele'
#}));
#print($t);
#exit;
#$STATISCH->{'votes'}->{'spiele'}=&from_json(decode_utf8 &main::socket(to_json({
#				'todo'=>'getVotes',
#				'thema'=>'spiele'
#			})));

use Data::Dumper;

#$main::STATISCH->{'aktueller_kasten'}=retrieve("$main::master->{'_path_data'}/aktuell_1h.idx");


while (my $seite=new CGI::Fast)
{
	#my $t0 = [Time::HiRes::gettimeofday];
	if($statisch_aktiv>0 && $durchlauf/400==int($durchlauf/400))
	{
#		&main::logge_int("Size: ".total_size($main::cache));

		# Wir aktualisieren statische Anzeigen
		#&main::logge_int("Aktualisiere statische Anzeigen",0);
#die;
		$main::STATISCH->{'aktueller_kasten'}=retrieve("$main::master->{'_path_data'}/aktuell_1h.idx");

		# Beliebteste Artikel
		if($main::DAEMON_AKTIV>0)
		{
#			&main::logge_int("A");
			my $erg=&from_json(decode_utf8 &main::socket('{"todo":"getTexteKurz","max":10,"refresh":1,"html":1,"sortierung":"_anz_likes"}'));
			$main::STATISCH->{'artikel'}=$erg->{'html'};
#			&main::logge_int("B");
			$erg=&from_json(decode_utf8 &main::socket('{"todo":"getTexteAufrufe2","max":7}'));
			$main::STATISCH->{'beste_rubriken'}=$erg->{'html'};
			#&main::logge_int("C");
			$main::STATISCH->{'votes'}->{'spiele'}=&from_json(decode_utf8 &main::socket('{"todo":"getVotes","thema":"spiele"}'));

			#$main::STATISCH->{'votes'}->{'vornamen-spitznamen'}=&from_json(decode_utf8 &main::socket(to_json({
			#	'todo'=>'getVotes',
			#	'thema'=>'vornamen-spitznamen'
			#})));
		}

	}

	++$durchlauf;
#	&main::logge_int("Durchlauf $durchlauf",9);
	my $hauptseite="";

	my $jetzt=time();
	my $was='';

	#
	# Lokaler Init
	#
	my $vars=&initLokal($seite);

	if($ENV{'HTTP_USER_AGENT'}=~/Xenu Link Sleuth|\(compatible; Googlebot\/2\.1; \+http:|Mozilla\/5\.0 \(compatible; bingbot\/2\.0;|compatible; Yahoo\! Slurp; http:\/\/help.yahoo.com\/help\/us\/ysearch\/slurp/)
	{
		$vars->{'_BOT'}=1;
	} else
	{
		$vars->{'_BOT'}=-1;
	}

	if(defined($vars->{'STOP'}) && $vars->{'STOP'}>0)
	{
		goto intern_finish;
	}
	my $cookiestring=$vars->{'cookiestring'};
	if(exists($ENV{'REQUEST_METHOD'}) and $ENV{'REQUEST_METHOD'} eq "GET" && $cache_aktiv>0 && exists($main::cache->{'seite'}->{$ENV{'REQUEST_URI'}}))
	{
		$hauptseite=$main::cache->{'seite'}->{$ENV{'REQUEST_URI'}};
		&main::logge_int("Aus Cache: $ENV{'REQUEST_URI'}",5);
		goto gecacht;
	} else
	{
		#&main::logge_int("Nicht im Cache: $ENV{'REQUEST_URI'}",5);
	}

	if($main::VERBOSE>10)
	{
		open(DOOO,">>logs/pids.txt");
		print DOOO "$$\t";
		foreach my $i (sort keys %$vars)
		{
			print DOOO "$i = $vars->{$i} ";
		}
		print DOOO "\n";
		close(DOOO);
	}

	# Aktion oder Webseite?
	my $message;
	if($vars->{'todo'})
	{
		# Todo, also keinen Header usw. zurückgeben!
		$vars->{'seite'}="aktionen/$vars->{'todo'}";
		$vars=&showTemplate($vars);
		$message=$vars->{'_html'} || "./.";
#		warn("TODO: $vars->{'todo'}");
		$was="todo = $vars->{'todo'}";
	} else
	{
		#
		# Header ausgeben
		#
		if(exists($main::cache->{'templates'}->{'header'}))
		{
			$hauptseite=$main::cache->{'templates'}->{'header'};
		} else
		{
			&main::logge_int("TTT: $main::master->{'_path_templates'}");
			my $tmpl=&hole_file("$main::master->{'_path_templates'}/header.tmpl");
			my $chr=chr(239).chr(187).chr(191);
			$tmpl=~s/^$chr//;
			$hauptseite=$tmpl;
		}

		#
		# Hauptseite laden
		#
		$vars->{'seite'}||="start";

		my $zusatz='';
		foreach my $xx (keys %$vars)
		{
			next if $xx eq "_zeit" or $xx eq "cookiestring";
			if(defined($vars->{$xx}))
			{
				if(length($vars->{$xx})>30)
				{
					$zusatz.=" $xx=$vars->{$xx}... ";
				} else
				{
					$zusatz.=" $xx=$vars->{$xx} ";
				}
			} else
			{
				$zusatz.=" $xx";
			}
		}

		$was=$zusatz;
#		warn("Seite: $vars->{'seite'} ($was)");

		#&main::logge_int("SEITE: $vars->{'seite'}");
		$vars=&showTemplate($vars);

		my $st='';
		my $hero='';
		if($vars->{'_FEHLER'})
		{
			$st=$vars->{'_FEHLER'};
		} elsif($vars->{'_MESSAGE'})
		{
			$message=$vars->{'_MESSAGE'};
		} else
		{
			$st=$vars->{'_html'};
		}
		if(length($st)<60)
		{
			$st=&makeEinleitung("Seite nicht gefunden").encode_utf8("<div class='globaler-fehler'>Die von dir gewünschte Seite kann leider nicht gefunden werden!</div>");
		}
		# Haben wir einen Hero-Header?
		if(length($vars->{'hero'})>0)
		{
			$hauptseite=~s/_#HERO#_/$vars->{'hero'}/;
		}
		$hauptseite=~s/_#CONTENT#_/$st/;
#		&main::logge_int("H: ".length($hauptseite));
	}

	$vars->{'_TITEL'}||="Familienbande24 - alles zu Vornamen, Schwangerschaft, Geburt und Kinder";
	$vars->{'_TITEL'}=~s/\s+$//;
	if($message)
	{
		if($message!~/content-type/i)
		{
			print "Content-type: text/html\n$cookiestring\n\n";
		}
		print $message;
	} else
	{
		# Footer
		$hauptseite.=$main::cache->{'templates'}->{'footer'}  || &hole_file("$main::master->{'_path_templates'}/footer.tmpl");;

		# Allgemeine Seitenelemente austauschen
		$vars->{'_TYPE'}||="article";
		$hauptseite=~s/_#TITEL#_/$vars->{'_TITEL'}/g;

		if(!defined($vars->{'_DESCRIPTION'}))
                {
			if($hauptseite=~/<div id='_ia_einl_uiw'>(.{150,250}[\.\!\?] )/)
			{
				$vars->{'_DESCRIPTION'}=$1;
			} elsif($hauptseite=~/<div id='_ia_einl_uiw'>(.{30,150}[\.\!\?])/)
			{
				$vars->{'_DESCRIPTION'}=$1;
			}
		}

		if(defined($vars->{'_DESCRIPTION'}))
		{
			$vars->{'_DESCRIPTION'}=~s/<.*?>//g;
			$vars->{'_DESCRIPTION'}=~s/<.*$//g;
		} else
		{
			$vars->{'_DESCRIPTION'}="";
		}
		$hauptseite=~s/_#DESCRIPTION#_/$vars->{'_DESCRIPTION'}/g;

		$vars->{'_TYPE'}||="";
		if(defined($vars->{'_TYPE'}))
		{
			$hauptseite=~s/_#TYPE#_/$vars->{'_TYPE'}/;
		}
		$vars->{'_IMAGE'}||="";
		if(defined($vars->{'_IMAGE'}))
		{
			$hauptseite=~s/_#IMAGE#_/$vars->{'_IMAGE'}/;
		}
		$vars->{'_META'}||="";
		if(defined($vars->{'_META'}))
		{
			$hauptseite=~s/_#_META#_/$vars->{'_META'}/;
		}

		my $banner='';

		#
		# Medium Rectangle
		#
		$banner="<div id='naMediaAd_MEDIUM_RECTANGLE'></div>";
		$hauptseite=~s/_#WERBUNG_QUADRAT#_/$banner/;

		#
		# Halfpage 300 x 600
		#
		my $t=rand(10);
		if($t>=0)
		{
			$banner='<div id="naMediaAd_MEDIUM_RECTANGLE"><script type="text/javascript">naMediaAd.includeAd("MEDIUM_RECTANGLE");</script></div>';
		} else
		{
			$banner='<script src="https://whoisyouraddaddy.soma2.de/adscript.php?pid=6596&ord=[timestamp]" type="text/javascript" language="JavaScript"></script>';
		}

		#
		# Conative-Artikelwerbung
		#
		$t=rand(10);
		if(rand(10)>-1)
		{
			$banner='<script type="text/javascript" src="//cdn.conative.de/serve/domain/211/config.js" async></script>';
		}
		$hauptseite=~s/_#WERBUNG_ARTIKEL#_/$banner/g;


		#
		# Werbung im Artikel
		#
		$hauptseite=~s/_#WERBUNG_IM_ARTIKEL#_/<div class='text-center'><ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-1705169096959369" data-ad-slot="1702264880" data-ad-format="auto"><\/ins><script>(adsbygoogle = window.adsbygoogle || []).push({});<\/script><\/div>/g;

		$banner='<div id="naMediaAd_CONTENT_ROLLOVER"></div>';
		$hauptseite=~s/_#WERBUNG_CONTENT_ROLLOVER#_/$banner/;


		my $t=rand(10);
		if($t>8)
		{
			$banner='<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Responsive -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1705169096959369"
     data-ad-slot="1702264880"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>';
		} elsif($t>12)
		{
			$banner='<br/><br/><br/>
<script type="text/javascript">
(sc_adv_out = window.sc_adv_out || []).push({ id : "269124", domain : "n.ads1-adnow.com"});
</script><script type="text/javascript" src="//st-n.ads1-adnow.com/js/adv_out.js"></script>
<div id="SC_TBlock_269124" class="SC_TBlock">lade...</div>';
		} else
		{
			$banner='<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="autorelaxed"
     data-ad-client="ca-pub-1705169096959369"
     data-ad-slot="9830017280"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>'
		}
		$hauptseite=~s/_#WERBUNG_SUPERBANNER_UNTEN#_/$banner/;


		my $google_async=<<EOF;
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<!-- Responsive -->
	<ins class="adsbygoogle"
	     style="display:block"
	     data-ad-client="ca-pub-1705169096959369"
	     data-ad-slot="1702264880"
	     data-ad-format="auto"></ins>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
EOF

		$hauptseite=~s/<meta property="og:image" content="" \/>//;
		my $side_menu_spruch=<<EOF;


EOF
		$hauptseite=~s/_#side_menu#_/$vars->{'side_menu'}/;


#		&main::logge_int("B: $vars->{'WERBUNG_SIDE'}");
		my $unten="";
		if(exists($vars->{'WERBUNG_SIDE'}))
		{
			$unten=<<EOF;
<section id="artikel-kurz" class='kasten blau'>
	<h2>Auch interessant</h2>
	<div class="fb-container text">
		$vars->{'WERBUNG_SIDE'}
	</div>
</section>
EOF
		}

		if(defined($vars->{'_eingeloggt'}) && $vars->{'_eingeloggt'}>0)
		{
			my $austausch="";
			if($vars->{'_config'}->{'ref'} eq "hebamme")
			{
				$austausch=<<EOF;
				<section id="artikel-kurz" class='kasten blau'>
							<h2>Dein Hebammen-Profil</h2>
							<div class="fb-container text">
								<div class='row'>
									<div class='col-xs-4'>
										<img src='/g/fotos/hebamme2_klein.jpg' class='foto-hebamme' />
									</div>
									<div class='col-xs-8'>
										<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/profil/hebamme.html'>Profil &auml;ndern</a>
										<br/><br/>
										<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/nachwuchs/hebammen/details/$vars->{'_config'}->{'subid'}/index.html'>Profil aufrufen</a>
									</div>
								</div>

							</div>
				</section>
EOF
			}  elsif(exists($vars->{'_config'}) && $vars->{'_config'}->{'ref'} eq "ka")
			{
				$austausch=<<EOF;
				<section id="artikel-kurz" class='kasten blau'>
							<h2>Dein Kinderarzt-Profil</h2>
							<div class="fb-container text">
								<div class='row'>
									<div class='col-xs-4'>
										<img src='/g/fotos/kinderarzt2_klein.jpg' class='foto-hebamme' />
									</div>
									<div class='col-xs-8'>
										<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/profil/kinderarzt.html'>Profil &auml;ndern</a>
										<br/><br/>
										<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/wissen/gesundheit/kinder/kinderarzt/details/$vars->{'_config'}->{'subid'}/index.html'>Profil aufrufen</a>
									</div>
								</div>

							</div>
				</section>
EOF
			} else
			{
				$austausch=<<EOF;
						<section id="artikel-kurz" class='kasten blau'>
							<h2>Dein Login ... </h2>
							<div class="fb-container text">
								<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/profil/index.html'>Zu deinem Profil</a>
							</div>
						</section>
EOF
			}
			$unten.=$austausch;
		}

		# Infokasten rechts: Beliebteste Artikel
		#$hauptseite=~s/##BELIEBTE_ARTIKEL##/$main::STATISCH->{'beste_rubriken'}/g;
		$unten.=$main::STATISCH->{'beste_rubriken'};

		#if($vars->{'_user'} eq "admin")
		#{
			srand(time);
			my $max=0;
			my $zeit=&main::zeit;
			if(($zeit->{'MM'}==11) or ($zeit->{'MM'}==12 && $zeit->{'TT'}<5))
			{
				# Advent
				$max=30;
			} elsif($zeit->{'MM'}==1)
			{
				$max=20;
			} else
			{
				$max=17;
			}
			my $sr=rand($max);
			$sr=17;
			if($sr>20)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'produkte'};
			} elsif($sr>17)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'top-vornamen'};
			} elsif($sr>16)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'malvorlage'};
			} elsif($sr>14)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'witz_chuck'};
			} elsif($sr>12)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'witz'};
			} elsif($sr>10)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'spitznamen'};
			} elsif($sr>8)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'aphorismus'};
			} elsif($sr>7)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'bauernregel'};
			} elsif($sr>6)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'spruch_geburt'};
			} elsif($sr>4)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'spruch_familie'};
			} elsif($sr>3)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'zungenbrecher'};
			} elsif($sr>2)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'namenstag'};
			} elsif($sr>1)
			{
				$unten.=$main::STATISCH->{'aktueller_kasten'}->{'topspiele'};
			} else
			{
				#$unten.=$main::STATISCH->{'aktueller_kasten'}->{'geburten'};
			}
		#}

		#$unten.=$main::STATISCH->{'aktueller_kasten'}->{'promi-geburtstag'};

		my $datum=&main::getHoroskopHeute($vars);
		my $s_unten='';
		if(exists($main::cache->{'horoskop'}->{$datum}))
		{
			my @sternzeichen=("Widder","Stier","Zwilling","Krebs","Löwe","Jungfrau","Waage","Skorpion","Schütze","Steinbock","Wassermann","Fische");
			srand(time);
			my $s=int(rand(12)+1)-1;
			#$s=8;
			if(!exists($main::cache->{'horoskop_kurz'}->{$datum}->{$s}))
			{
				my @wt=('Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag','Sonntag');
				my $wt=Date::Calc::Day_of_Week($vars->{'_zeit'}->{'JJJJ'},$vars->{'_zeit'}->{'MM'},$vars->{'_zeit'}->{'TT'});
				--$wt;
				my $s1=$sternzeichen[$s];
				$s1=~s/ö/oe/;
				$s1=~s/ü/ue/;
				my $s2=$main::cache->{'horoskop'}->{$datum}->{$sternzeichen[$s]}->{'text'};
				if(length($s2)>200)
				{
					$s2=substr($s2,0,200)." ... <a href='/unterhaltung/horoskop/index.html'>weiterlesen</a>";
				}
				my $text="<div class='pull-left foto-links'><div class='text-center'><img src=/g/horoskop/$s1.gif align=middle><br/><b>".encode_utf8($sternzeichen[$s])."</b></div></div><b>$wt[$wt], der $vars->{'_zeit'}->{'TT'}.$vars->{'_zeit'}->{'MM'}.$vars->{'_zeit'}->{'JJJJ'}:</b><br/>$s2";
				$s_unten="$text<br/><br/><i class='fa fa-arrow-circle-right text-blau'></i> <a href='/unterhaltung/horoskop/index.html'>Tages-Horoskop aller Sternzeichen</a>";
				$main::cache->{'horoskop_kurz'}->{$datum}->{$s}=$s_unten;
			} else
			{
				$s_unten=$main::cache->{'horoskop_kurz'}->{$datum}->{$s};
			}
		}
		$hauptseite=~s/_#HOROSKOP#_/$s_unten/;
		#$unten.=$s_unten;

		$hauptseite=~s/_#SIDE_UNTEN#_/$unten/;






		$hauptseite=~s/##.*?##//g;
		$hauptseite=~s/_#.*?#_//g;

		if($cache_aktiv>0 and !$vars->{'_nocache'})
		{
			$main::cache->{'seite'}->{$ENV{'REQUEST_URI'}}=$hauptseite;
		}
gecacht:
		$vars->{'cookiestring'}||='';
		#my $SUBCGI = new CGI::Compress::Gzip;
		#my $s=$SUBCGI->header();
		#&main::logge_int("H: $s");

		print "$cookiestring\n" if length($cookiestring)>1;
		print "Content-type: text/html\n";

		my $clean_hauptseite=$HTMLPACKER->minify(\$hauptseite,{
			'remove_comments'	=> 1,
			'remove_newlines'	=> 1,
			'do_javascript'		=> 'best',
		});
		$clean_hauptseite=$hauptseite;

		if (defined($ENV{'HTTP_ACCEPT_ENCODING'}) && $ENV{'HTTP_ACCEPT_ENCODING'} =~ /\bgzip\b/) {
			print "Content-Encoding: gzip\n\n";
			#&main::logge_int("Compressed");
#warn("COMPRESSED");
			my $output;
			gzip \$clean_hauptseite, \$output;
			print $output
		} else
		{
			#&main::logge_int("Clean $ENV{'HTTP_USER_AGENT'}");
			print "\n";
#warn("CLEAN");
			#print "$cookiestring\n\n";
			print $clean_hauptseite;
		}


		#."<hr>X:$cookiestring<hr>";
		#&main::logge_int(" lokales Aus");
	}
	&finish($vars);

	my $laufzeit=time()-$jetzt;
#	warn("OK!");
#	&main::logge_int("L: $laufzeit");
	if($laufzeit>1.1)
	{
		open(D,">>/web/virtual/fb24_2/daten/laufzeit.txt");
		print D "$vars->{'_zeit'}->{'datum'} $vars->{'_zeit'}->{'uhr'}	$was	$laufzeit\n";
		close(D);
	}

	if(exists($main::HELPER->{$vars->{'_id'}}))
	{
		delete($main::HELPER->{$vars->{'_id'}});
	}
	if($durchlauf>5000)
	{
		&main::logge_int("REKILL PID $$ wegen 1000");
		exit(1);
	}
	#my $t1 = [Time::HiRes::gettimeofday];
	#warn("E: ".Time::HiRes::tv_interval $t0, $t1);
	#exit;
	#exit if -M "fb.fcgi"<0.00005 or -M "/web/virtual/template/cgibin/subs.pl"<0.00005;
intern_finish:
	#&main::logge_int("Aus",12);
}


sub logge_int
{
	my($msg,$level)=@_;
	$level||=0;
	if($level<=$main::VERBOSE)
	{
		#warn($msg);
		#$msg=encode_utf8($msg);
		my $zeit=&main::zeit;
		open(MLO,">>/var/log/fb24_2.log");
		eval
		{
			print MLO "$zeit->{'datum'} $zeit->{'uhr'}\t$$\t$msg\t$ENV{'HTTP_USER_AGENT'}\n";
			#print MLO "$msg\n";
		};
		close(MLO);
	}
}
