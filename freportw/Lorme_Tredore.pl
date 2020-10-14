
sub EVENT_SAY 
	{
    if ($text=~/Hail/i)
		{
		quest::say("Hello $name. Welcome to the Academy.");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13951 => 1)) #Fleshy Orb
		{
		quest::say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
		quest::ding();
		quest::exp(100);
		quest::summonitem(quest::ChooseRandom(5350, 5351, 5352, 5353, 6350, 6351, 6352, 7350, 7351, 7352)); #Fine Steel Weapon
		quest::givecash(0,7,5,0);
		}

	elsif(plugin::check_handin(\%itemcount, 18740 => 1)) #A Tattered Note
		{
		quest::say("Welcome to the Academy of Arcane Sciences.  I am Lorme Tredore, Master Magician.  Here is our guild robe, wear it with pride and represent us well, young Fresant.  Once you are ready to begin your training please make sure that you see Shana Liskia, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::exp(100);
		quest::ding();
		quest::summonitem(13559); #Used Violet Robe
        #factions verified on Live
        quest::faction(220,100);  # Arcane Scientists
        quest::faction(281,25); # Knights of Truth
        quest::faction(330,-15); # Freeport Militia
        quest::faction(296,-15); # Opal Dark Briar
		}
	else 
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	}
# END of FILE Zone:freportw  ID:9078 -- Lorme_Tredore
