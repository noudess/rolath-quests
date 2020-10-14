
sub EVENT_SAY
	{ 
	if ($text=~/Hail/i)
		{
		quest::say("Hello, if you are not a member of the wizard class, then do not waste my time.");
		}

	}


sub EVENT_ITEM
	{ 
	if ($item1=="18739") #A tattered note ID 18739
		{
		quest::say("Welcome to the Academy of Arcane Sciences.  Here's one of our guild robes for you to wear. Once you are ready to begin your training please make sure that you see Shana Liskia, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
			quest::summonitem("13558"); #Patched Violet Robe ID 13558
			#Faction verified on Live
            quest::faction(220,100);  # Arcane Scientists
            quest::faction(281,25); # Knights of Truth
            quest::faction(330,-15); # Freeport Militia
            quest::faction(296,-15); # Opal Dark Briar
            quest::exp(100);
            quest::ding();
		}
	}
#END of FILE Zone:freportw  ID:9073 -- Opal_Darkbriar
