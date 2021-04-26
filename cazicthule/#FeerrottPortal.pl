sub EVENT_SPAWN
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x-20, $x+20, $y-20, $y+20);
	}

sub EVENT_ENTER
	{
	$z = $client->GetZ();
	if ($z > -5)
		{
		$client->MovePC(47, -90, -1488, 51, 380);
		}
	}
