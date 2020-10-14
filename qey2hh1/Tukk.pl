sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Grand to meet you! I hope you have come to help out around here. Nah!! You don't have the look of a farmer.");
		}

	plugin::RESIDENT_SAY($text);	
	}

sub EVENT_ITEM 
	{
	plugin::RESIDENT_ITEM();

	plugin::return_items(\%itemcount);
	}
