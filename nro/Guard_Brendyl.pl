sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		my $cur_target = $npc->GetHateTop();
		if ($cur_target)
			{
			my $random = int(rand(3));
			my $target_name = $cur_target->GetCleanName();

			if ($random == 0)
				{
				quest::say("Time to die $target_name!");
				}
			if ($random == 1)
				{
				quest::say("You are not welcome in Freeport $target_name!");
				}
			if ($random == 2)
				{
				quest::emote("smacks the flat of his blade against the palm of his hand.");
				quest::say("You want a taste of this, $target_name!");
				}
			}
		}
	}

