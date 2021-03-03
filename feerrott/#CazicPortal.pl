sub EVENT_SPAWN
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x-15, $x+15, $y-15, $y+15);
	}

sub EVENT_ENTER
	{
	quest::movepc(48, -38.1, 71.4, 1.9, 47);
	}
