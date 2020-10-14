#Guard_Weleth.pl
#The Crate (evil) and The Crate (good)

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 8) {
    quest::say("Argh. Not again. This whole blasted [crate] needs to be returned!");
  }
}

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Hail, $name. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse [stocked with supplies]. I must get back to my duties. Farewell.");
	}
	
	if($text=~/stocked with supplies/i)   {
		quest::say("I must keep the guardhouses here stocked with arrows, rations and water.  That reminds me...  I still have to [return that blasted crate].");
	}
	
	if($text=~/crate/i)   {
		quest::say("Oh, we just received a shipment of arrows from [Nesiff] in South Qeynos. The [arrows] in this box are missing their fletchings and I can't leave my patrol to take them back.");
	}
	
	if($text=~/Nesiff/i)   {
		quest::say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
	}

	if ($text=~/Lieutenant Dagarok/i)
		{
		quest::say("Lieutenant Dagarok is the officer in charge of all of North Qeynos.  He is difficult to get along with and I do not [trust him].");
		}
	
	if($text=~/arrows/i)   
		{
		if ( $faction <= 5)
			{
			quest::say("Oh, thank you! Here is the crate. Make sure [Nesiff] sends me back a new invoice. [Lieutenant Dagarok] would have my head if he found out this happened again!");
			quest::summonitem(13925);#Crate of Defective Arrows
			}
		else
			{
			quest::say("While I do realize that you are a loyal citizen, I can not help you with that... yet.");
			}
		}

	if($text=~/trust/i)   
		{
		if ( $faction <=3 ) # took a guess here - I know ally works on live
			{
			quest::say("Late one night not long ago, after I was off duty, I witnessed Lieutenant Dagarok and a few others slay someone they claimed was a suspected necromancer.  I had met their victim the day before and I know he was an innocent paladin from Freeport.  What really shocked me was that Dagarok was bathed in an evil green glow as their victim crumpled to the ground.  I don't know who to trust any more!");
			}
		else
			{
			quest::say("I don't feel comfortable talking to you about that.");
			}
		}
	}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18824 => 1)) { #Slip of Parchment
		quest::say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted - Lieutenant Dagarok, for one.");
		# Factions and XP Verified on Live
		quest::faction(262, 25);#Guards of Qeynos
		quest::faction(219, 3);#Antonius Bayle
		quest::faction(223, -6);#Circle Of Unseen Hands
		quest::faction(230, -3);#Corrupt Qeynos Guards
		quest::faction(291, 2);#Merchants of Qeynos
		quest::exp(231);
		quest::ding();
		my $cp = int(rand(8));
		quest::givecash($cp, 0, 0, 0);
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos2 ID: 2079 -- Guard_Weleth.pl
