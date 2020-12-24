my $cond;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

	quest::shout("$boatid");

	if ($boatid == 68228)
		{
		$cond = 6;
		}
	elsif ($boatid == 10183)
		{
		$cond = 3;
		}
	quest::shout("$cond");
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 17)
		{
	    quest::spawn_condition("oot", $cond, 1);
		}
	elsif ($wp == 18)
		{
		quest::shout("This is where the action is");
		MOVE_TO_BOAT(69, -10500, -300, -23);
		}
	elsif ($wp == 19)
		{
		quest::shout("Bye");
	    quest::spawn_condition("freporte", $cond, 0);
		}
	}


# Destination boats need to be heading 0 in spawn2

sub MOVE_TO_BOAT
	{
	local($zid, $zx, $zy, $zz);
	($zid, $zx, $zy, $zz) = ($_[0], $_[1], $_[2], $_[3]);

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

			$rider->MovePC($zid,$destx, $desty, $destz, 0);
			}
		}
	}
