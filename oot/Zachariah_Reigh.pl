sub EVENT_SPAWN
	{
	quest::set_proximity($x-200,$x+200,$y-200,$y+200); 
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("AveMaria.mp3");
	}
