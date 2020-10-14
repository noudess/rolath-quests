sub EVENT_SIGNAL
	{
	quest::say("Word from my home?", 27);
	quest::settimer("delay", 1);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("delay");
	quest::signal(101108);
	}
