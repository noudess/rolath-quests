sub EVENT_SPAWN 
	{
	quest::SetRunning(1);
	}

sub EVENT_SAY
    {
    if($text=~/hail/i)
        {
        quest::say("Hail. I am in a bit of a hurry. Please excuse me.");
        }
	}

sub EVENT_WAYPOINT_ARRIVE
    {
    if($wp eq 18)
        {
        quest::say("I would like to leave mail for room #2, please.");
        quest::signalwith(9103, 2, 3);
        }
    }

