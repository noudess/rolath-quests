sub EVENT_SPAWN
	{
	if($entity_list->GetNPCByNPCTypeID(13113))
		{
		quest::settimer("die",1);
		}	
	}

sub EVENT_TIMER
	{
	quest::stoptimer("die");
	$npc->Depop(0);
	}
