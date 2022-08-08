sub EVENT_SPAWN
	{
	quest::settimer("nexus5min", 300);

	if (plugin::zoneClientCount() > 0)
		{
		quest::signalwith(152000, 20, 0);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "nexus5min")
		{
		quest::stoptimer("nexus5min");
		quest::settimer("ports2min", 120);

		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(152000, 23, 0);
			}
		}

	if ($timer eq "ports2min")
		{
		quest::stoptimer("ports2min");
		quest::settimer("nexustimer", 120);

		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(152000, 24, 0);
			}
		}

	if ($timer eq "nexustimer")
		{
		quest::stoptimer("nexustimer");
		quest::settimer("ports1min", 60);

		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(152000, 25, 0);
			}
		}

	if ($timer eq "ports1min")
		{
		quest::stoptimer("ports1min");
		quest::setglobal(odus_port, 1, 3, "S60");
		quest::setglobal(faydwer_port, 1, 3, "S60");
		quest::setglobal(antonica_port, 1, 3, "S60");

		quest::settimer("nexus5min", 60);

		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(152000, 26, 0);
			}
		}
	}
