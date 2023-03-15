my $athome = 1;

sub EVENT_COMBAT 
	{
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) 
		{
		quest::say("That's it swine! You're outta here!");
		}
	}

sub EVENT_SAY 
	{
	if ($athome == 1 && $text=~/hail/i) 
		{
		quest::say("What do you want?! Can't you see I am busy drinking here? You don't even look like you belong here. You can have my seat when I am good and ready to leave, which won't be for a while yet. If I were you, I would get lost before I got myself hurt.");
		}
	elsif ($athome == 0 && $text=~/hail/i) 
		{
		quest::say("Get lost bum, before I lose my temper.  Can't you see I'm busy....!");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 0)
		{
		$athome=1;
		}
	else
		{
		$athome=0;
		}
	}

sub EVENT_ITEM 
	{
	#:: Return unused items
	plugin::returnUnusedItems();
	} 
