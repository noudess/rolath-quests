sub EVENT_SAY
	{
	quest::say("Mob List");
	quest::say("======================================================");
	my @moblist = $entity_list->GetClientList();
	my $mcount=0;
	foreach $mobby (@moblist)
		{
		my $mname = $mobby->GetName();
		$mcount = $mcount +1;
		quest::say("$mname");
		}
	quest::say("Total mobs: $mcount");
	}
