sub EVENT_SAY 
{   
	my @task_array;

	if ($text=~ /Hail/i)
		{
		if (quest::istaskactive(25))
			{
			quest::say("Welcome back, $name.  Do you have an [update] for me, or are you looking for another [task]?");
			}
		else
			{
			quest::say("I look out upon the forest and I wonder why I've let myself stay in this forsaken place. Though we have explored the edges of Odus, I don't know if even I have what it takes to put my abilities to [task] any longer. Perhaps you could in my stead?");  
			}
		}

	if ($text=~/task/i)
		{
		quest::say("I should really do my [rounds], or there is the matter of the rumors about that [smuggling] case to look into.");
		}

	if ($text=~/update/i)
		{
		quest::say("Excellent!  What have you learned?");
		}

	if ($text=~/Vasty Deep/i)
		{
		quest::say("I know that Vasty Deep water is rumored to be part of the creaton of a magical brew.  Maybe you can learn more about where the water comes from by talking to the proprietor of a local pub?");
		quest::updatetaskactivity(25,3,1);
		}

    if ($text=~/rounds/i)
		{
		quest::say("Very well, take a look about for me then?");
		push(@task_array, 24);
		quest::taskselector(@task_array);
		}

    if ($text=~/smuggling/i)
		{
		quest::say("The rumors are alarming if true, but I personally think it is hogwash.");
		quest::say("The man put to death for the smuggling of vasty deep water is said by some to be alive.  His name was Moodoro.  Start by talking to Tol Nicelot in Erudin.  He seems to be one of the men talking about this.");
		push(@task_array, 25);
		quest::taskselector(@task_array);
		}
}

#END of FILE
