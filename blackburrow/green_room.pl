sub EVENT_SPAWN
	{
	# If we spawn and we're in the green room, then clear the spawn condition 
	# that enables a 5th mob
	$npc->SetEntityVariable("greenroom", 0);
	$myx{$mobid} = $npc->GetX();
	$myy{$mobid} = $npc->GetY();

	if (($myx{$mobid} == -115 && $myy{$mobid} == 292) || 
		($myx{$mobid} == -130 && $myy{$mobid} == 262))
		{
		$npc->SetEntityVariable("greenroom", $mobid);
		quest::signalwith(10,100); # Tell zone controller
		}
	}

sub EVENT_DEATH
	{
	if ($npc->GetEntityVariable("greenroom"))
		{
		quest::signalwith(10,200); # Tell zone controller
		}
	return 0;
	}
