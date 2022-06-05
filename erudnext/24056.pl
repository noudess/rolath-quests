my $headed_out;

sub EVENT_SPAWN
	{
	$headed_out = 0;
	}

sub EVENT_SIGNAL
	{
	$headed_out = 1;	
	quest::start(21);
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($headed_out)
		{
		$headed_out = 0;
		}
	elsif ($wp == 0)
		{
		quest::settimer("dock", 2);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("dock");
	quest::pause(2000000);
	}
