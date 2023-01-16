sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("I find your sanity sickening and the madness of Meldrath cannot tolerate you much longer.");
		}
	}

