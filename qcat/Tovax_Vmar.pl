sub EVENT_SPAWN
	{
	$npc->SetNPCFactionID(0);
	}

sub EVENT_SIGNAL
	{
	quest::say("Huh? What the... oh, no... S'ragg! PLEASE NO! Bertoxxulous save me!");
	quest::signal(45091,2000);
	}
