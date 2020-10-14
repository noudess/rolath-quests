sub EVENT_SPAWN
	{
	my $spore = quest::ChooseRandom(0,1);
	my $whichcon = abs($x);

	quest::spawn_condition("innothule", $whichcon, $spore);
	}
