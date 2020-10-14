sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Mlech!  You am NOT [Deeppocketsss].  Go aways and don't talk to Gunrich or I am hafta kill you.");
		}
	elsif($text=~/dark rivers flow east/i) 
		{
		if($faction <= 4) 
			{
			quest::say("Heh!  Here, here, here.  Tell Rueppy hellos from Gunrich.  She am so perties.  Heh, heh.");
			quest::summonitem(13131); #Case of Blackburrow Stout
			}
		else
			{
			plugin::reject_say();
			}
		}
	else 
		{
		quest::attack($name);
		}
	}

sub EVENT_ITEM 
	{
	quest::say("Mlech!  You am NOT [Deeppocketsss].  Go aways and don't talk to Gunrich or I am hafta kill you.");
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:misty  ID:33135 -- Gunrich
