sub EVENT_TIMER
	{
	if ($timer eq "eat")
		{
		my @moblist = $entity_list->GetMobList();

		foreach $mobby (@moblist)
			{
			my $npctype = $mobby->GetNPCTypeID();

			if ($npctype == 64083) # aqua_goblin_prisoner
				{
				# get distance from npc

				my $mobX	= int($mobby->GetX());
				my $mobY	= int($mobby->GetY());
				my $mobZ	= int($mobby->GetZ());
				my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

				if ($npc_dist <= 75 and $npc->CheckLoS($mobby))
					{
					$npc->Attack($mobby);
					}
				}
			}		

		}
	}

sub EVENT_SPAWN
	{
	my $freq = int(rand(30))+10;
	quest::say("I live");
	quest::settimer("eat", $freq);
	}
