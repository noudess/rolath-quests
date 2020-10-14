sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Please speak with the masters. I am on watch and have no time to converse.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 12132 - Part of Potion of Marr
	if (plugin::takeItems(12132 => 1 )) {
		quest::say("That gives me new life. Take it to the next sentry.");
		#:: Give a small amount of xp
		quest::exp(25);
		#:: Give item 12133 - Part of Potion of Marr
		quest::summonitem(12133);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(362,1); 		#:: + Priests of Marr
		quest::faction(330,-1); 	#:: - Freeport Militia
		quest::faction(281,1); 		#:: + Knights of Truth	
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
