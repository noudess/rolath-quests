my $NPCRace;

sub EVENT_SPAWN
	{
	my $gender = plugin::RandomRange(0,1);
	$npc->SetGender($gender);
	$npc->RandomizeFeatures(1, 1);
	}

sub EVENT_DEATH_COMPLETE
	{
	# Spawn a blazing elemental
	quest::spawn2(80040,0,0,$x,$y,$z,$h);
	}
