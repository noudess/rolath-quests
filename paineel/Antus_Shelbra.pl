sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Greetings, $name. You have come to me searching for tasks and tasks I have. Would you judge yourself an [experienced heretic] or one who has [much to learn]?");
		}
	if($text=~/much to learn/i) 
		{
		quest::say("Very well, $name. I do have a task for you. There is an old and frail Erudite male who now lives in Toxxulia named Aglthin Dasmore. He has left the ways of Cazic-Thule and no longer practices our craft. He has been stripped of his power and wealth, so he spends his time fishing by the river. Our great Lord of Fear has decreed that his life is forfeit. Slay him, and bring me proof of the deed.");
		}
	if($text=~/experienced heretic/i) 
		{
		if($faction <=5)
			{
			quest::say("Ah. Excellent. I have just the task for you, $name. In Kerra Ridge, there is a particular cat named Kirran Mirrah that we have been using to gather information about, well, certain aspects of cat society. He is no longer providing information for us and we have something for him that may encourage him to assist again. Ha! Hand him this sealed bag for us. It may just change his point of view. Hahaha!");
			quest::summonitem(9968); #Smelly Sealed Bag
			}
        else
            {
            plugin::reject_say();
            }
		}

	if (quest::istaskcompleted(74) && !quest::istaskcompleted(105))
		{
		if ($text=~/betrayal/i)
			{
			quest::say("So, only when summoned do you have the intestines to look into my eyes.. this disgusts me.  I can see only one [way] for me to allow you to remain in my service.");
			}

		if ($text=~/way/i)
			{
			quest::say("I require you to kill, disembowel, and bring me the heads of any of the criminals that have slain our dogs.  Nothing short of that will allow me in good conscience to allow you to remain in our city.");
			if(!quest::istaskactive(105))
				{
				quest::assigntask(105);
				}
			}
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 9969 => 1)) #Aglthin's Fishing Pole
		{
		quest::say("Excellent, $name. You have proven yourself to be a true follower of Cazic-Thule. Continue on the path you have chosen, and you will surely become one of the mightiest in the land");
		#faction verified on ZAM
		quest::summonitem(13697); #Staff of the Abattoir Initiate
		quest::faction(265,3);  #Heretics
		quest::faction(254,-3); #Gate Callers
		quest::faction(242,-3);  #Deepwater Knights
		quest::faction(231,-3);  #Craftkeepers
		quest::faction(233,-3);  #Crimson Hands
		quest::givecash(5,4,6);
		quest::exp(1000);
		quest::ding();
		}

	elsif($faction <= 5 && plugin::check_handin(\%itemcount, 9967 => 1)) #Karran's Head
		{
		quest::say("Ah, it seems as if he was not a very cooperative kitty. So much for family. Oh well, take this token change as a show of my appreciation. Cazic-Thule shines on you in all his glorious fear this day, young one.");
		#factions verified on live
		quest::faction(265,5);  #Heretics
		quest::faction(254,-5); #Gate Callers
		quest::faction(242,-5);  #Deepwater Knights
		quest::faction(231,-5);  #Craftkeepers
		quest::faction(233,-5);  #Crimson Hands
		quest::givecash(5,4,6,1);
		quest::exp(1000);
		quest::ding();
		}
	}
#END of FILE Zone:paineel  ID:75089 -- Antus_Shelbra
