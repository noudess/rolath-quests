# constants telling us which direction lift is moving
my $STATIONARY = -1;
my $UP = 1;
my $DOWN = 0;

# Identify the lift and levers
my $liftup = 0;
my $LOWER_LEVER;
my $UPPER_LEVER;
my $LIFT;
my $distance;
my $traveltime;

# Is the lift up or down.  These are in progress as well as final
my $direction = $STATIONARY;
my $steps_above = 0;
my $spawnz;

sub EVENT_SPAWN
	{
	$spawnz = $npc->GetZ();
	my $whoami = $npc->GetNPCTypeID();
	if ($whoami == 54369)
		{
		$LOWER_LEVER = 73;
		$UPPER_LEVER = 74;
		$LIFT = 69;
		$distance = 70;
		$traveltime = 8;
		}
	elsif ($whoami == 54377)
		{
		$LOWER_LEVER = 79;
		$UPPER_LEVER = 78;
		$LIFT = 77;
		$distance = 99;
		$traveltime = 10;
		}
	elsif ($whoami == 54380)
		{
		$LOWER_LEVER = 81;
		$UPPER_LEVER = 82;
		$LIFT = 80;
		$distance = 70;
		$traveltime = 8;
		}
	}

sub EVENT_SIGNAL 
	{
	# Handle The clickers
	quest::stoptimer($timer);

	if ($liftup)
		{
		$direction = $DOWN;
		quest::stoptimer("home");
		FORCE_CLOSE($LOWER_LEVER, $UPPER_LEVER, $LIFT);				
		$liftup=0;
		}
	else
		{
		$direction = $UP;
		quest::settimer("home", 20);
		FORCE_OPEN($LOWER_LEVER, $UPPER_LEVER, $LIFT);				
		$liftup=1;
		}

	quest::settimer("progress", 1);
	}

sub EVENT_TIMER
	{
	if ($timer eq "home")
		{
		# The client seems to send the door home (bottom) after 20 seconds...
		# Emulate it so the door state is maintained.

		quest::stoptimer("progress");
		quest::stoptimer("home");

		$direction = $DOWN;
		FORCE_CLOSE($LOWER_LEVER,$UPPER_LEVER,$LIFT);

		# Timer to monitor and update lift progress
		quest::settimer("progress", 1);

		$liftup=0;
		}
	elsif ($timer eq "progress")
		{
		if (($steps_above == $traveltime and $direction == $UP) ||
			   ($steps_above == 0 and $direction == $DOWN))
			   {
			   quest::stoptimer("progress");
			   $direction = $STATIONARY;
			   }
		elsif ($steps_above > 0 && $direction == $DOWN)
			   {
			   #quest::shout("Lift down $steps_above");
			   $steps_above = $steps_above - 1;
			   }
		elsif ($steps_above < $traveltime && $direction == $UP)
			   {
			   #quest::shout("Lift up $steps_above");
			   $steps_above = $steps_above + 1;
			   }
		if ($direction != $STATIONARY)
			   {
			   # Update our current Z
			   my $myx = $npc->GetX();
			   my $myy = $npc->GetY();
			   my $myz = $spawnz + ($steps_above * 9);

			   $npc->GMMove($myx, $myy, $myz);
			   }
		}
	}

sub FORCE_CLOSE
	{
    local($lowbutt, $highbutt, $door);
    ($lowbutt, $highbutt, $door) = ($_[0], $_[1], $_[2]);

	if (quest::isdooropen($lowbutt))
		{
		quest::forcedoorclose($lowbutt);
		}

	if (quest::isdooropen($highbutt))
		{
		quest::forcedoorclose($highbutt);
		}

	quest::forcedoorclose($door);
	}

sub FORCE_OPEN
	{
    local($lowbutt, $highbutt, $door);
    ($lowbutt, $highbutt, $door) = ($_[0], $_[1], $_[2]);

	if (!quest::isdooropen($lowbutt))
		{
		quest::forcedooropen($lowbutt);
		}

	if (!quest::isdooropen($highbutt))
		{
		quest::forcedooropen($highbutt);
		}

	quest::forcedooropen($door);
	}
