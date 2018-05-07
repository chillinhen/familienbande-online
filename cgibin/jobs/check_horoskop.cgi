#!/usr/bin/perl

require "../subs.pl";

my $zeit=&main::zeit;

use WWW::Mechanize;
use Date::Calc;

my($jahr,$monat,$tag)=Date::Calc::Add_Delta_Days($zeit->{'JJJJ'},$zeit->{'MM'},$zeit->{'TT'},"+1");
$monat="0$monat" if length($monat)<2;
$tag="0$tag" if length($tag)<2;

print "Suche Horoskop für $tag.$monat.$jahr\n";

if(-e "/web/virtual/fb24svn/daten/horoskope/$jahr$monat$tag.txt")
{
	print "Horoskop ist da, alles gut!";
	exit;
}

print "Erstelle Horoskop für $tag.$monat.$jahr ... ";

my $mech=WWW::Mechanize->new();

$mech->get("http://192.168.1.15/fb.fcgi?seite=intern_horoskop_erstellung&w3rsfq=k8h7we&d=1");
$mech->submit_form();

open(X,">test.html");
print X $mech->content();
close(X);

print "Fertig!\n";


