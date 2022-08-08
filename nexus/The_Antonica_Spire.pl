sub EVENT_SPAWN
	{
	quest::settimer("porta",30);
	}

sub EVENT_TIMER
	{
	if (defined($qglobals{antonica_port}))
        {
		$npc->CastSpell(2708, $npc->GetID());
		}
	}
