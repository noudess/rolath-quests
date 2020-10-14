sub EVENT_SPAWN {
    quest::settimer("check_prox", 5);
    }

sub EVENT_TIMER 
	{
	my $mob_check;
	my $mobX;
	my $mobY;
	my $mobZ;
	my $npc_dist;

    if($timer eq "check_prox")
		{
        my @n_list = $entity_list->GetNPCList();
        foreach my $n (@n_list)
			{
			$mobX = int($n->GetX());
			$mobY = int($n->GetY());
			$mobZ = int($n->GetZ());

			# get distance from npc
			$npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

            if($npc_dist <= 50)
				{
                $npc->Attack($n);
            	}
        	}
    	}
	}
