#!/usr/bin/perl

use Storable;
use lib "../..";
require "cgibin/subs.pl";

my $zeit=&zeit;

&db_connect();

my $GESCHLECHT;
foreach my $i (split(/\n/,&hole_file("../../daten/cache/vornamen.txt")))
{
	my($v,$g,$id)=split(/\t/,$i);
	$GESCHLECHT->{lc($v)}=$g;
	$main::cache->{'db'}->{'vornamen'}->{$id}->{'geschlecht'}=$g;
	$main::cache->{'vornamen_vids'}->{$id}=$v;
}

#
# Wir stellen Informationen für den letzten Kasten rechts zusammen
#

my $baum={};

my $dum=&main::socket(&to_json({
	'todo'=>'getVotes',
	'thema'=>'sprueche'
}));
my $VOTES=&from_json($dum);

my $stitel="";
my $stext="";
my $slink="";


my @erg;

my $erg=$main::DB->query("select id,rubrik,subrubrik,text,quelle from sprueche");
while(my %eintrag=$erg->fetchhash)
{
	%{$main::cache->{'db'}->{'sprueche'}->{$eintrag{'id'}}}=%eintrag;
}

#
# Promi-Geburtstage
#
#$stitel="Promi-Geburtstage";
#
#my $geb="$zeit->{'TT'}.$zeit->{'MM'}";
#$geb=~s/(^|\.)0/$1/g;
#warn("Suche $geb");
#my $erg=$main::DB->query("select * from prominente where geb like '$geb%' and tot='' order by nachname");
#my $text="";
#while(my %eintrag=$erg->fetchhash)
#{
#	print "O: $eintrag{'vorname'} $eintrag{'nachname'}\n";
#	$text.="$eintrag{'vorname'} $eintrag{'nachname'}<br/>";
#}
#$baum->{'promi-geburtstag'}=&getKasten($stitel,$text);


#
# Spruch/Gedicht des Tages
#
print "- Kinderwitze ... ";
$stitel="Witz der Stunde";
my @temp=&main::mischeListe(
	"Mehr Kinderwitze",
	"Alle Kinderwitze",
	"Alle guten Kinderwitze",
	"Mehr Witze"
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/witze/'>".shift(@temp)."</a>";

foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};

	next if $eintrag{'rubrik'} ne "witze";
	next if length($eintrag{'text'})>300;
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'witz'}=&getKasten($stitel,$text,$slink);
print "ok\n";

print "- Chuck Norris Facts... ";
$stitel="Chuck Norris Fact";
my @temp=&main::mischeListe(
	"Mehr Chuck Norris Facts",
	"Alle Chuck Norris Facts",
	"Mehr Chuck Norris Fakten",
	"Mehr Chuck Norris Witze"
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/witze/chucknorris/'>".shift(@temp)."</a>";
@erg=();
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};

	next if $eintrag{'rubrik'} ne "witze";
	next if $eintrag{'subrubrik'} ne "chucknorris";
	next if length($eintrag{'text'})>300;
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'witz_chuck'}=&getKasten($stitel,$text,$slink);
print "ok\n";



#
# Spruch/Gedicht des Tages
#
print "- Bauernregeln ... ";
@temp=&mischeListe(
	"Heutige Bauernregel",
	"Schlaue Bauern",
	"Bauernregel für heute"
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
	"Alle Bauernregeln",
	"Echte &amp; lustige Bauernregeln",
	"Zeige alle Bauernregeln",
	"Mehr Bauernregeln"
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/bauernregeln/'>".shift(@temp)."</a>";

my @ok;
my @rest;

my $tt=$zeit->{'TT'}.".".$zeit->{'MM'};
$tt=~s/(^|\.)0/$1/;
my $lfd=0;
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};
	next if $eintrag{'rubrik'} ne "sprueche_bauernregeln";
	next if length($eintrag{'text'})>300;
	++$lfd;
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	my $fontsize="xlg";
	if(length($eintrag{'text'})>60)
	{
		$fontsize="lg";
	}

	if($eintrag{'subrubrik'}=~/^0?(\d+)\. (.*?)$/)
	{
		my ($tag,$monat)=($1,&getMonatszahl($2));
		if("$tag.$monat" eq $tt)
		{
			$eintrag{'text'}="<p>Bauernregel für heute:</p><p><i class='font-$fontsize'>$eintrag{'text'}</i></p>";
			push(@ok,\%eintrag);
		}
	} elsif(length($eintrag{'subrubrik'})<1)
	{
		$eintrag{'text'}="<p>Bauernweisheit No. $lfd:</p><p><i class='font-$fontsize'>$eintrag{'text'}</i></p>";
		push(@rest,\%eintrag);
	}
}
if($#ok>-1)
{
	@erg=@ok;
} else
{
	@erg=@rest;
}

my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'bauernregel'}=&getKasten($stitel,$text,$slink);
#exit;


#
# Aphorismus
#
$stitel="Berühmte Zitate";
my @temp=&main::mischeListe(
	"Mehr berühmte Zitate",
	"Mehr Zitate von Promis",
	"Andere berühmte Zitate",
	"Andere kluge Sprüche",
	"Mehr kluge Sprüche",
	"Alle Aphorismen",
	"Aphorismus-Datenbank"
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/aphorismen/'>".shift(@temp)."</a>";
@erg=();
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};
	next if $eintrag{'rubrik'} ne "sprueche_aphorismen";
	next if length($eintrag{'text'})>300;

	my $fontsize="xlg";
	if(length($eintrag{'text'})>180)
	{
		$fontsize="lg";
	}
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n$//g;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	$eintrag{'text'}=~s/(<br\/>)+$//g;
	$eintrag{'text'}="<i class='font-$fontsize'>$eintrag{'text'}</i>";
	if(length($eintrag{'quelle'})>2)
	{
		$eintrag{'text'}.="<br/><p style='margin-top:6px;'>&nbsp;&nbsp;&nbsp;&mdash; $eintrag{'quelle'}</p>	";
	}
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'aphorismus'}=&getKasten($stitel,$text,$slink);


#
# Spruch zur Geburt
#
@temp=&mischeListe(
	"Spruch zur Geburt",
	"Gedicht zur Geburt",
	"Geburtsgedichte",
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
	"Mehr Gedichte zur Geburt",
	"Mehr Sprüche für Neugeborene",
	"Andere Sprüche zur Geburt",
	"Andere Gedichte zur Geburt",
	"Alle Geburtsgedichte",
	"Alle Sprüche zur Geburt",
	"Alle Gedichte zur Geburt",
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/nachwuchs/geburt/gedichte/'>".shift(@temp)."</a>";
@erg=();
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};
	next if $eintrag{'rubrik'}!~/^geburt_/;
	next if length($eintrag{'text'})>300;

	my $fontsize="xlg";
	if(length($eintrag{'text'})>80)
	{
		$fontsize="lg";
	}
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n$//g;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	$eintrag{'text'}=~s/(<br\/>)+$//g;
	$eintrag{'text'}="<i class='font-$fontsize'>$eintrag{'text'}</i>";
	if(length($eintrag{'quelle'})>2)
	{
		$eintrag{'text'}.="<br/><p style='margin-top:6px;'>&nbsp;&nbsp;&nbsp;&mdash; $eintrag{'quelle'}</p>	";
	}
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'spruch_geburt'}=&getKasten($stitel,$text,$slink);


#
# Familienspruch
#
@temp=&mischeListe(
	"Familiensprüche",
	"Sprüche zum Familienleben",
	"Die liebe Familie",
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
	"Mehr Sprüche über die Familie",
	"Mehr Familiensprüche",
	"Andere Familiensprüche",
	"Alle Familiensprüche",
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/familie/'>".shift(@temp)."</a>";
@erg=();
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};
	next if $eintrag{'rubrik'} ne "sprueche_familie";
	next if length($eintrag{'text'})>300;

	my $fontsize="xlg";
	if(length($eintrag{'text'})>80)
	{
		$fontsize="lg";
	}
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n$//g;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	$eintrag{'text'}=~s/(<br\/>)+$//g;
	$eintrag{'text'}="<i class='font-$fontsize'>$eintrag{'text'}</i>";
	if(length($eintrag{'quelle'})>2)
	{
		$eintrag{'text'}.="<br/><p style='margin-top:6px;'>&nbsp;&nbsp;&nbsp;&mdash; $eintrag{'quelle'}</p>	";
	}
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'spruch_familie'}=&getKasten($stitel,$text,$slink);


#
# Top-Spiele
#
@temp=&mischeListe(
	"Die besten Spiele",
	"Spiele für Drinnen &amp; Draussen",
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
	"Alle Spiele",
	"Spiele für Draussen &amp; Drinnen",
	"Spiele für Drinnen &amp; Draussen",
	"Spiele für Drinnen &amp; Draussen",
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/wissen/nachwuchs/paedagogik/spielen/spielesammlung/'>".shift(@temp)."</a>";
$text="";

$main::STATISCH->{'votes'}->{'spiele'}=&from_json(&main::socket(to_json({
	'todo'=>'getVotes',
	'thema'=>'spiele'
})));

my $erg=$main::DB->query("select * from spiele");
my $spiele={};
my %votes=%{$main::STATISCH->{'votes'}->{'spiele'}};

while(my %eintrag=$erg->fetchhash)
{
	$eintrag{'rubrik'}=~s/Ratespiele(,|$)/$1/;
	next if length($eintrag{'rubrik'})<3;
	$spiele->{$eintrag{'id'}}->{'eintrag'}=\%eintrag;
	if(!exists($votes{$eintrag{'id'}}) or !exists($votes{$eintrag{'id'}}->{'alle'}) or !exists($votes{$eintrag{'id'}}->{'alle'}->{'anz'}) or $votes{$eintrag{'id'}}->{'alle'}->{'punkte'}<1)
	{
		##&main::logge_int("H: $eintrag{'id'}");
		$votes{$eintrag{'id'}}->{'alle'}->{'anz'}=0;
		$votes{$eintrag{'id'}}->{'alle'}->{'punkte'}=0;
		$votes{$eintrag{'id'}}->{'alle'}->{'bew'}=0;
	} else
	{
		#&main::logge_int("W: $eintrag{'id'}: $votes{$eintrag{'id'}}->{'alle'}->{'punkte'}/$votes{$eintrag{'id'}}->{'alle'}->{'anz'}");
		$votes{$eintrag{'id'}}->{'alle'}->{'bew'}=$votes{$eintrag{'id'}}->{'alle'}->{'punkte'}/$votes{$eintrag{'id'}}->{'alle'}->{'anz'};
	}
	$spiele->{$eintrag{'id'}}->{'bew'}=$votes{$eintrag{'id'}}->{'alle'}->{'bew'};

	#&main::logge_int("============");
}
my %links;
$lfd=1;
foreach my $i (
	"Fangspiele§fangspiele§Fangspiele machen Kindern aller Altersgruppen immer großen Spaß, denn hier stehen der Bewegungsdrang und der Spieltrieb im Vordergrund - Austoben &amp; Ausgelassenheit sind hier Pflicht und auch in der Wohnung bzw. auf begrenztem Raum problemlos möglich! Fangspiele eignen sich auch sehr gut als Kennenlernspiele, wenn Kinder sich das erste Mal begegnen.§illu-spielen-suchen2.png",
	"Kreative Spiele§kreXative-spiele§Kreative Spiele sind eher ruhigere Spiele. Sie fördern Fantasie und Geschicklichkeit, auch Ausdrucksvermögen und rhetorische Fähigkeiten werden spielerisch geschult. Kreative Spiele sind auch immer eine willkommene Abwechslung nach einem anstrengenden Spiel oder wenn die Kinder langsam zur Ruhe kommen sollen.§illu-spielen-kreativitaet-drinnen.png",
	"Spiele für Kindergeburtstage§geburtstag§Bei den Spielen für Kindergeburtstagen haben wir dir Spiele aufgeführt, die eigentlich keine Verlierer kennen - auch wenn das Geburtstagskind in den meisten Spielen eine herausragende Rolle übernehmen muss. Viele der Spiele eignen sich auch dafür, jedem Kind ein kleines Geschenk zu überlassen, so dass sich niemand zurückgesetzt fühlt.§illu-spielen-geburtstag.png",
	"Geschicklichkeitsspiele§geschicklichkeitsspiele§Hier sind meist Bewegung und Konzentration gefragt und es wird nur wenig Platz gebraucht. Die Spiele sind auch als Überbrückung zwischen zwei wilderen Spielen oder als Team-Übungen geeignet. Wir haben darauf geachtet, nur Spiele in die Liste aufzunehmen, die keine zusätzlichen Gegenstände benötigen (die es nicht in der Umwelt einfach zu finden gibt).§illu-spielen-geschicklichkeit.png",
	"Partyspiele§partyspiele§Lustige Partyspiele können (sollen?) jede Feier aufheitern - ob es Geburtstage, Jubiläen, Hochzeiten oder einen anderen Grund zum Feiern gibt. Meist werden ein bis zwei Freiwillige aus der Gruppe ausgewählt, die eine - mehr oder weniger schwere - Aufgabe meistern müssen. Das Ergebnis ist meist ein fröhliches Lachen der anderen Kinder und Erwachsene.§illu-spielen-party.png",
	"Suchspiele§suchspiele§Kinder können mit Hilfe von Suchspielen den Bewegungstrieb entfalten, aber durch die geforderte Konzentration beim Suchen und Verstecken können Suchspiele auch sehr gut zum Beruhigen einer Gruppe dienen. Auch wenn man den Kindern kleine Überraschungen überlassen möchte (z. B. zum Ausklang eines Kindergeburtstages) bieten sich diese Spiele an.§illu-spielen-suchen.png",
	"Spiele am Wasser§wasserspiele§Wenn Kinder und Wasser zusammenkommen, ist ausgelassenes und fröhliches Treiben meist vorprogrammiert :) Du findest hier viele Spiele, die auch für Nichtschwimmer geeignet sind und die auch in einem kleinen Pool gespielt werden können. Aber beim Spielen im Wasser bitte nie das Eincremen mit Sonnenschutz vergessen!§illu-spielen-amwasser.png",
	"Spiele im Wald§waldspiele§Wälder sind sehr geeignete Spielplätze für kleine und große Kindergruppen, denn in einem Wald kann man ganz fantastisch spielen - man hat viel Platz, kann ganz viele Sachen entdecken, man stört niemanden und findet überall ein Versteck! Auch bieten Wälder eine Fülle von Gegenständen, die man super in die eigenen Spiele einbauen kann.§illu-spielen-fangen.png",
)
{
	my($titel,$link,$desc,$foto)=split(/§/,$i);

	++$lfd;
	$links{$titel}="/wissen/nachwuchs/paedagogik/spielen/spielesammlung/seite$lfd.html";
}
my (@draussen,@drinnen);
foreach my $i (sort {
	$spiele->{$b}->{'bew'} <=> $spiele->{$a}->{'bew'}
} keys %$spiele)
{
	#&main::logge_int("ID: $i = $votes{$i}->{'alle'}->{'bew'}");

	push(@draussen,$i);
}
$spiele->{$draussen[$i]}->{'eintrag'}->{'rubrik'}=~s/Ratespiele(,|$)/$1/;
for my $i (0..4)
{
	next if length($spiele->{$draussen[$i]}->{'eintrag'}->{'rubrik'})<2;
	my @r=&mischeListe(split(/, ?/,$spiele->{$draussen[$i]}->{'eintrag'}->{'rubrik'}));
	my $rubrik=shift(@r);
	$text.="<p><a href='/wissen/nachwuchs/paedagogik/spielen/spielesammlung/spiel$spiele->{$draussen[$i]}->{'eintrag'}->{'id'}.html'>$spiele->{$draussen[$i]}->{'eintrag'}->{'titel'}</a><br/><small><span class='text-muted'>Aus:</span> <i class='fa fa-arrow-circle-right text-blau'></i> <a href='$links{$rubrik}'>$rubrik</a></small></p>";
}
$baum->{'topspiele'}=&getKasten($stitel,$text,$slink);


#
# Zungenbrecher
#
@temp=&mischeListe(
	"Zungenbrecher",
	"Schnellsprechsprüche",
	"Schnellsprechspruch",
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
	"Mehr Zungenbrecher",
	"Andere Zungenbrecher",
	"Alle Zungenbrecher",
	"Mehr Schnellsprechsprüche",
	"Andere Schnellsprechsprüche",
	"Alle Schnellsprechsprüche",
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/sprueche/zungenbrecher/'>".shift(@temp)."</a>";
@erg=();
foreach my $spruch (keys %{$main::cache->{'db'}->{'sprueche'}})
{
	my %eintrag=%{$main::cache->{'db'}->{'sprueche'}->{$spruch}};
	next if $eintrag{'rubrik'} ne "sprueche_zungenbrecher";
	next if length($eintrag{'text'})>300;

	my $fontsize="xlg";
	if(length($eintrag{'text'})>80)
	{
		$fontsize="lg";
	}
	eval{
		#&logge_int("ID: $eintrag{'id'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'} = $VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}");
		$eintrag{'votenote'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'vote_anz'}=$VOTES->{$eintrag{'id'}}->{'alle'}->{'anz'};
	};
	$eintrag{'votenote'}||=0;
	$eintrag{'text'}=~s/(\s+)?\n$//g;
	$eintrag{'text'}=~s/(\s+)?\n/<br\/>/g;
	$eintrag{'text'}=~s/(<br\/>)+$//g;
	$eintrag{'text'}="<i class='font-$fontsize'>$eintrag{'text'}</i>";
	if(length($eintrag{'quelle'})>2)
	{
		$eintrag{'text'}.="<br/><p style='margin-top:6px;'>&nbsp;&nbsp;&nbsp;&mdash; $eintrag{'quelle'}</p>	";
	}
	push(@erg,\%eintrag)
}
my $lfd=0;
my @neu;
foreach my $i (sort { $b->{'votenote'}<=>$a->{'votenote'} } @erg)
{
	last if ++$lfd>25;
	push(@neu,$i->{'text'});
}
@neu=&mischeListe(@neu);
my $text=shift(@neu);
$baum->{'zungenbrecher'}=&getKasten($stitel,$text,$slink);

#
# Namenstage
#
@temp=&mischeListe(
	"Namenstag heute",
	"Heute ist Gedenktag für",
	"Heute haben Namenstag",
	"Heutige Namenstage"
	#"Schnellsprechspruch",
);
$stitel=shift(@temp);
my @temp=&main::mischeListe(
);
$text="";
$main::cache->{'vornamen_namenstage'}=retrieve("$main::master->{'_path_data'}/vornamen/namenstage.idx");
foreach my $vorname (sort keys %{$main::cache->{'vornamen_namenstage'}})
{
	foreach my $i (keys %{$main::cache->{'vornamen_namenstage'}->{$vorname}})
	{
		if($#{$main::cache->{'vornamen_namenstage'}->{$vorname}->{$i}}>-1)
		{
			foreach my $j (@{$main::cache->{'vornamen_namenstage'}->{$vorname}->{$i}})
			{
				if($j->{'datum'}=~/^(\d+)\. (.*?)$/)
				{
					my ($tag,$monat)=($1,&getMonatszahl($2));
					if("$tag.$monat" eq $tt)
					{
						my $tot;
						if($j->{'desc'}=~s/ \(\+?(.*?)\)//)
						{
							my $ttt=$1;
							$ttt=~s/^[\d\.]+-//;
							$ttt=~s/^\d+\.\d+\.(\d+)$/$1/;
							$tot="✝ $ttt";
						}
						$text.="<p><b>$j->{'person'}</b> $tot<br/><span class='text-muted'><i>$j->{'desc'}</i></span></p>";
					}
				}
			}
		}
	}
}
if(length($text)>10)
{
	$baum->{'namenstag'}=&getKasten($stitel,$text);
}


#
# Malvorlagen
#
@temp=&mischeListe(
	"Malvorlagen",
	"Ausmalbilder",
	"Malvorlagen",
	"Ausmalbilder",
	"Malen für Kinder",
	"Malvorlagen für Kinder",
	"Kostenlose Malvorlagen"
);
$stitel=shift(@temp);
print "- Malvorlagen: ";
my $R=retrieve("/web/virtual/fb24_2/daten/arbeitsblaetter.idx");
my @temp;
my $kategorie='Ausmalbilder';
srand;
foreach my $i (sort keys %{$R->{$kategorie}->{'rubriken'}})
{
	my $bilder='';
	my @temp2;
	foreach my $bb (sort keys %{$R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}})
	{
		my $ext=$R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}->{$bb}->{'ext'} || "png";
		$R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}->{$bb}->{'titel'}=encode_utf8($R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}->{$bb}->{'titel'});
		push(@temp2,"<a href='/wissen/bildung/arbeitsblaetter/ausmalbilder/bild$bb.html'><img class='foto' src='/g/arbeitsblaetter/t_$R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}->{$bb}->{'file'}.$ext' style='width:60%;'/><br/>$R->{$kategorie}->{'rubriken'}->{$i}->{'bilder'}->{$bb}->{'titel'}</a>");
	}
	#print "Hits2: @temp\n";
	@temp2=&main::mischeListe(@temp2);
	push(@temp,shift(@temp2));
}
@temp=&main::mischeListe(@temp);
$text="<div class='text-center' style='width:100%'>".shift(@temp);
print "Hits: $text\n";
$text.="<br/><br/><i class='fa fa-arrow-circle-right text-blau'></i> <a href='/wissen/bildung/arbeitsblaetter/ausmalbilder.html'>Schöne Ausmalbilder für Kinder</a></div>";
if(length($text)>10)
{
	$baum->{'malvorlage'}=&getKasten($stitel,$text);
}


#
# Die aktuellsten Geburten
#
goto ohne_geburten;
@temp=&mischeListe(
	"Die aktuellsten Geburten",
	"Die letzten Geburten",
	"Geburten-Ticker",
	"Neue Erdenbürger"
);
$stitel=shift(@temp);
@temp=&mischeListe(
	"Komplette Geburtsstatistik",
	"Aktuelle Geburtsstatistik",
	"Zur Geburtsstatistik",
	"Alle Geburten",
	"Geburten in Deutschland",
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/wissen/nachwuchs/geburt/statistik/'>".shift(@temp)."</a>";

$lfd=0;
$text="";
&db_connect(0);
my $KH={};
my $erg=$main::DB->query("select * from babyfoto_kh");
while(my %e=$erg->fetchhash)
{
	$KH->{$e{'namekurz'}}=\%e;
}

$erg=$main::DB->query("select * from geburten where datum!='0000-00-00' and uhr!='00:00:00' order by datum desc,uhr desc limit 50");
while(my %e=$erg->fetchhash)
{
	if ($e{'datum'}=~/^0\d+-(.*?)$/)
	{
		my $r=$1;
		$main::DB->query("update geburten set datum='2015-$r' where fotoid=$e{'fotoid'}");
		$e{'datum'}="2015-$r";
	}
	my $s1=$e{'datum'};
	$s1=~s/\-//g;
	my $s2=join("",reverse(split(/\./,$zeit->{'datum'})));
	#$s2=~s/\.//g;
	next if($s1>$s2);

	if ($s1==$s2)
	{
		my $z1="$zeit->{'HH'}$zeit->{'MIN'}$zeit->{'SS'}";
		my $z2=$e{'uhr'};
		$z2=~s/://;
		#warn("A: $z1 / $z2");
		if(($z1-$z2)<2)
		{
			next;
		}

	}

	my $name=ucfirst($e{'vorname'});
	next if length($name)>20;
	if(length($e{'nachname'})>0 and $e{'nachname'} ne ".")
	{
		$name.=" ".substr($e{'nachname'},0,1).".";
	}
	last if ++$lfd>6;
	my $geschlecht=&main::bestimmeGeschlecht($e{'vorname'},$GESCHLECHT);
	next if $geschlecht!~/^m|w$/;
	my $icon = $geschlecht eq "m" ? "jungs" : "maedchen";
	@temp=&mischeListe(
		"*",
		"Geburt war",
		"geboren",
		"auf die Welt gekommen",
		"wurde geboren"
	);
	if(!exists($KH->{$e{'kh'}}))
	{
		warn("Unbekanntes Krankenhaus: $e{'kh'}");
		next;
	}
	my $geb=shift(@temp);
	$text.="<p><img src='/g/icons/$icon.gif'/> <b>$name</b> <small class='text-muted'>* <span class='_jsdate' title='$e{'datum'} $e{'uhr'}'>$e{'datum'} $e{'uhr'}</span> in $KH->{$e{'kh'}}->{'ort'}";
	if($e{'gewicht'}>0)
	{
		$text.=" mit ".&commify($e{'gewicht'},".")."g";
		if($e{'groesse'}>0)
		{
			$text.=" und $e{'groesse'} cm";
		}
	} elsif($e{'groesse'}>0)
	{
		$text.=" mit $e{'groesse'} cm";
	}
	$text.="</small></p>\n";
}
$baum->{'geburten'}=&getKasten($stitel,"$text",$slink);

ohne_geburten:


#
#	Spitznamen
#
 $stitel="Die neuesten Spitznamen";
my @temp=&main::mischeListe(
	"Zur Vornamen-Datenbank",
	"Zur Vornamendatenbank",
	"Zum Vornamen-Lexikon",
	"Alle Vornamen"
);
$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/vornamen/'>".shift(@temp)."</a>";
my $json=&main::socket(&to_json({
	'todo'=>'getVotesNeu',
	'thema'=>"vornamen-spitznamen"
}));
my $e=&from_json($json);
my $lfd=0;
my $text="";
foreach my $i (reverse @$e)
{
	my $wann=&zeitWort($i->{'datum'},$i->{'uhr'});
	next if !$i->{'sub'} or !$i->{'id'};
	#&main::logge_int("TTT: $i->{'v'}/$i->{'id'}");
	last if ++$lfd>5;
	my $gesch= $main::cache->{'db'}->{'vornamen'}->{$i->{'id'}}->{'geschlecht'} eq "m" ? "jungs" : "maedchen";
	$text.=<<EOF;
<div class='font-lg'>
	<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/vornamen/$gesch/$main::cache->{'vornamen_vids'}->{$i->{'id'}}/sonstiges.html'><b><i>$i->{'sub'}</i></b> f&uuml;r $main::cache->{'vornamen_vids'}->{$i->{'id'}}</a>
</div>
<p class='text-muted font-sm'>$wann von $i->{'user'}</p>
EOF
}
$baum->{'spitznamen'}=&getKasten("Die neuesten Spitznamen",$text,$slink);


#
#	Top-Vornamen
#
if($zeit->{'MM'}==1)
{
	my $j=($zeit->{'JJJJ'}-1);
	$stitel="Top-Vornamen $j";
	my @temp=&main::mischeListe(
		"Top-Vornamen $j zeigen",
		"Top-Vornamencharts $j",
		"Die besten Vornamen $j",
		"Die häufigsten Vornamen $j"
	);
	$slink="<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/vornamen/charts/index.html'>".shift(@temp)."</a>";

	my $text=<<EOF;
<script type='text/javascript' src='/js/helper/slick.min.js'></script>
<link rel="stylesheet" href="/css/helper/slick.css">

<div class="_pre_carousel text-center v" style='height:350px;'>
	<div>
		<h3 class='subtitel'>Beliebte Jungen-Vornamen</h3>
		<table class='table table-condensed'>
			<tr><td align='right'><span class='badge blau'>1</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Elias/'><b>Elias</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>2</span></td><td align='center'><span class='text-success'>+2</span></td><td align='left'><a href='/vornamen/jungs/Paul/'><b>Paul</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>3</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Ben/'><b>Ben</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>4</span></td><td align='center'><span class='text-danger'>-2</span></td><td align='left'><a href='/vornamen/jungs/Maximilian/'><b>Maximilian</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>5</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Leon/'><b>Leon</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>6</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Jonas/'><b>Jonas</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>7</span></td><td align='center'><span class='text-success'>+1</span></td><td align='left'><a href='/vornamen/jungs/Alexander/'><b>Alexander</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>8</span></td><td align='center'><span class='text-danger'>-1</span></td><td align='left'><a href='/vornamen/jungs/Noah/'><b>Noah</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>9</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Felix/'><b>Felix</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>10</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/jungs/Lukas/'><b>Lukas</b></a></td></tr>
		</table>
	</div>
	<div>
		<h3 class='subtitel'>Beliebte Mädchen-Vornamen</h3>
		<table class='table table-condensed'>
			<tr><td align='right'><span class='badge blau'>1</span></td><td align='center'><span class='text-success'>+1</span></td><td align='left'><a href='/vornamen/maedchen/Marie/'><b>Marie</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>2</span></td><td align='center'><span class='text-danger'>-1</span></td><td align='left'><a href='/vornamen/maedchen/Sophie/'><b>Sophie</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>3</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/maedchen/Mia/'><b>Mia</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>4</span></td><td align='center'><span class='text-success'>+1</span></td><td align='left'><a href='/vornamen/maedchen/Emilia/'><b>Emilia</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>5</span></td><td align='center'><span class='text-danger'>-1</span></td><td align='left'><a href='/vornamen/maedchen/Emma/'><b>Emma</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>6</span></td><td align='center'><span class='text-success'>+1</span></td><td align='left'><a href='/vornamen/maedchen/Sophia/'><b>Sophia</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>7</span></td><td align='center'><span class='text-danger'>-1</span></td><td align='left'><a href='/vornamen/maedchen/Anna/'><b>Anna</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>8</span></td><td align='center'><span class='text-muted'>=</span></td><td align='left'><a href='/vornamen/maedchen/Lena/'><b>Lena</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>9</span></td><td align='center'><span class='text-success'>+1</span></td><td align='left'><a href='/vornamen/maedchen/Lina/'><b>Lina</b></a></td></tr>
			<tr><td align='right'><span class='badge blau'>10</span></td><td align='center'><span class='text-danger'>-1</span></td><td align='left'><a href='/vornamen/maedchen/Johanna/'><b>Johanna</b></a></td></tr>
		</table>
	</div>
</div>
EOF
	$baum->{'top-vornamen'}=&getKasten("Beliebteste Vornamen $j",$text,$slink);
}




#
# Produkte
#
if(($zeit->{'MM'}==11) or ($zeit->{'MM'}==12 && $zeit->{'TT'}<5))
{
	print "- Lade Produkte ... ";
	my @temp=&mischeListe(
		"Aktuelle Produkte",
		"Aktuelle Produkte",
		"Einkauf-Tipps",
		"Aus aktuellem Anlaß"
	);
	$stitel=shift(@temp);
	$erg=$main::DB->query("select * from geschenke where anlass='advent' order by votes");
	my @produkte;
	my $lfd=0;
	while(my %e=$erg->fetchhash)
	{
		my @t1=("Kostenlos","Sehr günstig","Günstig","Schnäppchen","Angemessen","Noch angemessen","Teuer aber gut");
		my @t2=('#006600','#228822','#44aa44','#66cc66','#aaffaa','#88aa88','#aa8888');
		my $preis_farbe=$t2[$e{'preisniveau'}];
		my $preis_text=$t1[$e{'preisniveau'}];
		next if $e{'tags'}=~/essen/ or $e{'tags'}!~/kind|teenie/;
		$e{'fotos'}=~s/_110/_200/;
		push(@produkte,"<div class='text-center'>
			<a href='$e{'link'}' target='_blank' class='font-xlg text-blau'>$e{'titel'}</a>
			<br/>
			<div class='padding-10'>
				<a href='$e{'link'}' target='_blank'>
					<img class='foto' src='$e{'fotos'}' alt='$e{'titel'}' style='height:120px;margin-left:auto;margin-right:auto;'/>
				</a>
			</div>
			<div class='row'>
				<div class='col-xs-7'>
					<div class='badge' style='background-color:$preis_farbe;margin-top:4px;'>
						$preis_text
					</div>
				</div>
				<div class='col-xs-5 font-xlg text-blau'>
					<b><a href='$e{'link'}' target='_blank'>&euro; $e{'preis'}</a></b>
				</div>
			</div>
		</div>
		");

		++$lfd;
		last if $lfd>5;
	}
	if($#produkte>-1)
	{
		my @temp=&mischeListe(
			"Alle Adventskalender 2015",
			"Adventskalender 2015",
			"Top-Adventskalender 2015",
			"Die besten Adventskalender",
			"Die schönste Adventskalender",
			"Adventskalender mit Spielzeug",
		);
		my $slink=shift(@temp);
		my $p_liste=join("\n",&mischeListe(@produkte));
		$text=<<EOF;
<script type='text/javascript' src='/js/helper/slick.min.js'></script>
<link rel="stylesheet" href="/css/helper/slick.css">

<div class="_pre_carousel text-center v" style='height:230px;'>
	$p_liste
</div>
<i class='fa fa-arrow-circle-right text-blau'></i> <a href='/geschenke/advent/'>$slink</a>
EOF
		$baum->{'produkte'}=&getKasten($stitel,$text);
		print ($#produkte+1)." Produkte gefunden\n";
	} else
	{
		print "Fehler: keine Produkte gefunden!\n";
	}

}


store($baum,"$main::master->{'_path_data'}/aktuell_1h.idx");
#print "OK: $baum->{'aphorismus'}";



sub getKasten
{
	my ($stitel,$stext,$slink)=@_;
	if(length($slink)>0)
	{
		$slink="<p style='margin-top:6px;'>$slink</p>";
	}
	return <<EOF;
<h5 id="btnText-sideinfozusatz" class="collapsed d-block d-sm-block d-lg-none cat-green">
	<a data-toggle="collapse" href="#collapseText-sideinfozusatz" data-target="#collapseText-sideinfozusatz" aria-expanded="false" aria-controls="collapseText-sideinfozusatz">
		$stitel
	</a>
</h5>
<div id="collapseText-sideinfozusatz" class="collapse cat-green mb-sm-5" aria-labelledby="btnText-sideinfozusatz" data-parent="#infoblock">
	<div class="card mb-5 box-shadow featured-list">
		<div class="card-body">
			<h5 class="small category">$stitel</h5>
			<p class="card-text d-none d-lg-block">
				$stext
				$slink
			</p>
		</div>
	</div>
</div>
EOF
}

sub getKastenRahmenlos
{
	my ($stitel,$stext,$slink)=@_;
	if(length($slink)>0)
	{
		$slink="<p style='margin-top:6px;'>$slink</p>";
	}
	return <<EOF;
<section id="aktuell" class='kasten blau'>
	<h2>$stitel</h2>
	<div class="fb-container text no-padding" style='margin-top:-10px !important;'>
		$stext
		$slink
	</div>
</section>
EOF
}
#
# Spitznamen
#




sub logge_int
{
	my ($msg,$lv)=@_;
	warn($msg);
}
