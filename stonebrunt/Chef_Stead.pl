sub EVENT_SPAWN
	{
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}

sub EVENT_ENTER
	{
	$client->Message(15, "Chef Stead looks depressed");
	}

sub EVENT_SAY
	{
	my @task_array;

	if ($text =~ /hail/i)
		{
		if (quest::istaskactivityactive(106,14))
			{
			quest::say("That was amazing work, $name.  Nipper will not be able to pick on me for being out ofhis beast's favorite meats now!");
			quest::faction(473, 75);
			quest::updatetaskactivity(106,14);
			}
		else
			{
			quest::say("Why hello $name, how are you today?  It's nice to see a smiling face!  Jade has been grumpy as of late.  Who am I kidding, she's always grumpy.  I may join her soon, Nipper is keeping me very busy.  I can barely keep the town fed anymore, due to his [demand].");
			}
		}
	if ($text =~/demand/i)
		{
		quest::say("Yeah, his feline mounts seem insatiable.  It's hard for me to keep them fed, and still have food for ourselves.  We sure could use a new [supply] of meat.");
		}
	if ($text =~/supply/i)
		{
		quest::say("Our supply is running very low.  We need a great many meats to keep ourselves fed, and Nipper demands a exotic mix for his steeds...  Hey, maybe you would be willing to help?");
		}
	if ($text =~/willing to help/i)
		{
		if ($faction < 6)
			{
			quest::say("Outstanding, soldier!  Get back to me when you have completed this task.");
			push(@task_array,106);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::emote("considers you carefully.");
			quest::say("I fear we cannot yet trust you with such an important task as our food supply");
			quest::say("Purrrhaps spend some time talking to Aderius or doing work for our new postman, Korvik.");
			}
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("I have plenty made up, Nipper.  Many have come in from the hunt with frrrresh meats.");
	quest::settimer("giblets", 15);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("giblets");
	quest::say("Here you are, all warmed up and ready to serve.");
	quest::signalwith(100236,1,100);
	}
