sub EVENT_DEATH_COMPLETE
	{
	if ($qglobals{"gnoll_counter"} < 100)
		{
		quest::setglobal("gnoll_counter",  ($qglobals{"gnoll_counter"} +1), 3, "F");
		}
	else
		{
		quest::setglobal("gnoll_counter", 0, 3,"F");
		quest::spawn2(4196, 98, 0, -1154 , 3412 , 3.75 ,0);
		}
	}
