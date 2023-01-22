sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Glad to meet you. Our Cargo Clockwork is marvelous, no?");
		}
	}

sub EVENT_SIGNAL
	{
    my $c = $entity_list->GetClientByCharID($signal);
    quest::attack($c->GetName());
	}
