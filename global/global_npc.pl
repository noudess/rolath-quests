my $mrace;

sub EVENT_SPAWN
	{
	$mrace = $npc->GetRace();
	if ($mrace == 29)
		{
		quest::debug("starting timer globalgargsit");
		quest::settimer("globalgargsit", 60);
		}
	}

sub EVENT_TIMER
	{
	quest::debug("timer $timer fired");
	if ($timer eq "globalgargsit")
		{
		plugin::SetAnim("sit");
		quest::debug("stopping timer $timer");
		quest::stoptimer($timer);
		}
	}

sub EVENT_COMBAT
	{
	$mrace = $npc->GetRace();
	if ($mrace == 29)
		{
		if ($combat_state == 0)
			{
			quest::settimer("globalgargsit", 300);
			quest::debug("combat starting timer globalgargsit");
			}
		elsif ($combat_state == 1)
			{
			quest::stoptimer("globalgargsit");
			plugin::SetAnim("stand");
			}
		}
	}
