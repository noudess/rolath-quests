sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to my humble establishment!  I specialize in cloth, but lately I have begun to dabble in silk, the finest material I have ever used."); 
		}
	  if($text=~/donate to the temple of thunder/i) 
		{
	    quest::say("Go Away!");
	  	}
	}
