#a_grimling_gruntling

sub EVENT_COMBAT 
	{
	if ($combat_state == 1)
		{
		quest::say("This won't take long!");
		}
	}

sub EVENT_DEATH 
	{
	quest::signalwith(167663,1,0);
	} 
