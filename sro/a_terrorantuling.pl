sub EVENT_SPAWN
	{
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	$npc->AI_SetRoambox(200, $x-400, $x+400, $y + 400, $y - 400, 10000);
	}
