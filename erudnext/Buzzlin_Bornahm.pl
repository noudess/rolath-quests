sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Ahoy there, Swabby! This here side of the world sure is beautiful, ain't it?");
		}
	}
