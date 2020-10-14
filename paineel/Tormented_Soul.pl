sub EVENT_SPAWN
	{
	quest::settimer("alive", 60);
	}

sub EVENT_SAY
	{
	if ($faction >=4)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		quest::faction(265,100);
		}
	else
		{
		if ($text=~/hail/i)
			{
			quest::say("Whaaat foool does seek counsel with this spirit?");
			}
		elsif ($text=~/counsel/i)
			{
			quest::say("Yes, counsel. It means to meet and converse, fool.  Waste my time with definitions of words any dullard would know and taste my anger.");
			}
		}
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0)
		{
		quest::say("Was oonncee... aliiive...");
		}		
	}
