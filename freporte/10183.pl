my $cond;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	if ($boatid == 68228)
		{
		$cond = 6;
		quest::shout("SirensBane will be arriving at the docks shortly.");
		}
	elsif ($boatid == 10183)
		{
		quest::shout("Stormbreaker will be arriving at the docks shortly.");
		$cond = 3;
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 17)
		{
	    quest::spawn_condition("oot", $cond, 1);
		}
	elsif ($wp == 18)
		{
		MOVE_TO_BOAT(69, -10500, -300, $z, -23, 1);
		}
	elsif ($wp == 19)
		{
	    quest::spawn_condition("freporte", $cond, 0);
		}
	}


# Destination boats need to be heading 0 in spawn2

sub MOVE_TO_BOAT
	{
	local($zid, $zx, $zy, $zz, $dboatz, $doit);
	($zid, $zx, $zy, $zz, $dboatz, $doit) = ($_[0], $_[1], $_[2], $_[3], $_[4], $_[5]);

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

#			quest::shout("Boat $x $y $z $h");
#			quest::shout("Rider $mobX $mobY $mobZ");
#			quest::shout("diff $xdiff $ydiff $zdiff");
#			quest::shout("dest $destx $desty $destz");

			if ($doit)
				{
				$rider->MovePC($zid,$destx, $desty, $destz, 0);
				}
			}
		}
	}
