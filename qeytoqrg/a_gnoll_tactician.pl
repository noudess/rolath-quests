sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		quest::shout("Guards!  Guards!  Slay Infidel $name!!!");
		quest::setglobal("tactician_agro", $name, 3, "S10");
		quest::signal(17009, $name);
		quest::signal(17010, $name);
		quest::signal(17012, $name);
		quest::signal(17016, $name);
		quest::signal(17031, $name);
		quest::signal(17039, $name);
		}
	}
