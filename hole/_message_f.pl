sub EVENT_SPAWN
	{
	quest::set_proximity(272, 312, 184, 224, -365, -325);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The walls of this building lie in ruin near your feet.  You step thru the wall into what appears to be a dining room or banquet hall of some sort.");
	}
