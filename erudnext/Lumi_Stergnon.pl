sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Peace and tranquility be with you. $name.  Are you a [new acolyte of peace] or are you [here to pay homage] to the child of tranquility?");
		}
	elsif($text=~/new acolyte of peace/i)
		{
		quest::say("Then you shall learn the ways of Quellious and learn to do as you are told by higher ranking members. It is time for you to do the lesser duties of a young priest. Which will it be? [Retrieve the Peacekeeper staves] or [battle the undead]?")
		}
	elsif($text=~/here to pay homage/i)
		{
		quest::say("Then respect our temple and keep your prayers silent.");
		}
	# Faction issueValidated on P1999 and live
	elsif($faction <= 4) 
		{
		if ($text=~/I will retrieve the Peacekeeper staves/i)
			{
			quest::say("Then take this note to the woodworker in Toxxulia Forest. His name is Emil Parsini. He shall have the staff to be returned to the temple.");
			quest::summonitem(18833); #A Sealed Letter for Emil Parsini
			}
		elsif($text=~/I will battle the undead/i)
			{
			quest::say("Then you shall venture to Toxxulia Forest. There has been an increase in skeleton sightings lately. I do not know their origin, but I believe that your efforts will reduce their numbers! Take this box. Return it to me when you have filled it with the bones of these undead creatures and combined it. May Quellious' light guide you.");
			quest::summonitem(17941);#Box for Bones
			}
		elsif($text=~/important missions/i)
			{
			quest::say("We have need of skilled priests. We have learned that a High Guard battle staff has been stolen. We require a priest to [track down the staff].")
			}
		}
	else 
		{
		quest::say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
		}
	}

sub EVENT_ITEM 
	{   
	if(plugin::check_handin(\%itemcount, 13882 => 1))
		{#A Box of Bones
		quest::say("This is fabulous work, my friend! You have served your people well. Take this as a gift. I hope it can be of use to you. We need proof of these skeletons' origins. Continue the eradication of the undead and find out who creates them. Once you know, bring their head to me.");
		# faction verified on zam
		quest::faction(298, 10); #Peace Keepers 
		quest::faction(266, 2); #High Council of Erudin      
		quest::faction(265,-2); #Heretics
		quest::exp(200);      
		quest::ding();
		quest::givecash(0,12,3,0);#12 silver 3 gold per Allakhazam
		quest::summonitem(CHOOSE_REWARD());
		}
	elsif(plugin::check_handin(\%itemcount, 13816 => 1))
		{#The completed Peacekeeper Staff
		quest::say("You have done well, neophyte.Let me add the touch of harmony to finish the job.. Here, then. Take these supplies. I am sure you'll need them. Soon you may be able to assist us in [important missions].");
		# Faction verified on live
		quest::faction(298, 10); #Peace Keepers 
		quest::faction(266, 2); #High Council of Erudin      
		quest::faction(265,-2); #Heretics      
		quest::exp(750);      
quest::ding();
		quest::givecash(12,11,0,0);
		quest::summonitem(CHOOSE_REWARD());
		}
	else 
		{     
		quest::say("You're contribution is interesting in your choice of it, but you may have it back.");#text made up     
		plugin::return_items(\%itemcount);   
		}
	}

sub CHOOSE_REWARD
	{
	# Lumi rewards with something from one of these lists based on liklihood
	# 
	# Packs (5 items)
	# Rawhide (12 items)
	# Junk Gems (11 items)
	# Blunt Rusty Weapon (8 items)
	# Level 1 cleric spell (11 items)
	#
	# So we add that all up, roll a random #, find the category and summon...
	# 47 items, so roll to get category based on that.

	my $category=plugin::RandomRange(1, 47);	
	my $reward;

	if ($category <= 5)
		{
		$reward=$category+17001; #17002-17006 are packs
		}
	elsif ($category <= 17)
		{
		$reward=$category+2136-5; #2137-2148 are pieces of rawhide
		}
	elsif ($category <= 28)
		{
		$reward=$category+10000-17; #10001-10011 are gems and jewels
		}
	elsif ($category <= 36)
		{
		$reward=$category+6010-28; #6011-6018 are low end blunt weapons
		}
	elsif ($category <= 47)
		{
        $reward=quest::ChooseRandom(15011, 15014, 15200, 15201, 15202, 15203, 15205, 15207, 15208, 15209, 15210, 15215, 15216, 15211, 15212);
		}
return $reward;
}

#END of FILE Zone:erudnext  ID:98045 -- Lumi_Stergnon 
