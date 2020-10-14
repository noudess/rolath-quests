sub EVENT_DEATH_COMPLETE
	{
    foreach $pc ($entity_list->GetClientList())
        {
        if ($pc->GetID() == $killer_id)
            {
			quest::unique_spawn(18110, 1, 0, -181, 606, 4.19, 0);
			quest::signalwith(18110, $killer_id, 10);
            }
        }
	}
