sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hello. Nice to make your acquaintance. Be careful in the plains. There are many creatures. Just stay close to the guard towers.");
		}

	plugin::RESIDENT_SAY($text);
	}

sub EVENT_ITEM 
	{
	plugin::RESIDENT_ITEM();

	plugin::return_items(\%itemcount);
	}
