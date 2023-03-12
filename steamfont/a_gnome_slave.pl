my $canflee = 1;
my $mobX;
my $mobY;
my $mobZ;
my $mobname;

sub EVENT_SPAWN
	{
	my $gender = plugin::RandomRange(0,1);
	$npc->SetGender($gender);
	$npc->RandomizeFeatures(1, 1);

	# Look around and see if it's clear to run away.
	my $check = plugin::RandomRange(5, 60);	
	quest::settimer("scout", $check);
	}

sub EVENT_TIMER
	{
	if ($timer eq "scout")
		{
		# Check in the general area for minotaurs

		$canflee = 1;
        my @moblist = $entity_list->GetMobList();

        foreach $mobby (@moblist)
            {
            my $npcrace = $mobby->GetRace();

			if ($npcrace == 53)
				{
				$mobX = int($mobby->GetX());
				$mobY = int($mobby->GetY());
				$mobZ = int($mobby->GetZ());
				$mobname = $mobby->GetCleanName();

				# get distance from npc
				my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

				if ($npc_dist <= 120) 
					{
					$canflee=0;
					}
				}
            }

		# Run and stop timer if there are none (grid 182)
		if ($canflee)
			{
			quest::emote("runs for their life.");
			quest::SetRunning(1);
			quest::start(182);
			quest::stoptimer("scout");
			}
		else
			{
			# comment about half the time
			if (int(rand(2)))
				{
				$sadmsg = int(rand(3));
				if ($sadmsg == 0)
					{
					quest::emote("looks sadly around them.");
					}
				elsif ($sadmsg == 1)
					{
					quest::emote("wrinkles its nose at the foul smell of minotaur dung.");
					}
				elsif ($sadmsg == 2)
					{
					quest::emote("sighs quietly in resignation.");
					}
				}
			}
		}
	}
