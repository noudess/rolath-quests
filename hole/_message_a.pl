sub EVENT_SPAWN
	{
	quest::set_proximity(-780, -700, 343, 443, -116, -96);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"The home of the golems opens up before you.  Their massive forms have made great indentations in the ground.");
	}
