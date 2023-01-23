sub EVENT_SIGNAL
	{
    my $c = $entity_list->GetClientByCharID($signal);
    quest::attack($c->GetName());
	}
