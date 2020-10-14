sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings my fellow traveler. I am Gornolin Zot, traveling merchant of fine wares. Please. Take a look at what I have to offer.");
		}
	}
