my $NPCRace;

sub EVENT_SPAWN
	{
	$NPCRace = $npc->GetRace();

	$npc->RandomizeFeatures(1, 1);

	if ($NPCRace == 4)
		{
		# Wood Elf Parts
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 17)
			{
			quest::addloot(13421, 1, 1);
			}

		# Elven Blood
		$roll = plugin::RandomRange(1,100);
		if ($roll <= 10)
			{
			quest::addloot(22515, 1, 1);
			}
		}

	if ($NPCRace == 5)
		{
		# High Elf Parts
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 6)
			{
			quest::addloot(13415, 1, 1);
			}

		# Elven Blood
		$roll = plugin::RandomRange(1,100);
		if ($roll <= 10)
			{
			quest::addloot(22515, 1, 1);
			}
		}
	}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Slavedrivers are just lackeys for the [taskmaster]. He is the real orc in charge.");
	}
	elsif ($text=~/taskmaster/i) {
		quest::say("The taskmaster?? He is that large orc who runs around with that [brass earring] in his ear.");
	}
	elsif ($text=~/brass earring/i) {
		quest::say("Yeah, a brass earring; He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
	}
}

sub EVENT_ITEM {
	#:: Create scalar variables for mob race and gender
	my $npcrace = $npc->GetRace();
	my $npcgender = $npc->GetGender();
	#:: Match one copper
	if ($copper == 1) {
		#:: Match Male High Elf
		if ($npcrace == 5 && $npcgender == 0) {
			quest::say("Not that!! I need key number 20!!");
		}
		#:: Match Female High Elf
		elsif ($npcrace == 5 && $npcgender == 1) {
			quest::say("What is this!!? Get me key number 21!!");
		}
		#:: Match Male Wood Elf
		elsif ($npcrace == 4 && $npcgender == 0) {
			quest::say("Not that!! I need key number 18!!");
		}
		#:: Match Female Wood Elf
		elsif ($npcrace == 4 && $npcgender == 1) {
			quest::say("Please!! I need a key with a number 19!!");
		}
	}
	#:: Match a 20020 - Shackle Key 20
	elsif (plugin::takeItems(20020 => 1)) {
		#:: Match Male High Elf
		if ($npcrace == 5 && $npcgender == 0) {
			quest::say("Good work!! I shall be on my way.  Farewell my friend!!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(275, 2); 		#:: + Keepers of the Art
			quest::faction(279, 1); 		#:: + King Tearis Thex
			quest::faction(246, 1); 		#:: + Faydark Champions
			quest::faction(239, -1); 		#:: - The Dead
			#:: Grant a moderate amount of experience
			$client->AddLevelBasedExp(14,10);
			#:: Create a hash for storing cash - 700 to 750cp
			my %cash = plugin::RandomCash(700,750);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Female High Elf
		elsif ($npcrace == 5 && $npcgender == 1) {
			quest::say("I have no need for this item $name, you can have it back.");
			#:: Give a 20020 - Shackle Key 20
			quest::summonitem(20020);
		}
	}
	#:: Match a 10351 - Brass Earring
	elsif (plugin::takeItems(10351 =>1)) {
		#:: Match Male High Elf
		if ($npcrace == 5 && $npcgender == 0) {
			quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			#:: Give a 18901 - Ragged Cloth Note (Csb 1.O.U. Hie 1)
			quest::summonitem(18901);
			#:: Ding!
			quest::ding();
			#:: Grant a moderate amount of experience
			quest::exp(1500);
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Female High Elf
		elsif ($npcrace == 5 && $npcgender == 1) {
			quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			#:: Give a 18902 - Torn Drawing (Csb I.O.U. Hie 2)
			quest::summonitem(18902);
			#:: Ding!
			quest::ding();
			#:: Grant a moderate amount of experience
			quest::exp(1500);
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Male Wood Elf
		elsif ($npcrace == 4 && $npcgender == 0) {
			quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			#:: Give a 18903 - Tattered Cloth Note (Csb 1.O.U. Elf 1)
			quest::summonitem(18903);
			#:: Ding!
			quest::ding();
			#:: Grant a moderate amount of experience
			quest::exp(1500);
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Female Wood Elf
		elsif ($npcrace == 4 && $npcgender == 1) {
			quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			#:: Give a 18904 - Faded Wedding Cloth (Csb 1.O.U. Elf 2)
			quest::summonitem(18904);
			#:: Ding!
			quest::ding();
			#:: Grant a moderate amount of experience
			quest::exp(1500);
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
	}
	#:: Match a 20021 - Shackle Key 21
	if (plugin::takeItems(20021 => 1)) {
		#:: Match Female High Elf
		if ($npcrace == 5 && $npcgender == 1) {
			quest::say("Good work!! I shall be on my way. Farewell my friend!!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(275, 2); 		#:: + Keepers of the Art
			quest::faction(279, 1); 		#:: + King Tearis Thex
			quest::faction(246, 1); 		#:: + Faydark Champions
			quest::faction(239, -1); 		#:: - The Dead
			#:: Grant a moderate amount of experience
			$client->AddLevelBasedExp(14,10);
			#:: Create a hash for storing cash - 700 to 750cp
			my %cash = plugin::RandomCash(700,750);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Male High Elf
		elsif ($npcrace == 5 && $npcgender == 0) {
			quest::say("I have no need for this item $name, you can have it back.");
			#:: Give a 20021 - Shackle Key 21
			quest::summonitem(20021);
		}
	}
	#:: Match a 20018 - Shackle Key 18
	if (plugin::takeItems(20018 => 1)) {
		#:: Match Male Wood Elf
		if ($npcrace == 4 && $npcgender == 0) {
			quest::say("Good work!! I shall be on my way. Farewell my friend!!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(326, 2); 		#:: + Emerald Warriors
			quest::faction(276, 1); 		#:: + Kelethin Merchants
			quest::faction(325, 1); 		#:: + Merchants of Felwithe
			quest::faction(270, -1); 		#:: - Indigo Brotherhood
			#:: Grant a moderate amount of experience
			$client->AddLevelBasedExp(14,10);
			#:: Create a hash for storing cash - 700 to 750cp
			my %cash = plugin::RandomCash(700,750);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Female Wood Elf
		elsif ($npcrace == 4 && $npcgender == 1) {
			quest::say("I have no need for this item $name, you can have it back.");
			#:: Give a 20018 - Shackle Key 18
			quest::summonitem(20018);
		}
	}
	#:: Match a 20019 - Shackle Key 19
	if (plugin::takeItems(20019 => 1)) {
		#:: Match Female Wood Elf
		if ($npcrace == 4 && $npcgender == 1) {
			quest::say("Good work!! I shall be on my way. Farewell my friend!!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(326, 2); 		#:: + Emerald Warriors
			quest::faction(276, 1); 		#:: + Kelethin Merchants
			quest::faction(325, 1); 		#:: + Merchants of Felwithe
			quest::faction(270, -1); 		#:: - Indigo Brotherhood
			#:: Grant a moderate amount of experience
			$client->AddLevelBasedExp(14,10);
			#:: Create a hash for storing cash - 700 to 750cp
			my %cash = plugin::RandomCash(700,750);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Create a timer 'depop' that triggers every 30 seconds
			quest::settimer("depop",30);
		}
		#:: Match Male Wood Elf
		elsif ($npcrace == 4 && $npcgender == 0) {
			quest::say("I have no need for this item $name, you can have it back.");
			#:: Give a 20019 - Shackle Key 19
			quest::summonitem(20019);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match the timer 'depop'
	if ($timer eq "depop") {
		#:: Stop the timer 'depop'
		quest::stoptimer("depop");
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::say("Time to die, $name!");
		}
	}
