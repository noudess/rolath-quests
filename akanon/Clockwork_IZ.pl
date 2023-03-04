sub EVENT_SPAWN
    {
    quest::set_proximity($x-20,$x+20,$y-20,$y+20, $z-15, $z+15);
    }

sub EVENT_ENTER
    {
	quest::say("Please do not disturb the animals.");
    }
