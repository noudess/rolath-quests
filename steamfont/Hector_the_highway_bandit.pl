sub EVENT_SPAWN
	{
	quest::settimer("hector", 3600);
	}

sub EVENT_SIGNAL
	{
	#:: Signal from steamfont/Cargo_Clockwork.pl
	quest::debug("Hector won");
	quest::say("Victory is mine!");
	quest::depop();
	}

sub EVENT_TIMER
	{
	quest::debug("Hector depops");
	quest::stoptimer("hector");
	quest::depop();
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::debug("Hector enters Combat");
		quest::setnexthpevent(30);
		}
	else
		{
		quest::debug("Hector exits Combat");
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::debug("Hector died.");
	}
