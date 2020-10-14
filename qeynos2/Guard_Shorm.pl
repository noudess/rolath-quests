sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
    	quest::say("What do you want with bothering Shorm?  I have no time for the likes of you, $name!  Clear my path or meet my blade!");
  		}
	}
