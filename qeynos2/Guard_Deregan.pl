sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
    	quest::say("Hail, $name.  I am Deregan.  I used to be an adventurer much like yourself.  Of course I was not as frail and childlike as you appear to be.");
  		}
	}
