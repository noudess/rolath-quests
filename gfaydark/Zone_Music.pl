sub EVENT_SPAWN
	{
	quest::set_proximity($x-700, $x+775, $y-1025, $y+850, $z-1500, $z+1500, 1);
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("Faydark.mp3");
	}

sub EVENT_EXIT
	{
	$client->PlayMP3("");
	}
