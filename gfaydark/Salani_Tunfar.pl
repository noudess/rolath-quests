sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Can't an elven woman get a drink without some adventurer hitting on her? Really!");
		}
	}
