sub EVENT_SPAWN
	{
	my $gender = plugin::RandomRange(0,1);
	$npc->SetGender($gender);
	$npc->RandomizeFeatures(1, 1);

	# Dark Elf Parts
	my $roll = plugin::RandomRange(1,100);
	if ($roll <= 10)
		{
		quest::addloot(13422, 1, 1);
		}
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::say("Time to die $name!");
		$msgno = plugin::RandomRange(1,4);
		if ($msgno == 1)
			{
			quest::say("It's $race" . "s like you who have ruined your own lands.  You'll not ruin mine!");
			}
		elsif ($msgno == 2)
			{
			quest::say("Filthy $race" . "s like you must die!");
			}
		elsif ($msgno == 3)
			{
			quest::say("$race" . "s like you are better left dead than alive!");
			}
		elsif ($msgno == 4)
			{
			quest::say("$race" . "s have no place in our realm!");
			}
		}
	}
