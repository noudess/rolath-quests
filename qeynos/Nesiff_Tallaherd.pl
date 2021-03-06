#Nesiff_Tallaherd.pl
#The Crate (evil) and The Crate (good) and Nesiff's Statue

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Greetings, $name! Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service. I am the finest woodworker in all of Qeynos. Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].");
	}
	
	if($text=~/Guard Weleth/i)   {
		quest::say("Guard Weleth is like a son to me. He is responsible for purchasing supplies for the Qeynos Guard. He buys arrows from me. He is usually stationed near the North Gate.");
	}
if ($text=~/tax/i) {
  quest::say("Tax time again already?? It seems like I just paid yesterday.. High taxes and low sales mean I won't be able to stay in business much longer. Good thing ol' Weleth is taking care of me. Here are my taxes.");
  quest::faction(291, -1);
  quest::summonitem(13173);
}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 13925 => 1)) {#Crate of Defective Arrows
		quest::say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
		# faction and XP verified on live
		quest::faction(291, 5);#Merchants of Qeynos
		quest::faction(223, -1);#Circle Of Unseen Hands
		quest::faction(219, 1);#Antonius Bayle
		quest::faction(229, 1);#Coalition of Tradefolk
		quest::faction(262, 1);#Guards of Qeynos
		quest::exp(231);
		quest::ding();
		quest::summonitem(18824);#Slip of Parchment
	}
	
	if (plugin::check_handin(\%itemcount, 18012 => 1)) {
		quest::say("Oh.  Vesteri sent you?  Here you go.  I hope Te'Anara likes it.");
		quest::summonitem(13864);
		quest::exp(250);
		quest::ding();
		# factions verified on ZAM
		quest::faction(291,1); #merchants of qeynos
		quest::faction(223,-1); #circle of unseen hands
		quest::faction(219,1); #antonius bayle
		quest::faction(229,1); #coalition of tradefolk
		quest::faction(262,1); #guards of qeynos
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}
#End of File zone:qeynos ID: 1098 -- Nesiff_Tallaherd.pl
