sub EVENT_SIGNAL
	{
	#:: Match a signal '1' from steamfont/Cargo_Clockwork.pl
	if ($signal == 1)
		{
		#:: Pull a list of clients from the entity list
		my @ClientList = $entity_list->GetClientList();

		#:: Match if the ClientList is not empty
		if (scalar @ClientList > 0)
			{
			quest::say("Hmm. Sounds like the weekly shipment has arrived. I'd better go grab it.");

			}
		}
	}

sub EVENT_ITEM
	{
	#:: Return unused items
	plugin::returnUnusedItems();
	}
