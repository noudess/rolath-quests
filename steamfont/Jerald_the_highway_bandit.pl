sub EVENT_SPAWN
	{
	quest::settimer("jerald", 3600);
	}

sub EVENT_SIGNAL
	{
	#:: Signal from steamfont/Cargo_Clockwork.pl
	quest::debug("Jerald won");
	quest::say("I shall eat well tonight!");
	quest::depop();
	}

sub EVENT_TIMER
	{
	quest::debug("Jerald depops");
	quest::stoptimer("jerald");
	quest::depop();
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::debug("Jerald enters Combat");
		quest::setnexthpevent(30);
		}
	else
		{
		quest::debug("Jerald exits Combat");
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::debug("Jerald died.");
	}
