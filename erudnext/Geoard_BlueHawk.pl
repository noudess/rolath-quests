sub EVENT_SAY 
	{ 
	if ($text=~/Hail/i)
		{
		quest::say("Greetings. adventurer! After all those months of sweaty. hot and dirty battling of beasts untold. it is time to treat yourself to a tall. cool grog!"); 
		}

	if ($text=~/Erud's Tonic/i)
		{
		quest::say("Long ago, the great Erud found that excessive indulgence in spirits led to diminished mental awareness. His love of Kaladim brandy led him to concoct Erud's Tonic. The tonic blocked the effects of all spirits. Unfortunately, this [brew] is made from our precious Vasty Deep water and therefore is not permitted to be exported or given to non-Erudites or adventuring Erudites."); 
		}

	if ($text=~/brew/i)
		{
		quest::say("The sale or provision of Erud's Tonic to travelers is prohibited!"); 
		quest::settimer("nextguycanspeak", 2);
		quest::updatetaskactivity(25,4,1);
		}
	
	if ($text=~/Vasty Deep Water/i)
		{
		quest::say("The Vasty Deep is a lake located on Odus. It contains the purest water in Norrath. Some say it is magical in nature. The High Council does not allow it to be taken by outsiders and those who try are usually converted to chum for the sharks.  It is also an ingredient in a drink called [Erud's Tonic]"); 
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("nextguycanspeak");
	quest::signalwith(24039,50);
	}
#END of FILE Zone:erudnext  ID:98066 -- Geoard_Bluehawk 
