sub EVENT_SPAWN
	{
	quest::set_proximity(471, 591, 447, 567, -697, -657);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The structure before you appears to be a temple of some sort.  You feel like you are being watched by the cold still eyes of the gargoyles perched upon the corner of the walls.  A cold breeze rushes by you and makes you shiver.");
	}
