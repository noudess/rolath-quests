sub EVENT_SPAWN
	{
	$texture = quest::ChooseRandom(2,2,2,2,3);	
	$npc->SetTexture($texture);
	}
