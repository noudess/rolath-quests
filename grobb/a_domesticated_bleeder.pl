my $feeding=0;

sub EVENT_SPAWN
	{
	my $delay=plugin::RandomRange(0,3000);	
	quest::settimer("suckme", $delay);
	$feeding = 0;
	}

sub EVENT_TIMER
	{
	# See if a froglok prisoner is close.
	my @nlist = $entity_list->GetNPCList();
	foreach my $mob_check (@nlist)
		{
		my $tarname = $mob_check->GetCleanName();
		if ($feeding == 0 && $tarname =~ /froglok/i)
			{
			my $mobX = int($mob_check->GetX());
			my $mobY = int($mob_check->GetY());
			my $mobZ = int($mob_check->GetZ());

			# get distance from npc
			my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

			#Checking if within range of Lieutenant_Arathur to respond.
			if ($npc_dist <= 200) 
				{
				$feeding = 1;
				quest::emote("goes hunting");
				quest::attacknpc($mob_check->GetID());
				}
			}
		}
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 0)
		{
		$feeding=0;
		}
	}

#END of FILE Zone:qeynos  ID:1085 -- Lieutenant_Arathur
