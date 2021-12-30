my $requested = 0;
my $curgrid;

sub EVENT_SPAWN
	{
#	quest::SetRunning(1);
	$requested=0;
	$curgrid=248;
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
	if ($curgrid == 248 and $wp == 53)
		{
		# Stop is supposed to stop the grid.
		# It does, but the mob immediately tries to go to spawn point.
		# So move him here and make him stay until lift arrives
#		quest::SetRunning(0);
		quest::pause(-1);
		quest::settimer("check_lift", 1);
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($curgrid == 248 and $wp == 55)
		{
		$npc->GMMove(221, 985, -20, 506);
		$requested=0;
#		quest::SetRunning(1);
		}
	elsif ($curgrid == 248 and $wp == 72)
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
	my $myliftnpc;

	quest::stoptimer($timer);

	if ($timer eq "check_lift")
		{
		$myliftnpc=54377;
		}	
	elsif ($timer eq "check_lift2")
		{
		$myliftnpc=54369;
		}

	if ($timer eq "getoff")
		{
		quest::stoptimer("getoff");
		$npc->GMMove(285, 136, 79, 128);
#		quest::SetRunning(1);
		quest::start(249);
		$curgrid=249;
		}
	else
		{
		my $lift = $entity_list->GetNPCByNPCTypeID($myliftnpc);
		my $liftz = $lift->GetZ();
		my $myz = $npc->GetZ();
		my $diff = abs($myz - $liftz);

		if ($diff < 10)
			{
			quest::say("Ah, the lift is here!");
			if ($timer eq "check_lift")
				{
				quest::resume();
				}
			elsif ($timer eq "check_lift2")
				{
				$npc->GMMove(265, 138, 9, 128);
				quest::signal($myliftnpc);
				quest::settimer("getoff", 12);
				}
			}
		else
			{
			# Request Lift
			if ($requested == 0)
				{
				quest::say("This lift is never here...");
				quest::say("Kill orcs... push buttons... all day long..");
				quest::signal($myliftnpc);
				$requested = 1;
				}
			else
				{
				quest::emote("taps his foot impatiently..");
				}

			quest::settimer($timer, 5);
			}
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::say("My comrades will avenge my death.");
	}
