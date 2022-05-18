sub EVENT_SAY {
	if ($text=~/king is dead/i) {
		quest::say("Dead you say? My goodness! Did you manage to slay the warlord too? If you provide me with proof of his death, I can enchant the mace the dwarf gave you as payment. But, I will require the proof first!");
	}
}

sub EVENT_ITEM {
	#:: Match a 2301 - Bracers of Battle
	if (plugin::takeItems(2301 => 1)) {
		quest::say("Erollisi be praised! You slew the orc lord! Well, here is a token of my appreciation! Should you wish to have that mace enchanted, just hand me the mace and my token and I shall uphold my end of the bargain!");
		#:: Give a 1900 - Prayer Cloth of Tunare
		quest::summonitem(1900);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(5000);
	}
	#:: Match a 1900 - Prayer Cloth of Tunare, and a 6315 - Dwarven Mace
	elsif (plugin::takeItems(1900 => 1, 6315 => 1)) {
		quest::say("Erollisi be praised! You slew the orc lord! Well, here is a token of my appreciation! Should you wish to have that mace enchanted, just hand me the mace and my token and I shall uphold my end of the bargain!");
		#:: Give a 6305 - Screaming Mace
		quest::summonitem(6305);
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(10000);
	}
	#:: Match a 1900 - Prayer Cloth of Tunare
	elsif (plugin::takeItems(1900 => 1)) {
		quest::say("Have you the other item I require?");
		#:: Return a 1900 - Prayer Cloth of Tunare
		quest::summonitem(1900);
	}
	#:: Match a 6315 - Dwarven Mace
	elsif (plugin::takeItems(6315 => 1)) {
		quest::say("Have you the other item I require?");
		#:: Return a 6315 - Dwarven Mace
		quest::summonitem(6315);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
