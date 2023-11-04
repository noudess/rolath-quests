sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("At last I can rest..");
	quest::signalwith(21011, 1, 0);
}
