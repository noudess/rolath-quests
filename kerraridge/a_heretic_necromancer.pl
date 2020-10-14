sub EVENT_SPAWN
	{
	if ($y == -437)
		{
		quest::settimer("chat", 10);
		}
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0 && $y == -437)
		{
		my $MaugarimUp = $entity_list->GetMobByNpcTypeID(74041);
		if (!defined($MaugarimUp))
			{
			quest::say("I have not found anything yet.  Ever since Maugarim killed Astrid she's been hell bent on finding more artifacts.");
			quest::signalwith(74122,1,1000);
			quest::signalwith(74123,1,1000);
			quest::settimer("chat", 180);
			}
		else
			{
			quest::say("I'm sure we're going to find what you are looking for Maugarim.");
			quest::signalwith(74041,1,1000);
			quest::settimer("chat", 1200);
			}
		}
	else
		{
		quest::settimer("chat", 1200);
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1 && $y == -385)
		{
		quest::say("There's nothing to be found on this rock except for cat shit.  I say we file our reports and go home.");
		quest::signalwith(74122,2,2000);
		quest::signalwith(74123,2,2000);
		}
	if ($signal == 2 && $y == -380)
		{
		quest::say("Ha!  You first.  Maugarim shows up and we're not searching and we'll just be more corpses to be reanimated.");
		}
	}
