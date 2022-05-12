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

sub EVENT_ITEM {
	#:: Match item 18901 - Ragged Cloth Note
	if (plugin::takeItems(18901 => 1)) {
		quest::say("I.. but.. she.. You can take this. I guess I don't need it any more.");
		#:: Ding!
		quest::ding();
		#:: Give a large amound of experience
		quest::exp(30000);
		#:: Give item 14640 - Silver Amber Ring
		quest::summonitem(14640);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
