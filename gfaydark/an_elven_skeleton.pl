sub EVENT_SPAWN
	{
	quest::settimer("check_prox", 5);
	}

sub EVENT_TIMER
	{
	my $mob_check;
	my $mobX;
	my $mobY;
	my $mobZ;
	my $npc_dist;

	if ($timer eq "check_prox")
		{
		my @n_list = $entity_list->GetNPCList();
		foreach my $n (@n_list)
			{
			# Other mobs attack.  Saw some level evidence
			# Also saw only giant_wasp worker, large_widow, widow_matriarch
			# and orc centurian.  Need more data to know if its all level based
			# or specific mobs only.
			#
			# For now, all levels above 3 that isn't us..
			if ($n->GetLevel() > 3 && $n->GetNPCTypeID() != 54055)
				{
				$mobX = int($n->GetX());
				$mobY = int($n->GetY());
				$mobZ = int($n->GetZ());

				# get distance from npc
				$npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

				if ($npc_dist <= 50)
					{
					$npc->Attack($n);
					}
				}
			}
		}
	}
