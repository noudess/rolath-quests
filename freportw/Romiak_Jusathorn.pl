
sub EVENT_SAY
	{ 

	if ($text=~/Hail/i)
		{
		quest::say("Hello $name, welcome to the Academy!");
		}

	}

sub EVENT_ITEM
	{ 
	# A tattered note ID-18741
	if ($itemcount{18741} == 1)
		{
		quest::say("Greetings, I am Romiak Jusathorn, Master Enchanter of the Academy.  Take this...  it's our guild robe; it will help protect you in this harsh enviroment. Once you are ready to begin your training please make sure that you see Shana Liskia, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		# Old Violet Robe ID-13560
		quest::summonitem("13560");
		quest::exp("100");
		quest::ding();
        #factions verified on Live
        quest::faction(220,100);  # Arcane Scientists
        quest::faction(281,25); # Knights of Truth
        quest::faction(330,-15); # Freeport Militia
        quest::faction(296,-15); # Opal Dark Briar
		}

	}
#END of FILE Zone:freportw  ID:9069 -- Romiak_Jusathorn
