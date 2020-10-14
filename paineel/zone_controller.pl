sub EVENT_SIGNAL
	{
	# This means the Kolbok Event has started.
	# Set a timer for 5 minutes and restore the zone to normal.
	quest::settimer("Kolbok", 360);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("Kolbok");

	my @koboldlist = (75165, 75166, 75167, 75168);

	# Get rid of all spawned kobold forces.
	foreach (@koboldlist)
		{
		quest::depopall($_);
		}

	# Depop Captain also... so he is back to normal.
	quest::depop_withtimer(101140);
	quest::processmobswhilezoneempty(0);
	}
