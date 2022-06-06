my $cond;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	if ($boatid == 68228)
		{
		quest::shout("SirensBane will be arriving at the docks shortly.");
		$cond = 4;
		}
	elsif ($boatid == 10183)
		{
		quest::shout("Stormbreaker will be arriving at the docks shortly.");
		$cond = 5;
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 12)
		{
	    quest::spawn_condition("oot", $cond, 1);
		}
	elsif ($wp == 13)
		{
		MOVE_TO_BOAT(69, 11050, 1000, $z, -23);
		}
	elsif ($wp == 14)
		{
	    quest::spawn_condition("butcher", $cond, 0);
		}
	}

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

			#quest::shout("BB Boat $x $y $z $h");
			#quest::shout("Rider $mobX $mobY $mobZ");
			#quest::shout("diff $xdiff $ydiff $zdiff");
			#quest::shout("dest $destx $desty $destz");

			$rider->MovePC($zid,$destx, $desty, $destz, 256);
			}
		}
	}
