sub EVENT_SPAWN
	{
	# Check and see if we're gridless once grids are assigned
	quest::settimer("wander", 10);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("wander");
	my $grid = $npc->GetGrid();
	if ($grid == 0)
		{
  		$npc->AI_SetRoambox(400, $npc->GetX() + 200, $npc->GetX() - 200, $npc->GetY()+200, $npc->GetY()-200);
		}
	}
