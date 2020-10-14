my $NPCRace;

sub EVENT_SPAWN
	{
	$NPCRace = $npc->GetRace();

	# No orcs get randomized
	if ($NPCRace != 54)
		{
		my $gender = plugin::RandomRange(0,1);
		$npc->SetGender($gender);
		$npc->RandomizeFeatures(1, 1);
		}

	if ($NPCRace == 1)
		{
		# Human Blood
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 20)
			{
			quest::addloot(22514, 1, 1);
			}
		}

	if ($NPCRace == 4)
		{
		# Wood Elf Parts
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 5)
			{
			quest::addloot(13421, 1, 1);
			}
		}

	if ($NPCRace == 12)
		{
		# Gnome Meat
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 5)
			{
			quest::addloot(13418, 1, 1);
			}
		}

	if ($NPCRace == 6)
		{
		# Dark Elf Parts
		my $roll = plugin::RandomRange(1,100);
		if ($roll <= 5)
			{
			quest::addloot(13422, 1, 1);
			}
		}
	}

sub EVENT_COMBAT 
	{
	$NPCRace = $npc->GetRace();
	if($combat_state == 1)
		{
		if($NPCRace==54)
			{
			quest::say("Orc stomp, orc kill - orc weapons, your blood will spill.");
			}
		else 
			{
			quest::say("Time to die $name!");
			}
		}
	}

sub EVENT_DEATH 
	{
	if($NPCRace!=54)
		{
		quest::say("My comrades will avenge my death.");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	my $mygrid = $npc->GetGrid();

	if ($mygrid == 27)
		{
		if ($wp % 2)
			{
			quest::SetRunning(0);
			}
		else
			{
			quest::SetRunning(1);
			}
		}
	}
