sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hail, fellow adventurer. Are you from Qeynos?");
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18801 =>1 )) 
		{
		quest::say("My sister is in danger. She is all the family I have left. I shall be on my way soon. Please take her my handkerchief, so she knows you have contacted me. Thank you. I am thankful Nerissa ran into you. I just wonder why she did not tell Kane about her suspicions.");
		quest::summonitem(13302);
		quest::faction(311,10); # Steel Warriors
		quest::faction(262,2); # GoQ
		quest::faction(230,-1); # CGQ
		quest::faction(330,-1); #Freeport Militia
		quest::faction(281,2); #KoT
		quest::exp(2000);
		quest::ding();
		quest::spawn2(15193,135,0,-5521,-1870,3,452);
		}
	if (plugin::check_handin(\%itemcount, 18934 =>1 ))
		{# 18934 'sealed letter', filename='LoveToMilea'
		quest::say("Oh great!! I thought I'd saw that last of Plagus, or as all the women in the Steel Warriors called him, the Plague. Please do not tell him where I am. It must have been a long journey for you. Here. A little something for your wasted trip. I found it on the ground. Have fun going back to Freeport.");
		quest::summonitem(quest::ChooseRandom(3040,5231,1037,17005,13003,10008,1005,8791,1336,2910));
		# Verified on Live
		quest::faction(311,5);
		quest::faction(281,1);
		quest::faction(262,1);
		quest::faction(330,-1);
		quest::faction(230,-1);
		quest::exp(200);
		quest::ding();
		}
	plugin::return_items(\%itemcount);
	}

sub EVENT_SIGNAL 
	{
	if ($signal == 1) 
		{ #from Guard Ellis
		quest::say("Get out of here! It is time I dealt with this traitorous guard. Okay guard, let's get it on!!");
		quest::signalwith(15193,1,5);  #to Guard Elias
		}
	}

#END of FILE Zone:eastkarana  ID:15055 -- Milea_Clothspinner 
