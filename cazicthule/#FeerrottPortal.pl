sub EVENT_SPAWN
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x-15, $x+15, $y-15, $y+15);
	}

sub EVENT_ENTER
	{
	$client->MovePC(47, -90, -1488, 51, 380);
	}
