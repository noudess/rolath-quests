sub EVENT_SPAWN
	{
	quest::settimer("renaldo", 3600);
	}

sub EVENT_SIGNAL
	{
	#:: Signal from steamfont/Cargo_Clockwork.pl
	quest::debug("renaldo won!");
	quest::say("Your servos belong to me!");
	quest::depop();
	}

sub EVENT_TIMER
	{
	quest::debug("renaldo depops");
	quest::stoptimer("renaldo");
	quest::depop();
	} 

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::debug("Renaldo enters Combat");
		quest::setnexthpevent(30);
		}
	else
		{
		quest::debug("Renaldo exits Combat");
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::debug("Renaldo died.");
	}
