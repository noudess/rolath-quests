my $alternate=0;

sub EVENT_SPAWN
	{
	quest::SetRunning(1);
	$npc->CastSpell(716, $npc->GetID());
	quest::settimer("selos", 7);
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 0)
		{
		quest::emote("grumbles eww... What's that smell?");
		}
	elsif ($wp == 21)
		{
		quest::shout("Good lord, what is that?  A family member of Batman?");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 31)
		{
		quest::spawn_condition("warrens", 1, 0);
		quest::spawn_condition("stonebrunt", 7, 1);
		}
	}

sub EVENT_TIMER
	{
	if ($alternate == 1)
		{
		$npc->CastSpell(7, $npc->GetID(),-1,1);
		$alternate=0;
		}
	else
		{
		$npc->CastSpell(717, $npc->GetID(),-1,1);
		$alternate=1;
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	# Spawn a corpse
	quest::spawn(101139, 0, 0, $x, $y, $z);
	quest::setanim(101139, 3);
	}

sub EVENT_ATTACK
	{
	quest::shout("Train to Stonebrunt!!");
	}
