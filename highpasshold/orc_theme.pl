sub EVENT_SPAWN
	{
	quest::set_proximity($x - 100, $x + 100, $y - 350, $y + 250);
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("HighPassOrcs.mp3");
	}

sub EVENT_EXIT
	{
	plugin::playmp3once("");
	}
