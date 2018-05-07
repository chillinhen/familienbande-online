
our %rubriken_ids=(
	'fangspiele'=>2,
	'kreativspiele'=>3,
	'kreative spiele'=>3,
	'kindergeburtstage'=>4,
	'spiele für kindergeburtstage'=>4,
	'geschicklichkeitsspiele'=>5,
	'partyspiele'=>6,
	'suchspiele'=>7,
	'spiele am wasser'=>8,
	'spiele im wald'=>9,
	'ratespiele'=>10
);

sub info_kat
{
	my $kat=shift;
	my $e={};

   if($kat eq "Fangspiele")
	{
		$e->{'einleitung_zusatz'}="Fangspiele machen auch größeren Kindern noch Spaß. Hier steht die Bewegung an der frischen Luft, Spielspass und Austoben im Vordergrund. Fangspiele sind auch klassische Warmups - sind also besonders für Gruppen geeignet, bei der sich die Mitspieler noch nicht so kennen.";
	} elsif($kat eq "Geschicklichkeitsspiele")
	{
		$e->{'einleitung_zusatz'}="Geschicklichkeitsspiele sind oft Spiele, bei denen gleichzeitig Bewegung und Konzentration gefordert ist. Man kann die meisten Spiele draußen an der frischen Luft spielen oder bei schlechtem Wetter auch drinnen in der Wohnung.";
	} elsif($kat eq "Spiele für Kindergeburtstage")
	{
		$e->{'einleitung_zusatz'}="Die Spiele in der folgenden Liste kannst du sehr gut bei Kindergeburtstagen oder ähnlichen Kinderfesten verwenden. Ob es ums Kennenlernen, Süssigkeiten verteilen oder sportlichen Wettkampf geht - in unserer Spielesammlung für Kindergeburtstage findest du Spiele für jeden Zweck, Altersstufe und Gruppengröße.";
	} elsif($kat eq "Kreative Spiele")
	{
		$e->{'einleitung_zusatz'}="Kreative Spiele fördern die Fantasie, die Geschicklichkeit und das Ausdrucksvermögen von Kindern. Kreative Spiele sind auch immer eine willkommene Abwechslung nach einem anstrengenden Spiel oder wenn die Kinder langsam zur Ruhe kommen sollen.";
	} elsif($kat eq "Suchspiele")
	{
		$e->{'einleitung_zusatz'}="Suchspiele können gleichermaßen drinnen wie draußen gespielt werden - je nach Art der versteckten Gegenstände und natürlich der Verstecke kann man Kinder mit Hilfe von Suchspielen entweder herunterfahren oder den Bewegungstrieb entfalten lassen.";
	} elsif($kat eq "Spiele am Wasser")
	{
		$e->{'einleitung_zusatz'}="Wenn Kinder und Wasser zusammenkommen, ist ausgelassenes und fröhliches Treiben meist vorprogrammiert :)";
	} elsif($kat eq "Partyspiele")
	{
		$e->{'einleitung_zusatz'}="Lustige Partyspiele können jede Feier aufheitern - ob es Geburtstage, Jubiläen, Hochzeiten oder einen ähnlichen Feiergrund gibt. Meist werden ein bis zwei Freiwillige aus der Gruppe ausgewählt, die eine Aufgabe meistern müssen - meist zum fröhlichen Vergnügen der anderen Kinder und Erwachsene.";
	}
	#$e->{'einleitung_zusatz'}=encode_utf8($e->{'einleitung_zusatz'});
	return($e);
}

sub spiele_get_alter
{
	my $alter=shift;
	#Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre,Erwachsene
	if($alter eq "Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre,Erwachsene")
	{
		$alter="Kinder von 3 Jahren bis Erwachsene";
	} elsif($alter eq "Von 3 bis 6 Jahre,Von 6 bis 12 Jahre")
	{
		$alter="Kinder von 3 bis 12 Jahren";
	} elsif($alter eq "Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre")
	{
		$alter="Kinder von 3 bis 18 Jahren";
	} elsif($alter eq "Kleinkinder bis 3 Jahre,Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre,Erwachsene")
   {
		$alter="Kinder von 1+ bis Erwachsene";
	} elsif($alter eq "Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre,Erwachsene")
   {
		$alter="Kinder ab 3 Jahre bis bis Erwachsene";
	} elsif($alter eq "Kleinkinder bis 3 Jahre,Von 3 bis 6 Jahre,Von 6 bis 12 Jahre")
   {
		$alter="Kinder von 1+ bis 12 Jahren";
	} elsif($alter eq "Kleinkinder bis 3 Jahre,Von 3 bis 6 Jahre,Von 6 bis 12 Jahre,Von 12 bis 18 Jahre")
	{
		$alter="Kinder von 1+ bis 18 Jahre";
	} elsif($alter eq "Von 6 bis 12 Jahre,Von 12 bis 18 Jahre,Erwachsene")
	{
		$alter="Kinder von 6 Jahren bis Erwachsene";
	} elsif($alter eq "Von 6 bis 12 Jahre,Von 12 bis 18 Jahre")
	{
		$alter="Kinder von 6 bis 18 Jahren";
	} elsif($alter eq "Von 12 bis 18 Jahre,Erwachsene")
	{
		$alter="Jugendliche von 12 Jahren bis Erwachsene";
	}
	return($alter);
}

sub get_rubrik_id
{
	my $rubrik=lc(shift);
	#warn("Suche $rubrik") if !exists($rubriken_ids{$rubrik});
	return($rubriken_ids{$rubrik});	
}

sub spiel_get_rubriken
{
	my $art=shift;
	my @temp;
	if($art=~/draussen/i)
	{
		#§spiele_geschick.png
		push(@temp,"Fangspiele§dr-fangspiele_a02.png§fangspiele","Geschicklichkeitsspiele§dr_geschick_a02.png§geschicklichkeitsspiele","Kreative Spiele§dr-kreativespiele_a02.png§kreative-spiele","Spiele am Wasser§spiele_amwasser.png§wasserspiele","Suchspiele§spiele_suchen.png§suchspiele","Spiele im Wald§§waldspiele");#,"Versteckspiele","Spiele am See","Spiele im Wald","Spiele auf der Wiese","Spiele im Garten");
	} else
	{
		push(@temp,"Geschicklichkeitsspiele§in-geschick_a02.png§geschicklichkeitsspiele","Kreative Spiele§spiele_drinnen_kreativ.png§kreative-spiele","Partyspiele§in-partyspiele_a02.png§partyspiele","Spiele für Kindergeburtstage§in-kindergeburtstag_a02.png§kindergeburtstage","Suchspiele§in-suchspiele_a02.png§suchspiele"); #,"Würfelspiele§in-wuerfelspiele_a02.png§wuerfelspiele");
	}
	return(@temp);
}


sub get_spiel
{
	my($rubrik,$kat,$spiel)=@_;
	$rubrik=~s/draussen/Draußen/;
   my $query;
	if($spiel=~/^\d+/)
	{
		$query="select * from spiele where id=$spiel";
	}
	#warn("Q: $query");

	$query=~s/ f..?r / für /g;
	$query=~s/Draußen/Drau_en/g;

	my $erg=$main::DB->query($query);
	my %eintrag=$erg->fetchhash;

	#my $x=retrieve("/web/virtual/fb24svn/daten/votes.dbf");
	#my $erg=$main::DB->query("select * from sprueche");
	#while(my %eintrag=$erg->fetchhash)
	#{
	#	if($eintrag{'voting_anz'}>0)
	#	{
	#		$x->{'spiele'}->{$eintrag{'id'}}->{'alle'}->{'punkte'}=$eintrag{'voting'};
	#		$x->{'spiele'}->{$eintrag{'id'}}->{'alle'}->{'anz'}=$eintrag{'voting_anz'};
	#		}			
	#}
	#store($x,"/web/virtual/fb24svn/daten/votes.dbf");
	
	if(length($eintrag{'kat'})<3)
	{
		my @temp=split(/,/,$eintrag{'rubrik'});
		$eintrag{'kat'}=shift(@temp);
	}

	#my $dum=&main::socket(&to_json({
	#	'todo'=>'getVotes',
	#	'thema'=>'spiele'
	#}));
	#my $VOTES=&from_json($dum);
	if(exists($STATISCH->{'votes'}->{'spiele'}->{$eintrag{'id'}}->{'alle'}))
	{
		$eintrag{'bewertung'}=$STATISCH->{'votes'}->{'spiele'}->{$eintrag{'id'}}->{'alle'}->{'punkte'}/$STATISCH->{'votes'}->{'spiele'}->{$eintrag{'id'}}->{'alle'}->{'anz'};
		$eintrag{'bew_anz'}=$STATISCH->{'votes'}->{'spiele'}->{$eintrag{'id'}}->{'alle'}->{'anz'};
		#&main::logge_int("W: $eintrag{'bewertung'}");
	} else
	{
		&main::logge_int("Keine Votes für Spiel No. $eintrag{'id'}");
	} 
	
	if(length($eintrag{'sachen'})<4) { $eintrag{'sachen'}="<span class='kommentar'>Nichts</span>";}
	$eintrag{'inhalt'}=~s/(\s+)?\n/\n/g;
	$eintrag{'inhalt'}=~s/\n\n+/\n\n/g;
	$eintrag{'inhalt'}=~s/\n/<br\/>/g;
	$eintrag{'sachen'}=~s/\n/<br\/>/g;
	return(\%eintrag);
}

1;


