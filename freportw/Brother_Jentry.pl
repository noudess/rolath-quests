sub EVENT_SIGNAL
	{
	my $victim = $entity_list->GetClientByCharID($signal);
	my $vname = $victim->GetCleanName();
	quest::attack($vname);
	}
