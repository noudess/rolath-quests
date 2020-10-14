# Starting guildmaster for Erudin Mages
# heretic remains
#

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Greetings, young one! It is always good to see a new face here in the Palace of Erudin, the perfect city-state, free from [crime].");
		}

	if ($text=~/crime/i) 
		{
		quest::say("Oh, yes. We here in Erudin have no crime. Actually, it is a very low crime rate. Most of those crimes are committed by the defective brains of [heretics] or inferior, non-Erudite races.");
		}

	if ($text=~/heretics/i) 
		{
		quest::say("The heretics are our sworn enemies. Their ancient origins are our own, however, they are the mad Erudites who chose the dark side of magic called necromancy. We, the magicians, caught one snooping in the palace just last week. He is now our [prisoner].");
		}

	if ($text=~/heretic has escaped/i) 
		{
		quest::say("Escaped!! This is not good. The sentinels will not find him in time. You must find him. When you find him, release his soul and rid his body of evil any way you can. Bring me proof and all will be well.");
		}

	if ($text=~/prisoner/i) 
		{
		quest::say("The infidel was memorizing our spells to take to the rest of the heretic scum. He will finally be [purged] today. Could you please go to the cells here in the palace and ask Jail Master Lius to give you the heretic's remains?");
		}

	if ($text=~/purged/i) 
		{
		quest::say("To be purged is to take all the evil from ones body and set your soul free. Through magical means, the Erudite Cleansers pull the accused's organs out through the mouth. When all is done, you can be assured the body is cleansed of all evil.");
		}

	if ($text=~/Jail/i) 
		{
		quest::say("The prison is on the lower level of the palace inside the City Office.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18728 => 1)) 
		{
		quest::say("Welcome. young one! I see you show interest in the circle of magic. Nowhere upon Norrath will you find a greater school than this - the Gatecallers. You shall wear this tunic as a sign that you have begun the training of this circle. Remember. the power of the Gatecaller is the power of summoning. Go find Vasile. he will help teach you the basics of summoning. Good luck, friend!");
		quest::summonitem("13548");
		# Faction and XP verified on live
		quest::exp("100");
		quest::ding();
		quest::faction(254,100); #gate callers
		quest::faction(267,15); #high guard of erudin
		quest::faction(266,10); #high council of erudin
		quest::faction(265,-15); #heretics
		} 
	elsif (plugin::check_handin(\%itemcount, 13128=> 1)) 
		{
		quest::say("This is fine work, young one. You keep this up and you shall be knighted before long.");
		quest::exp(2500);
		quest::ding();
		# faction verified on live
		quest::faction(254,50); #gate callers
		quest::faction(267,7); #high guard of erudin
		quest::faction(266,5); #high council of erudin
		quest::faction(265,-7); #heretics
		}
	elsif (plugin::check_handin(\%itemcount, 13127=> 1)) 
		{
		quest::say("This is fine work, young one. You keep this up and you shall be knighted before long.");
		quest::exp(1200);
quest::ding();
		quest::faction(254,25); #gate callers
		quest::faction(267,3); #high guard of erudin
		quest::faction(266,2); #high council of erudin
		quest::faction(265,-3); #heretics
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}

# EOF zone: erudnint ID: 23037 npc: Markus_Jaevins

