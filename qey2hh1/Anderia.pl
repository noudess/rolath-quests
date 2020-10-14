sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hello friend. Welcome to the plains of Karana. Be careful as you travel about the plains, there are many unfriendly creatures. Try stay close to the guard towers and be wary as you travel farther from the safety of Qeynos.");
		}

	plugin::RESIDENT_SAY($text);
	}

sub EVENT_ITEM 
	{
	plugin::RESIDENT_ITEM();

	plugin::return_items(\%itemcount);
	}
