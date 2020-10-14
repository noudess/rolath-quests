sub EVENT_SPAWN
	{
	my $mlevel = $npc->GetLevel();
	my $roll = rand();
	my $chance = $mlevel/2000;
	
	if ($roll < $chance)
		{
		quest::addloot(72371,1,0);
		}
	}

sub EVENT_DEATH_COMPLETE {
  my $gnoll = int(rand(100) + 1);
  if ($gnoll <= 10) {
    quest::spawn2(111158,0,0,$x,$y,$z,0);
    my $keyspawn = $entity_list->GetMobByNpcTypeID(111158);
    $keyspawn->AddToHateList($client, 1);
  }
}

# EOF zone: frozenshadow

