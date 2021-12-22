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
