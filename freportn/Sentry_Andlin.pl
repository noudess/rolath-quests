sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! I would love to converse with you, but as you cansee, I am standing my watch.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 12127- Full Potion of Marr
	if (plugin::takeItems(12127 => 1 )) {
		quest::say("My thanks to you. I feel much strength. You may take the bottle to the next sentry.");
		#:: Give a small amount of xp
		quest::exp(25);
		#:: Give item 12128 - Part of Potion of Marr
		quest::summonitem(12128);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(362,1); 		#:: + Priests of Marr
		quest::faction(330,-1); 	#:: - Freeport Militia
		quest::faction(281,1); 		#:: + Knights of Truth	
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
