sub EVENT_SCALE_CALC 
	{
    my $varname="ANTIPOSTAL$charid";
	my $newpower;
	my $oldpower;

	my $taxi = $client->IsTaskCompleted(74) * 6;
	my $heads = 0;

	if ($client->IsTaskCompleted(105))
		{
		$heads = 6;
		}
	elsif ($client->IsTaskActive(105))
		{
		my $headsleft=0;
		for ($i=0; $i<6;$i++)	
			{
			$headsleft = $headsleft + $client->IsTaskActivityActive(105, $i);
			}
		$heads = 6 - $headsleft;
		}

	$oldpower = $qglobals{$varname};
	$newpower = ($taxi + $heads) / 12.0;

	if ($newpower > 1)
		{
		$newpower = 1;
		$questitem->ItemSay("Tell Noudess I am a Golden God");
		}

	if (abs($newpower - $oldpower) > .01)
		{
		$questitem->ItemSay("My power has grown from $oldpower to: $newpower");
    	quest::setglobal($varname,$newpower,5,"F");
		}

	$questitem->SetScale($newpower);
	} 
