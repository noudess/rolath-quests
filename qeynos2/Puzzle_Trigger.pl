sub EVENT_ITEM
	{
	$a=$itemcount{2584};
	$b=$itemcount{2585};
	$c=$itemcount{2586};
	if ($itemcount{2584} == 1 ||
		$itemcount{2585} == 1 ||
		$itemcount{2586} == 1)
		{
		if (plugin::check_handin(\%itemcount, 2584 => 1))
			{
			quest::summonitem(2587); 
			}
		elsif (plugin::check_handin(\%itemcount, 2585 => 1)) 
			{
			quest::summonitem(2588); 
			}
		elsif (plugin::check_handin(\%itemcount, 2586 => 1)) 
			{
			quest::summonitem(2589); 
			}

		my $tile = $npc->GetNPCTypeID() - 2200;
		quest::signalwith(2052, $tile);
		}
 	plugin::return_items(\%itemcount);
	}
