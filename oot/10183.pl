my $newcond;
my $oldcond;
my $newzone;

sub EVENT_SPAWN
	{
	my $boatid = $npc->GetNPCTypeID();

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
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	my $bg = $npc->GetGrid();

	if ($bg == 63)
		{
		# (Freporte -> BB)
		if ($wp == 23)
			{
			quest::spawn_condition("butcher", $newcond, 1);
			}
		elsif ($wp == 24)
			{
			# Moving to Z 10 higher to ensure we don't fall through
			MOVE_TO_BOAT(68, 3682, -907, -3,1);
			}
		elsif ($wp == 25)
			{
			quest::spawn_condition("oot", $oldcond, 0);
			}
		}
	else
		{
		# (BB -> Freporte)
		if ($wp == 11)
			{
			quest::spawn_condition("freporte", $newcond, 1);
			}
		elsif ($wp == 12)
			{
			# Moving to Z 10 higher to ensure we don't fall through
			MOVE_TO_BOAT(10, -2186, 294, -67, 1);
			}
		elsif ($wp == 13)
			{
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

		my $mobX = $rider->GetX();	
		my $mobY = $rider->GetY();	
		my $mobZ = $rider->GetZ();	
	
		my $cdist = $npc->CalculateDistance($mobX, $mobY, $mobZ);		
	
		if ($cdist <= 300)
			{
			my $xdiff = $mobX - $x;
			my $ydiff = $mobY - $y;	
			my $zdiff = $mobZ - $z;	
			
			my $destx = $zx + $xdiff;
			my $desty = $zy + $ydiff;
			my $destz = $zz + $zdiff;

	#		quest::shout("Boat $x $y $z $h");
	#		quest::shout("Rider $mobX $mobY $mobZ");
	#		quest::shout("diff $xdiff $ydiff $zdiff");
	#		quest::shout("dest $destx $desty $destz");

			if ($doit)
				{
				$rider->MovePC($zid,$destx, $desty, $destz, 0);
				}
			}
		}
	}
