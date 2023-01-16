sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings! I hope the walk out to the windmills was not too dangerous. You must be careful not to be snatched up by the slavers around these parts.");
		}
	}

