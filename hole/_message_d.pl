sub EVENT_SPAWN
	{
	quest::set_proximity(-205, -105, -77, 37, -285, -265);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The buildings nearby are obviously aged, but more than that, they appear to have defended against a great battle.  Several doors are lying about, off their hinges, while others seem to be unable to be opened.");
	}
