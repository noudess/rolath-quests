my $newcond;
my $oldcond;
my $newzone;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	if ($boatid == 1173)
		{
		if ($x == -1940)
			{
			$newzone = "erudnext";
			$newcond = 6;
			$oldcond = 4;
			}
		else
			{
			$newzone = "qeynos";
			$newcond = 4;
			$oldcond = 6;
			}
		}
	elsif ($boatid == 24301)
		{
		if ($x == -1940)
			{
			$newzone = "erudnext";
			$newcond = 7;
			$oldcond = 5;
			}
		else
			{
			$newzone = "qeynos";
			$newcond = 5;
			$oldcond = 7;
			}
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	my $bg = $npc->GetGrid();

	if ($bg == 67)
		{
		# (Erudin -> Qeynos)
		if ($wp == 2)
			{
			quest::spawn_condition("qeynos", $newcond, 1);
			}
		elsif ($wp == 3)
			{
			# Moving to Z 10 higher to ensure we don't fall through
			MOVE_TO_BOAT(1, 940, 375, $z, -24, 384);
			}
		elsif ($wp == 4)
			{
			quest::spawn_condition("erudsxing", $oldcond, 0);
			}
		}
	else
		{
		# (Qeynos -> Erudin)
		if ($wp == 19)
			{
			quest::spawn_condition("erudnext", $newcond, 1);
			}
		elsif ($wp == 20)
			{
			# Moving to Z 10 higher to ensure we don't fall through
			MOVE_TO_BOAT(24, -1900, -550, $z, -1, 128);
			}
		elsif ($wp == 21)
			{
			quest::spawn_condition("erudsxing", $oldcond, 0);
			}
		}
	}


# Destination boats need to be heading 0 in spawn2

sub MOVE_TO_BOAT
	{
	local($zid, $zx, $zy, $zz, $dboatz, $dest_boat_is_heading);
	($zid, $zx, $zy, $zz, $dboatz, $dest_boat_is_heading) = ($_[0], $_[1], $_[2], $_[3], $_[4], $_[5]);

	# Find all clients in proximity and ship them to destination.
	my @riders = $entity_list->GetClientList();

	foreach $rider (@riders)
		{
		# Is the person on the boat?

		my $mobX = $rider->GetX();	
		my $mobY = $rider->GetY();	
		my $mobZ = $rider->GetZ();	
	
		my $cdist = $npc->CalculateDistance($mobX, $mobY, $mobZ);		
	
		if ($cdist <= 300)
			{
			my $xdiff = $mobX - $x;
			my $ydiff = $mobY - $y;	
			
			my $zdiff = $dboatz - $zz; # Account for diff boat heights

			my $destx = $zx + $xdiff;
			my $desty = $zy + $ydiff;
			my $destz = $mobZ + $zdiff;

	#		quest::shout("Boat $x $y $z $h");
	#		quest::shout("Rider $mobX $mobY $mobZ");
	#		quest::shout("diff $xdiff $ydiff");
	#		quest::shout("dest $destx $desty $destz");

			$rider->MovePC($zid,$destx, $desty, $destz, $dest_boat_is_heading);
			}
		}
	}
