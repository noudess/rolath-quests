sub EVENT_DEATH_COMPLETE
	{
	quest::signalwith(100221, 1); # Notify Ridossan the Unliving of his death.
	quest::unique_spawn(100222, 0, 0, $x, $y, $z, $h);    #Ghost_of_Ridossan
	}
