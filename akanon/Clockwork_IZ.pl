sub EVENT_SPAWN
    {
    quest::set_proximity($x-20,$x+20,$y-20,$y+20);
    }

sub EVENT_ENTER
    {
	quest::say("Please do not disturb the animals.");
    }
