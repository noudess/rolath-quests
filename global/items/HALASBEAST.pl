my $oldpower=0;
my $newpower=0;

sub EVENT_SCALE_CALC 
	{
    my $full = $client->IsTaskCompleted(65);

	if ($full == 1)
		{
		$newpower = 1;
		}
	elsif (defined $qglobals{"Blessed$charid"}) 
		{
		$p1 = $qglobals{"NB-20690-$charid"} * 20;
		$p2 = $qglobals{"NB-13825-$charid"} * 2;
		$p3 = $qglobals{"NB-13913-$charid"} * 10;
		$p4 = $qglobals{"NB-13813-$charid"} * 10;
		$p5 = $qglobals{"NB-13270-$charid"};
		$p6 = $qglobals{"NB-13875-$charid"} * 10;
		$p7 = $qglobals{"NB-13949-$charid"};
		$p8 = $qglobals{"NB-13298-$charid"};

		$newpower = ($p1 + $p2 + $p3 + $p4 + $p5 + $p6 + $p7 + $p8) / 100;

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
