sub EVENT_SCALE_CALC 
	{
    my $varname="POSTAL$charid";
	my $newpower;
	my $oldpower;

	my $badge = $client->IsTaskCompleted(66);
	my $mail = $client->IsTaskCompleted(87);

	$oldpower = $qglobals{$varname};
	$newpower = ($badge + $mail) / 2.0;

	if ($newpower > 1)
		{
		$newpower = 1;
		$questitem->ItemSay("Tell Noudess I am a Golden God");
		}

	if (defined $oldpower && $newpower != $oldpower)
		{
		$questitem->ItemSay("My power has grown to: $newpower");
    	quest::setglobal($varname,$newpower,5,"F");
		}

	$questitem->SetScale($newpower);
	} 
