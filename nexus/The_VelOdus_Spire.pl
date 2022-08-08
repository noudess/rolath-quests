sub EVENT_SPAWN
	{
	quest::settimer("portvo", 30);
	}

sub EVENT_TIMER
	{
	if (defined($qglobals{odus_port}))
        {
		$npc->CastSpell(2707, $npc->GetID());
		}
	}
