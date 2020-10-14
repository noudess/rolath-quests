sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif ($faction == 5)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($faction <= 4) 
		{
		if ($text=~/hail/i)
			{
			quest::say("Uggg. You needz keyz? Rrrrrrr.");
			}
		elsif ($text=~/key/i)
			{
			quest::say("Uggggg. Take dis keyz.");
			quest::summonitem(6378);
			}
		}
	}

#END of FILE Zone:paineel  ID:2308 -- Guard_Menbuknar
