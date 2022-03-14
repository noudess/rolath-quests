sub EVENT_SPAWN 
	{
	quest::settimer("wander",10);
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::spawn_condition("rathemtn", 2, 0);
	quest::spawn_condition("rathemtn", 3, 0);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("wander");
	$npc->AI_SetRoambox(600, $npc->GetX() + 400, $npc->GetX() - 400, $npc->GetY()+300, $npc->GetY()-300);
	}
