sub EVENT_SPAWN
	{
	quest::set_proximity(364, 494, -37, 87, -365, -305);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The pool of water at your feet is unusually clean, the retaining walls free of moss or other growth you would expect.");
	}
