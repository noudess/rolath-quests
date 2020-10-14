# Putrid skeleton in SK.
# Only the PH for dwarf skeleton has a chance of dwarf bones.

sub EVENT_SPAWN
	{
	my $roll=rand(100);
	if ($x == 1082)
		{
		if ($roll <= 20)
			{
			quest::addloot(13332, 1);
			}
		else
			{
			quest::say("no bones for you");
			}
		}
	elsif ($x == 1172)
		{
		my $date = localtime;
		if ($roll <=12)
			{
			my $day=quest::get_spawn_condition("southkarana", 2);
			if ($day == 1)
				{
				quest::spawn_condition("southkarana", 5, 1);
				}
			else
				{
				quest::spawn_condition("southkarana", 6, 1);
				}

			# Despawn PH by clearing his condition.
			# Is re-enabled by zone controller
			quest::settimer("die", 1);
			}	
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("die");
	quest::spawn_condition("southkarana", 7, 0);
	}

sub EVENT_COMBAT
	{
	if ($x == 1067 && $combat_state == 1)
		{
		quest::say("Come and join Barger.");
		}
	}
