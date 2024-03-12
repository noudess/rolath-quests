sub EVENT_SPAWN
	{
	quest::settimer("paw", 600);
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0)
		{
		if ($timer eq "paw")
			{
			quest::say("Can you believe that? That guy actually thinks he is going to find the [Paw of Opolla!]! Bwah ha ha ha!");
			quest::signalwith(1072, 1, 1);
			}
		}
	}


sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
		quest::say("Shut your hole, Micc, you dirty son of a kobold!");
		}
	else
		{
		quest::say("You back from the dead Korvik?  Clamp it and get smashed like the rest of the losers in here!");
		}
	}


sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Hey, $name!  Do I know you from somewhere?  Highpass?  Nah, you ain't who I thought you were.  If I were you I would just keep my trap shut and buy some drinks.");
		}
	if ($text =~ /paw of opolla/i)
		{
		quest::say("Heh? Why don't you mind your own business bub?! Buzz off!");
		quest::signalwith(1072, 2, 1);
		}
	}

#END of FILE Zone:qeynos  ID:1080 -- Klieb_Torne

