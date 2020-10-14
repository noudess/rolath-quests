sub EVENT_SPAWN
	{
	quest::say("What is it now! I can't stand around here all day.  I've got mice to chase!  Get on with your business quickly.");
	quest::settimer(2,600);
	}

sub EVENT_TIMER
	{
	quest::say("I have to run.  See you at the cheese wheel!");
	quest::depop();
	}
