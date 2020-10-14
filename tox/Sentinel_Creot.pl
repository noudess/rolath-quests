sub EVENT_WAYPOINT_ARRIVE
	{
	if(($wp==1) || ($wp==3))
		{
		quest::say("Hail citizens.  Sentinel Creot of the High Guard is on watch.");
		}
	if($wp==1)
		{
		quest::SetRunning(1);
		}
	if($wp==2)
		{
		quest::SetRunning(0);
		}
	}

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hail. $name! Be careful out in Toxxulia Forest! There are many venomous creatures out here. If things get too scary for you. run back to us and we shall take care of the threat."); 
		}
	}
