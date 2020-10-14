#Lieutenant_Dagarok.pl
#The Crate (evil)

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("How dare you disturb me! You people need to just mind your pathetic lives and leave the rest to us. Leave me now!");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18824 => 1)) { #Slip of Parchment
		quest::say("What is this? Hmmm. It seems Weleth has a problem with following orders. I will deal with him. Good work in bringing this to my attention. Our job here would be much more difficult without the help of loyal citizens like yourself. Take this as a token of Commander Kane's appreciation.");
		# Factions and XP verified on live.
		quest::faction(230, 25);#Corrupt Qeynos Guards
		quest::faction(262, -3);#Guards of Qeynos
		quest::faction(273, 3);#Kane Bayle
		quest::faction(223, 2);#Circle Of Unseen Hands
		quest::faction(221, 3);#Bloodsabers
		quest::exp(231);
		quest::givecash(5,0,0,0);
		quest::ding();
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos2 ID: 2020 -- Lieutenant_Dagarok.pl
