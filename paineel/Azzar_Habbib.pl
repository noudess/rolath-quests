sub EVENT_SAY {

if($text=~/Hail/i)
{quest::say("I'm not in any mood for conversation. My favorite hat was torn right from my head by a gigantic bat the other night and I am quite upset.");
}


if($text=~/what other tasks?/i)
{quest::say("I will sew you your own personal dreadful cap if you bring me the necessary components. I will need the pelt of a feared beast, some gold thread, and an imbued amber.");
}

if($text=~/what hat/i)
{quest::say("It is a marvelous cap sewn from the finest textiles and imbued with the divine power of our lord of fear. Cazic Thule!");
}
               }


sub EVENT_ITEM 
	{
	if($itemcount{1528} == 1)
		{
		if ($faction <= 4)
			{
			quest::emote("gasps in astonishment");
			quest::say("You...you..found my hat!! This is the most I can repay you but perhaps I can reward you further for some [other tasks]?");
			quest::summonitem("1530");#black lace sash
			#Faction verified on Live
			quest::faction(265,"5");
			quest::faction(231,"-5");
			quest::faction(233,"-5");
			quest::faction(242,"-5");
			quest::faction(254,"-5");
			quest::exp(1000);
			quest::ding();
			}
		else
			{
			quest::summonitem("1528");#His cap back
			quest::say("What? This is not my hat! I don't want this rubbish!");
			}
		}
	elsif($faction <= 4 && plugin::check_handin(\%itemcount, 19076 => 1,12096 => 1, 22502 => 1))
		{#Mighty Bear Paw's Belt Gold Thread and Imbued Amber
		quest::say("Here is your dreadful cap as I have promised.");
		quest::summonitem(1529);#Dreadful Cap       
		#Faction verified on Live
		quest::faction(265,"5");
		quest::faction(231,"-5");
		quest::faction(233,"-5");
		quest::faction(242,"-5");
		quest::faction(254,"-5");
		quest::exp(1000);
		quest::ding();
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:paineel  ID:75009 -- Azzar_Habbib 
