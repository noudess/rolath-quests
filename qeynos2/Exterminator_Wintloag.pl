sub EVENT_SAY 
	{
	if($text=~/Hail/i) #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
		{
		quest::say("I really can't believe it, $name. I have seen Qeynos in bad shape but this is unbelievable! The rodents have practically taken over our city. If you see some of them running around, keep the rat whiskers, and I will reward you for every four you bring me.");
		}
	}

sub EVENT_ITEM 
	{
	#Handin: 4x Rat Whiskers
	# Required Faction Verified
	if($faction <=6 && plugin::check_handin(\%itemcount, 13071 => 4))
		{
		quest::say("Here is something for you, $name. I certainly appreciate your help with our pest problem here. Great work.");
		# Factions verified on live
		quest::faction(219,1); # +Antonius Bayle
		quest::faction(262,1); # +Guards of Qeynos
		quest::faction(291,1); # +Merchants of Qeynos
		quest::faction(223,-1); # -Circle of Unseen Hands
		quest::faction(230,-1); # -Corrupt Qeynos Guards
		quest::exp(145);
		quest::ding();
		quest::givecash(1,1,1,0);
		}

	plugin::return_items(\%itemcount);	
	}
