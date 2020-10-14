my $type;

sub EVENT_SPAWN
	{
	$npc->SetEntityVariable("spells", 0);
	$npc->SetEntityVariable("oktocast", 1);
	$npc->SetEntityVariable("spells", $npc->GetNPCSpellsID());
	$type = $npc->GetClass();
	if ($type == 2 || $type == 21 || $type == 3 || $type == 22)
		{
		quest::set_proximity($x-20, $x+20, $y-20, $y+20);
		}
	}

sub EVENT_ENTER
	{
	if ($faction < 2 && $npc->GetEntityVariable("oktocast") == 1)
		{
		if ($type == 2 || $type == 21)
			{
			CLERIC_BUFFS();
			}
		else
			{
			PALADIN_BUFFS();
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


sub EVENT_DEATH_COMPLETE
	{
	if ($mname =~ /Sentinel/)
		{
		quest::shout("Pop elemental");
		quest::spawn2(24309,0,0,$x,$y,$z,$h);
		}
	}

sub CLERIC_BUFFS
	{
	quest::say("Blessings $name.");
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
	}

sub PALADIN_BUFFS
	{
	if (!$client->FindBuff(19) && $npc->GetLevel() >= 48)
		{
		quest::say("Much respect,  $name.");
		quest::selfcast(19);
		}
	elsif (!$client->FindBuff(19) && !$client->FindBuff(89) && $npc->GetLevel() >= 37)
		{
		quest::say("Stand tallest,  $name.");
		quest::selfcast(89);
		}
	elsif (!$client->FindBuff(20) && !$client->FindBuff(19) && !$client->FindBuff(89) && !$client->FindBuff(368) && !$client->FindBuff(18) && !$client->FindBuff(654) && $npc->GetLevel() >= 30)
		{
		quest::say("Stand taller,  $name.");
		quest::selfcast(368);
		}
	elsif (!$client->FindBuff(20) && !$client->FindBuff(19) && !$client->FindBuff(89) && !$client->FindBuff(368) && !$client->FindBuff(11) && !$client->FindBuff(18) && !$client->FindBuff(654))
		{
		quest::say("Stand tall,  $name.");
		quest::selfcast(11);
		}
	}
