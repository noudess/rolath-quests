
sub EVENT_SAY
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Yes. yes. yes.  Hail to you. too. $name .  Now. quit bugging me!"); }

	}

sub EVENT_ITEM
	{ 
	# A tattered note ID-18855
	if($itemcount{18855} == 1)
		{
		quest::say("Welcome, friend.  I see more than a slight glimmer of hate in your eyes.  Good, for we have much work to do. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem("13565"); #Old Stained Robe
		quest::exp("100");
		quest::ding();
		#factions verified on live
        quest::faction(271,100); # Dismal Rage
        quest::faction(296,20); # Opal Dark Briar
        quest::faction(281,-15); # Knights of Truth
		}

	}

#END of FILE Zone:freporte  ID:10121 -- Heneva_Jexsped


