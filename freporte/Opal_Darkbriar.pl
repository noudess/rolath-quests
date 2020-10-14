
sub EVENT_SAY 
	{
	if ($text=~/Hail/i) 
		{
		quest::say("Greetings! You will have to excuse me. I have no time to talk right now and I prefer to be left alone. Please leave.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18739 => 1)) #A tattered note
		{
		quest::say("Welcome to the Guild, here's your guild robe. Now, let's get to work. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I have many things yet to teach you.");
		quest::summonitem(13562); #Dark Stained Robe
		quest::exp(100);
		quest::ding();
		#Factions verified on live
        quest::faction(296,100); # Opal Dark Briar
        quest::faction(271,25); # Dismal Rage
        quest::faction(239,25); # The Dead
		quest::faction(238,25); # Dark Reflection
		quest::faction(221,25); # Bloodsabers
		}
	}
#END of FILE Zone:freporte  ID:9073 -- Opal_Darkbriar
