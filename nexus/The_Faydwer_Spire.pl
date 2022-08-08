sub EVENT_SPAWN
	{
	quest::settimer("portf", 30);
	}

sub EVENT_TIMER
	{
	if (defined($qglobals{faydwer_port}))
        {
		$npc->CastSpell(2706, $npc->GetID());
		}
	}
