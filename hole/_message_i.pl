sub EVENT_SPAWN
	{
	quest::set_proximity(715, 755, -73, -33, -380, -340);
	}

sub EVENT_ENTER
	{
	$client->Message(0,"There are several water lines and markings on the walls indicating a great flood within these very halls.  Touching the markings brings to mind two questions:  Did the residents drown... or was there a fouler fate for them?");
	}
