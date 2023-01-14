sub EVENT_SPAWN {
	quest::settimer("sit", 3);
}

sub EVENT_TIMER
	{
	quest::stoptimer("sit");
	plugin::SetAnim(sit);
	}

sub EVENT_ITEM {
	#:: Match a 12278 - Abandoned Orc Shovel
	if (plugin::takeItems(12278 => 1)) {
		#:: Appearance 0 - Stand
		plugin::SetAnim("stand");
		#:: Path (including swimming on top of water) to destination.
		quest::start(46);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 43) {
		#:: Create a 12274 - Chalice of Conquest at specified coordinates (lower z to appear on ground)
		quest::creategroundobject(12274, -395.87, 807.04, 68, 0);
		#:: Create a proximity, 20 units across, 20 units tall, without proximity say
		quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10, $z - 10, $z + 10, 0);
	}
}

sub EVENT_ENTER {
	quest::attack($name);
}
