sub EVENT_SPAWN
	{
	$npc->SetEntityVariable("spells", 0);
	$npc->SetEntityVariable("oktocast", 1);
	$npc->SetEntityVariable("spells", $npc->GetNPCSpellsID());
	if ($npc->GetClass() == 2 || $npc->GetClass() == 21)
		{
		quest::set_proximity($x-20, $x+20, $y-20, $y+20);
		}
	}

sub EVENT_ENTER
	{
	if ($faction < 2 && $npc->GetEntityVariable("oktocast") == 1)
		{
		quest::say("Where have you been?  Don't you know we're at war?  Well, stop a moment and let me get you prepared.  Stand still fool.");
		if ($npc->GetLevel() >= 50)
			{
			quest::selfcast(488);
			}
		elsif ($npc->GetLevel() >= 34)
			{
			quest::selfcast(487);
			}
		elsif ($npc->GetLevel() >= 24)
			{
			quest::selfcast(486);
			}
		else
			{
			quest::selfcast(485);
			}
		$npc->SetEntityVariable("oktocast", 0);
		quest::settimer("recast", 120);
		}	
	}

sub EVENT_TIMER
	{
	$npc->SetEntityVariable("oktocast", 1);
	quest::stoptimer("recast");
	}
