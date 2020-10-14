sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		my $cur_target = $npc->GetHateTop();
		if($cur_target) 
			{
			my $target_name = $cur_target->GetCleanName();
			quest::say("How dare you interrupt my fishing $target_name!");
			}
		}
	}

