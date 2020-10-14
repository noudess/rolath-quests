sub EVENT_SAY
	{
	if($class eq "Shadowknight" && !quest::istaskactive(107))
		{
		quest::say("$name, I've seen you around with your pet.  Embarrassing.");
		quest::assigntask(107);
		}
	}

sub EVENT_ITEM
	{
	quest::say("I am always glad to accept donations!");
	}
