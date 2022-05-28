my $near=0;

sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		# See if Emperor Crush is nearby.
		my $mob_check = $entity_list->GetMobByNpcTypeID(58032);
		if (defined($mob_check))
			{
			my $mobX = int($mob_check->GetX());
			my $mobY = int($mob_check->GetY());
			my $mobZ = int($mob_check->GetZ());

			# get distance from npc
			my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

			#Checking if within range of Emperor Crush to worship.
			if ($npc_dist <= 100) 
				{
				$near=1;
				}
			else
				{
				$near=0;
				}
			}

		if ($near==1)
			{
			quest::say("Hail, Emperor Crush!!");
			}
		else
			{
			$rand = rand();
			if ($rand < .5)
				{
				quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
				}
			elsif ($rand >= .5)
				{ 
				quest::say("Fall before the might of Clan Crushbone!!");
				}
			}
		}
	}
