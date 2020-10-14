sub EVENT_SPAWN 
	{
	quest::moveto(-7688,-3743,1.41,124,1);
	quest::settimer("attack",10);
	}

sub EVENT_TIMER
	{
	quest::shout("Alright then, I'm coming in!");
	quest::stoptimer("attack");
	quest::attacknpctype(12088);
	}
