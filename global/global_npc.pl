my $mrace;

sub EVENT_SPAWN
	{
	$mrace = $npc->GetRace();
	if ($mrace == 29)
		{
		quest::settimer("globalgargsit", 60);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "globalgargsit")
		{
		plugin::SetAnim("sit");
		quest::stoptimer($timer);
		}
	}

sub EVENT_COMBAT
	{
	$mrace = $npc->GetRace();
    if ($combat_state == 0 && $mrace == 29)
        {
        quest::settimer("globalgargsit", 300);
        }
	}
