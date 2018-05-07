#!/usr/bin/perl

use Storable;
use LWP::Simple;

my $e=get("http://familienbande24.disqus.com/recent_comments_widget.js?num_items=10&hide_avatars=0&avatar_size=40&excerpt_length=200");
#$e=~s/(\\)?\n/ /g;
$e=~s/(\\)\s+/ /g;

#print "OK: ".-M "/etc/firewall.sh";
if(-M "/etc/firewall.sh"<0.0035)
{
	`/etc/firewall.sh`;
}

open(D,">/web/virtual/fb24svn/daten/kommentare_aktuell.txt");
print D "<ul class='dsq-widget-list'>\n";
while($e=~/<li class="dsq-widget-item">(.*?)<\/li>/g)
{
	my $inner=$1;

	$inner=~s/vornamen\/(.*?)\/(.*?)\.html/vornamen\/$1\/$2\/index\.html/g;
	$inner=~s/\/vornamen\/(maedchen|jungs)\/([A-Z][a-z]+)\/?"/\/vornamen\/$1\/$2\/index\.html"/g;
	$inner=~s/\/\/vornamen/\/vornamen/g;
	$inner=~s/\/\/index/\/index/g;
	if($inner=~s/1 day ago</Gestern</)
	{
	} elsif($inner=~s/(\d+) hours ago</Vor $1 Stunden</)
	{
	} elsif($inner=~s/(\d+) days ago</Vor $1 Tagen</)
	{
	} elsif($inner=~s/(\d+) week ago</Vor 1 Woche</)
	{
	} elsif($inner=~s/(\d+) weeks ago</Vor $1 Wochen</)
        {
        } 
	print D "<li class='dsq-widget-item'>$inner</li>\n";
#	print D $inner;
#exit;
}
print D "</ul>\n";
close(D);
