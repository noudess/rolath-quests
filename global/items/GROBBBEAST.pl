my $oldpower=0;
my $newpower=0;

sub EVENT_SCALE_CALC 
	{
    my $full = $client->IsTaskCompleted(103);

	if ($full == 1)
		{
		$newpower = 1;
		}
	elsif (defined $qglobals{"Blessed$charid"}) 
		{
		$p1 = $qglobals{"NB-16532-$charid"};
		$p2 = $qglobals{"NB-13409-$charid"};
		$p3 = $qglobals{"NB-22524-$charid"} * 2;
		$p4 = $qglobals{"NB-13187-$charid"} * .5;
		$p5 = $qglobals{"NB-13186-$charid"};
		$p6 = $qglobals{"NB-211-$charid"} * .25;
		$p7 = $qglobals{"NB-212-$charid"} * 2;

		$newpower = ($p1 + $p2 + $p3 + $p4 + $p5 + $p6 + $p7) / 97;

		}

	if ($newpower > 1)
		{
		$newpower = 1;
		$questitem->ItemSay("Tell Noudess I am a Golden God");
		}

	if ($newpower != $oldpower)
		{
		$questitem->ItemSay("My power has grown to: $newpower");
		}

	$questitem->SetScale($newpower);
	$oldpower = $newpower;
	} 
