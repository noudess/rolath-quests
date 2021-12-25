sub EVENT_SPAWN
	{
	my $sg = $npc->GetSp2();
	
	# If in 345 (a group used all over) and no grid.. add wander
	# Have to do later as grid wont be assigned yet

	if ($sg == 345 || $sg == 1489)
		{
		quest::settimer("wander", 10);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("wander");
	my $grid = $npc->GetGrid();
	if ($grid == 0)
		{
  		$npc->AI_SetRoambox(600, $npc->GetX() + 300, $npc->GetX() - 300, $npc->GetY()+300, $npc->GetY()-300);
		}
	}
