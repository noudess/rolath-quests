my $mute = 0;

sub EVENT_SPAWN
	{
	quest::set_proximity(-11, 69, -233, -143, -341, -321);
	}

sub EVENT_ENTER
	{
	my $npccheck = 0;
	my $scold = 0;
	
	@GARGS=(39023,39025, 39032, 39045, 39046, 39048, 39050, 39051, 39062, 39106, 39107, 39117, 39118);

	foreach (@GARGS)
		{
		# looks for nearby gargs in los
		$npccheck = $entity_list->GetMobByNpcTypeID($_);
		if (defined($npccheck))
			{
			my $npc_checkID = $_;
			my $mob_check = $entity_list->GetMobByNpcTypeID($npc_checkID);
			my $mobX = int($mob_check->GetX());
			my $mobY = int($mob_check->GetY());
			my $mobZ = int($mob_check->GetZ());

			# get distance from npc
			my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

			#Checking if within range
			if ($npc_dist <= 150) 
				{
				$scold=1;
				}
			}	  
		}

	if ($scold > 0 && $mute == 0) 
		{
		$client->Message(0,"You catch a swift movement out of the corner of your eye, did that finely sculpted gargoyle just move?");
		$mute=1;
		quest::settimer("mute", 20);
		}
	}

sub EVENT_TIMER
	{
	#Can start replying again.
	$mute=0;
	quest::stoptimer("mute");
	}
