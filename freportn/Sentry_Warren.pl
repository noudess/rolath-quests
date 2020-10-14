sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("May the words of Marr be passed on to you.  Please seek knowledge from the masters of this temple.");
	}
	if ($text=~/sisterhood of erollisi/i) {
		quest::say("The Sisterhood of Erollisi is a band of female warriors. Their founders hail from Kelethin. They now train and live upon an island in the Ocean of Tears. We often check up on them. We share the same deity.");
	}	
}

sub EVENT_ITEM {
	#:: Turn in for 12133 - Part of Potion of Marr
	if (plugin::takeItems(12133 => 1 )) {
		quest::say("Thank you. I believe you need to seek out Sentry Xyrin. She is not at the temple. I believe she left to speak with [Sisterhood of Erollisi]. She was to speak with Styria.");
		#:: Give item 12134 - Last of Potion of Marr
		quest::summonitem(12134);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(25);
		#:: Set faction
		quest::faction(362,1); 		#:: + Priests of Marr
		quest::faction(330,-1); 	#:: - Freeport Militia
		quest::faction(281,1); 		#:: + Knights of Truth	
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
