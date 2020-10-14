
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Greetings!  I am the mighty Konious Eranon, Master Enchanter, devoted follower of Innoruuk, and loyal assistant to the all-powerful Nexvok.");
		}
	}

sub EVENT_ITEM
	{
	# A tattered Note ID-18856
	if($itemcount{18856} == 1)
		{
		quest::say("Hey, Nex, we got another sucker...  Er...  Volunteer, that is, to help us out around here.  Here ya go friend, put this on and let's whip you into shape. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::exp("100");
		quest::ding();
		quest::summonitem("13566"); #Blood Spotted Robe
		#Factions verified on live
        quest::faction(271,100); # Dismal Rage
        quest::faction(296,20); # Opal Dark Briar
        quest::faction(281,-15); # Knights of Truth
		}
	}

