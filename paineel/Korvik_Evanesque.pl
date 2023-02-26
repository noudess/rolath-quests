sub EVENT_SPAWN
	{
	quest::SetRunning(1);
	$npc->CastSpell(716, $npc->GetID());
	quest::settimer("selos", 12);
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 0)
		{
		quest::emote("mumbles to himself..  lovely decor in here");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 17)
		{
		quest::spawn_condition("paineel", 1, 0);
		quest::spawn_condition("warrens", 1, 1);
		quest::stoptimer("selos");
		}
	}

sub EVENT_TIMER
	{
	$npc->CastSpell(717, $npc->GetID(),-1,1);
	}
