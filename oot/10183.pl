my $newcond;
my $oldcond;
my $newzone;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();
	quest::shout("Boat $boatid");

	if ($boatid == 68228)
		{
		if ($x == -10500)
			{
			$newzone = "butcher";
			$newcond = 4;
			$oldcond = 6;
			}
		else
			{
			$newzone = "freporte";
			$newcond = 6;
			$oldcond = 4;
			}
		}
	elsif ($boatid == 10183)
		{
		if ($x == -10500)
			{
			$newzone = "butcher";
			$newcond = 5;
			$oldcond = 3;
			}
		else
			{
			$newzone = "freporte";
			$newcond = 3;
			$oldcond = 5;
			}
		}

	quest::shout("Headed to $newzone.  Will set condition $newcond.");
	quest::shout("and turn off condition $oldcond in oot.");
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	my $bg = $npc->GetGrid();

	MOVE_TO_BOAT(10, -2186, 294, -77, 0);

	if ($bg == 63)
		{
		# (Freporte -> BB)
		if ($wp == 22)
			{
			quest::shout("Turning on condition $newcond in $newzone.");
			quest::spawn_condition("butcher", $newcond, 1);
			}
		elsif ($wp == 23)
			{
			MOVE_TO_BOAT(68, 3682, -907, -13,1);
			}
		elsif ($wp == 24)
			{
			quest::shout("Turning off condition $oldcond in oot.");
			quest::spawn_condition("oot", $oldcond, 0);
			}
		}
	else
		{
		# (BB -> Freporte)
		if ($wp == 11)
			{
			quest::shout("Turning on condition $newcond in $newzone.");
			quest::spawn_condition("freporte", $newcond, 1);
			}
		elsif ($wp == 12)
			{
			MOVE_TO_BOAT(10, -2186, 294, -77, 1);
			}
		elsif ($wp == 13)
			{
			quest::shout("Turning off condition $oldcond in oot.");
			quest::spawn_condition("oot", $oldcond, 0);
			}
		}
	}


# Destination boats need to be heading 0 in spawn2

sub MOVE_TO_BOAT
	{
	local($zid, $zx, $zy, $zz, $doit);
	($zid, $zx, $zy, $zz, $doit) = ($_[0], $_[1], $_[2], $_[3], $_[4]);

	# Find all clients in proximity and ship them to destination.
	my @riders = $entity_list->GetClientList();

	foreach $rider (@riders)
		{
		# Is the person on the boat?

		my $mobX = int($rider->GetX());	
		my $mobY = int($rider->GetY());	
		my $mobZ = int($rider->GetZ());	
		my $mobH = int($rider->GetHeading());	
	
		my $cdist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));		
	
		if ($cdist <= 75)
			{
			my $rx = int($rider->GetX());
			my $ry = int($rider->GetY());
			my $rz = int($rider->GetZ());

			my $xdiff = $rx - $x;
			my $ydiff = $ry - $y;	
			my $zdiff = $rz - $z;	
			
			my $destx = $zx + $xdiff;
			my $desty = $zy + $ydiff;
			my $destz = $zz + $zdiff;

			quest::shout("Boat $x $y $z $h");
			quest::shout("Rider $rx $ry $rz");
			quest::shout("diff $xdiff $ydiff $zdiff");
			quest::shout("dest $destx $desty $destz");

			if ($doit)
				{
				$rider->MovePC($zid,$destx, $desty, $destz, 0);
				}
			}
		}
	}
