sub EVENT_WAYPOINT_ARRIVE 
	{
	# Kobold attacking force
	@army = (101007, 101129, 101006, 101052, 101140);

	my $npccheck = 0;

	foreach (@army)
		{
		# See if the guard is up first
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

			#Checking if within range of Lieutenant_Arathur to respond.
			if ($npc_dist <= 15) 
				{
				quest::emote("kneels before a savior of Clan Kolbok");
				}
			elsif ($npc_dist <= 30) 
				{
				quest::say("Fight well my lord!");
				}
			elsif ($npc_dist <= 45) 
				{
				quest::say("Good Battle!");
				}
			}	  
		}
	}
