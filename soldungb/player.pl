sub EVENT_TARGET_CHANGE 
	{
	my $targ = $client->GetTarget();
	if (defined $targ && ($targ->GetCleanName() eq "Lord Nagafen") && ($ulevel > 52) && ($status < 80)) 
		{
		quest::ze(0,"I will not fight you, but I will banish you!");
		$client->MovePC(27,-64,262,-93.96,0);
		}
	}
