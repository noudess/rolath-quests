sub EVENT_SIGNAL
	{
	quest::say("Coming SIR!");
	quest::SetRunning(1);
	quest::attack($qglobals{"tactician_agro"});
	}
