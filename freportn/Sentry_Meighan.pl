sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Please speak no further.  I am nothing more than a defender of this temple.  The words of Marr lie with the masters and clerics of this temple.  They await you.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 12131 - Half of Potion of Marr
	if (plugin::takeItems(12131 => 1 )) {
		quest::say("Very good. Nothing more than a sip and I feel much more alert. The next sentry awaits you.");
		#:: Give a small amount of xp
		quest::exp(25);
		#:: Give item 12132 - Part of Potion of Marr
		quest::summonitem(12132);
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
