sub EVENT_SAY 
	{ 
	my @task_array;

	if($text=~/Hail/i)
		{
		plugin::Autovtell("greet");
		quest::say("Greetings, $name.  Are you busy this day or [looking for something] to do?");
		}

	if($text=~/looking for something/i)
		{
		quest::say("Excellent!  There has been a great deal of speculation about the incursion of undead into these fine hills.  Would you be willing to look into this?");
		}

	if($text=~/am willing/i)
		{
		quest::say("If you are trusted by the Priest of Life, perhaps they will let you help.");
		push(@task_array,55);
		quest::taskselector(@task_array);
		}
	}
