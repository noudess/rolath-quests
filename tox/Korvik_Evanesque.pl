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
		quest::say("Why did I give up howling?");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 40)
		{
		quest::say("The pit... of Paineel...");
		quest::spawn_condition("tox", 3, 0);
		quest::spawn_condition("paineel", 1, 1);
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
	quest::shout("Train to Paineel!!");
	}
