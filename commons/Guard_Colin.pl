sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hail, traveler! By order of Sir Lucan, the toll fee is one gold piece a head.  Pay at once!");
		}
	}

sub EVENT_ITEM 
	{
	# Just eat coin.
	}
