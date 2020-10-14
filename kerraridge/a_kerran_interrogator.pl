my $donotrepeat=0;

sub EVENT_SPAWN
	{
	$donotrepeat=0;
	quest::set_proximity(210, 340,  580, 680);
	}

sub EVENT_SAY 
	{
	}

sub EVENT_ENTER
	{
	if ($donotrepeat == 0)
		{
		quest::signalwith(74077,1,3); # If Mob is alive he will signal us.
		quest::settimer("askagain", 1200);
		$donotrepeat=1;
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("We know that yourrrr kind is up to something.  Tell us now, and we will rrrrelease you.");
	quest::signalwith(74077,2,3);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("askagain");
	$donotrepeat=0;
	}

#EOF
