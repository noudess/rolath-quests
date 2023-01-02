sub EVENT_SPAWN
	{
	my $gender = plugin::RandomRange(0,1);
	$npc->SetGender($gender);
	$npc->RandomizeFeatures(1, 1);
	quest::settimer("die", 70);
	}

sub EVENT_TIMER
	{
	quest::depop();
	}
