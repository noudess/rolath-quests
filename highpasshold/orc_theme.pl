sub EVENT_SPAWN
	{
	quest::set_proximity($x - 100, $x + 100, $y - 350, $y + 250);
	}

sub EVENT_ENTER
	{
	$client->PlayMP3("HighPassOrcs.mp3");
	}

sub EVENT_EXIT
	{
	$client->PlayMP3("");
	}
