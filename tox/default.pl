sub EVENT_SPAWN
	{
	my $sg = $npc->GetSp2();
	
	# If in 313 (a group used all over in BB) and no grid.. add wander
	# Have to do later as grid wont be assigned yet

	if ($sg == 5964 || $sg == 4936)
		{
		quest::settimer("wander", 10);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "wander")
		{
		quest::stoptimer("wander");
		my $grid = $npc->GetGrid();
		if ($grid == 0)
			{
			$npc->AI_SetRoambox(400, $npc->GetX() + 200, $npc->GetX() - 200, $npc->GetY()+200, $npc->GetY()-200);
			}
		}
	}
