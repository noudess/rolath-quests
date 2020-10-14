sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Welcome to our shop!  Are not the Karana's beautiful?");
		}

	plugin::RESIDENT_SAY($text);	
	}

sub EVENT_ITEM 
	{
	plugin::RESIDENT_ITEM();

	plugin::return_items(\%itemcount);
	}
