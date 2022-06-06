my $cond;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	quest::shout("Arriving at the Qeynos port shortly.  Make your way to the dock.");
	if ($boatid == 1173)
		{
		$cond = 4;
		}
	elsif ($boatid == 24301)
		{
		$cond = 5;
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 21)
		{
	    quest::spawn_condition("erudsxing", $cond, 1);
		}
	elsif ($wp == 22)
		{
		MOVE_TO_BOAT(98, -1940, -465, $z, -22);
		}
	elsif ($wp == 23)
		{
	    quest::spawn_condition("qeynos", $cond, 0);
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 8)
		{
		quest::shout("Departing the Qeynos Docks, watch your feet!");
		}
	}


# Destination boats need to be heading 0 in spawn2

sub MOVE_TO_BOAT
	{
	local($zid, $zx, $zy, $zz, $dboatz);
	($zid, $zx, $zy, $zz, $dboatz) = ($_[0], $_[1], $_[2], $_[3], $_[4]);

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

			quest::shout("BB Boat $x $y $z $h");
			quest::shout("Rider $mobX $mobY $mobZ");
			quest::shout("diff $xdiff $ydiff");
			quest::shout("dest $destx $desty $destz");

			$rider->MovePC($zid,$destx, $desty, $destz, 128);
			}
		}
	}

