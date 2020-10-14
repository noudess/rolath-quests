sub EVENT_SPAWN
	{
	quest::set_proximity(-141, -71, 120, 200, -246, -226);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The summoned creatures seem to gain in power the closer you get to the heart of the old city.");
	}
