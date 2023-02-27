my $requested = 0;
my $curgrid;

sub EVENT_SPAWN
	{
	#quest::SetRunning(1);
	$requested=0;
	$curgrid=205;
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		my $cur_target = $npc->GetHateTop();
		if($cur_target) 
			{
			my $target_name = $cur_target->GetCleanName();
			quest::say("Time to die $target_name!");
			}
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($curgrid == 205 and $wp == 34)
		{
		#quest::SetRunning(0);
		quest::pause(-1);
		quest::settimer("check_lift", 1);
		#quest::debug("Arrived at lift. Setting timer");
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($curgrid == 205 and $wp == 35)
		{
		$npc->GMMove(221, 985, -20, 506);
		$requested=0;
#		quest::SetRunning(1);
		}
	elsif ($curgrid == 205 and $wp == 48)
		{
		# Stop is supposed to stop the grid.
		# It does, but the mob immediately tries to go to spawn point.
		# So move him here and make him stay until lift arrives
		quest::pause(-1);
#		quest::SetRunning(0);
		quest::settimer("check_lift2", 1);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "check_lift")
		{
		quest::stoptimer($timer);
		OPERATE_LIFT(54377, $timer);
		}	
	elsif ($timer eq "check_lift2")
		{
		quest::stoptimer($timer);
		OPERATE_LIFT(54369, $timer);
		}
	elsif ($timer eq "getoff")
		{
		quest::stoptimer($timer);
		$npc->GMMove(285, 136, 79, 128);
		#quest::SetRunning(1);
		quest::start(205);
		$curgrid=249;
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::say("My comrades will avenge my death.");
	}

sub OPERATE_LIFT
	{
    local($lliftnpc, $llifttimer);
    ($lliftnpc, $llifttimer) = ($_[0], $_[1]);

	my $lift = $entity_list->GetNPCByNPCTypeID($lliftnpc);
	my $liftz = $lift->GetZ();
	my $myz = $npc->GetZ();
	my $diff = abs($myz - $liftz);

	if ($diff < 10)
		{
		quest::say("Good timing!");
		if ($llifttimer eq "check_lift")
			{
			quest::resume();
			}
		elsif ($llifttimer eq "check_lift2")
			{
			$npc->GMMove(265, 138, 9, 128);
			quest::signal($lliftnpc);
			quest::settimer("getoff", 12);
			}
		}
	else
		{
		# Request Lift
		if ($requested == 0)
			{
			quest::say("This is the way we call the lift, call the lift, call the lift...");
			quest::signal($lliftnpc);
			$requested = 1;
			}

		quest::settimer($llifttimer, 5);
		}
	}
