sub EVENT_SPAWN
	{
	# For music
	quest::set_proximity($x-200,$x+200,$y-200,$y+200); 
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("AveMaria.mp3");
	}

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the island of the Sisterhood of Erollisi.");
		}
	}
