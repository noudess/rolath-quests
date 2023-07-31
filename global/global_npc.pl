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
	quest::debug("combat_state $combat_state");
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
			plugin::SetAnim("stand");
			}
		}
	}
