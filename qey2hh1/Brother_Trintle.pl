sub EVENT_SAY
	{
	if($text=~/hail/i)
		{
		quest::say("Greetings.  May [Rodcet Nife] keep you healthy and watch over you in times of disease.");
		}	
	elsif ($text=~/Rodcet Nife/)
		{
		quest::say("Rodcet Nife is the healer and bringer of all life. Go to the Temple of Life in Qeynos and learn his ways.");
		}
	}

sub EVENT_COMBAT
	{
	quest::say("For Bertoxxulous, I shall spill your guts upon the floor!");
	}
