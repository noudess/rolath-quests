my $fightover=0;

sub EVENT_SPAWN
	{
	#:: Set running true (run)
	quest::SetRunning(1);
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("The towering wall of stone is clearly unmovable at this point, being held in place by collection of magical energies.");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 7 && $fightover == 0)
		{
		quest::say("Hello, Alayle. We just got a message from Qeynos. I think you should come with me.");

		#:: Send a signal '1' to West Freeport >> Guard_Alayle (9141) with no delay
		quest::signalwith(9141, 1, 0);

		#:: Set running false (walk)
		quest::SetRunning(0);
		}
	}

sub EVENT_SIGNAL
	{
	#:: Match a signal '1' from /freportw/Guard_Alayle.pl
	if ($signal == 1)
		{
		quest::say("Oh, well. We can talk here. You just have to do all the bleeding.");

		#:: Send a signal '2' to West Freeport >> Guard_Alayle (9141) with a 3 second delay
		quest::signalwith(9141, 2, 3);
		}
	elsif ($signal == 2)
		{
		#:: Attack West Freeport >> Guard_Alayle (9141)
		quest::attacknpctype(9141);
		quest::say("As you try to open penetrate the stone wall it is clearly being held in place by a powerful force.");
		$fightover = 1;

		#:: Send a signal '1' to West Freeport >> Guard_Lithnon (9106) with no delay
		quest::signalwith(9106, 1, 0);
		}
	}
