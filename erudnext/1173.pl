my $cond;
my $zoffset;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	quest::shout("All aboard the shuttle for Erud's Crossing, it will be leaving the dock in less than a minute to join us.");
	if ($boatid == 1173)
		{
		$cond = 6;
		}
	elsif ($boatid == 24301)
		{
		$cond = 7;
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 1)
		{
		# Signal Sabrina to come out
		quest::signal(24056);	
		quest::shout("Shuttle leaving dock in a few seconds, be aboard or be left behind!");
		}
	elsif ($wp == 3)
		{
	    quest::spawn_condition("erudsxing", $cond, 1);
		}
	elsif ($wp == 4)
		{
		MOVE_TO_BOAT(98, 4600, 402, $z, -22);
		}
	elsif ($wp == 5)
		{
	    quest::spawn_condition("erudnext", $cond, 0);
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

#			quest::shout("Boat $x $y $z $h");
#			quest::shout("Rider $mobX $mobY $mobZ");
#			quest::shout("diff $xdiff $ydiff");
#			quest::shout("dest $destx $desty $destz");

			$rider->MovePC($zid,$destx, $desty, $destz, 384);
			}
		}
	}
