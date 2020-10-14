sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::setnexthpevent(30);
		}
	}

sub EVENT_HP
	{
	quest::emote("begins to cast shrapnel");

	my @hatelist = $npc->GetHateList();
	@hatelist = sort {$b->GetHate() <=> $a->GetHate()} @hatelist;
	foreach $ent (@hatelist)
		{
		if($ent)
			{
			my $h_ent = $ent->GetEnt();
			if($h_ent)
				{
				my $ent_name = $h_ent->GetCleanName();
				quest::shout("$ent_name your will is mine to control.");
				$npc->CastSpell(4188, $h_ent->GetID(), 10, 0);
				last;
				}
			}
		}
	}
