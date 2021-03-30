sub EVENT_SAY
	{
	if ($text =~ /port/i)
		{
		MOVE_TO_BOAT(69, 11050, 1000, -20);
		}
	elsif ($text =~ /grid/i)
		{
		quest::start(501);
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

		my $mobX = $rider->GetX();	
		my $mobY = $rider->GetY();	
		my $mobZ = $rider->GetZ();	
		my $mobH = $rider->GetHeading();	
	
		my $cdist = $npc->CalculateDistance($mobX, $mobY, $mobZ);		
	
		if ($cdist <= 75)
			{
			my $rx = $rider->GetX();
			my $ry = $rider->GetY();
			my $rz = $rider->GetZ();

			my $xdiff = $rx - $x;
			my $ydiff = $ry - $y;	
			my $zdiff = $rz - $z;	
			
			my $destx = $zx + $xdiff;
			my $desty = $zy + $ydiff;
			my $destz = $zz + $zdiff;

			quest::shout("BB Boat $x $y $z $h");
			quest::shout("Rider $rx $ry $rz");
			quest::shout("diff $xdiff $ydiff $zdiff");
			quest::shout("dest $destx $desty $destz");

			$rider->MovePC($zid,$destx, $desty, $destz, 0);
			}
		}
	}
