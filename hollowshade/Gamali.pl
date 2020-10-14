sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("How can I help you, $name?");
		}
	if ($text=~/water/i) 
		{
		quest::say("You are in need of pure water?  I can provide you some, if you can provide me with a [bottle].");
		}
	if ($text=~/bottle/i) 
		{
		quest::say("Let me see your bottle and I will fill it with fresh water from the Moor.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 16598 => 1)) 
		{
		quest::say("Ah yes, I have one already filled.  Take this one.");
		quest::summonitem(31761);
		}
	else 
		{
		quest::say("That is not what I seek.");
		plugin::return_items(\%itemcount);
		}
	}
