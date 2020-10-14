sub EVENT_TARGET_CHANGE 
	{
	my $targ = $client->GetTarget();
	if (defined $targ && ($targ->GetCleanName() eq "Lady Vox") && ($ulevel > 52) && ($status < 80)) 
		{
		quest::ze(0,"I will not fight you, but I will banish you!");
		$client->MovePC(30,-7024,2020,-60.7,0);
		}
	}

sub EVENT_LOOT
    {
	my $thetask=0;

    if ($looted_id == 72371 || $looted_id == 50808)
        {
		if ($class eq "Necromancer")
			{
			$thetask=104;
			}
		elsif ($class eq "Shadowknight")
			{
			$thetask=107;
			}
        if($thetask > 0 && !quest::istaskactive($thetask))
            {
            $client->Message(15, "This item is very cold to the touch.");
            quest::assigntask($thetask);
            }
        }
    }
