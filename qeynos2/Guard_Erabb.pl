sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
    	quest::say("Hello, $name.  Shh...  Come here.  I am worried.  I am new to this job but already I get the feeling something is wrong.  I have seen one of the lieutenants talking to a suspected necromancer.  It appeared they were old friends.  Something dark is growing in Qeynos.  Be careful!");
  		}
	}
