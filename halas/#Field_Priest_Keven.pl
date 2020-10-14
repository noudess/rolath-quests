#File: halas/#Field_Priest_Keven.pl
#Quest: Guild master
#Note: Completed and tested on April 17, 2010 by mrhodes
#Newbie charm that grows in power.

sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::emote("turns towards you.");
		quest::say("There you are. I have been waiting for you. Are you ready to begin your training? With my help you will be able to command a great beast to become your most trusted companion. Read the note in your inventory and hand it to me when you are ready to begin your training.");
		}
	if ($text=~/charm/i)
		{
		quest::say("Yes, the charm of teh white wolf.  The magic within this talisman tracks your service to the natural animals of Norrath.  As you continue to [serve the animals], the charm will grow in power.");
		}
	if ($text=~/serve the animals/i)
		{
		quest::say("You must cleanse Norrath and relieve the pain of animals in distress.  There are beasts that have become diseased, or in other ways tainted that can not be cured.  It is better to humanely put these animals down so that they do not further infect their healthy kin.");
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}) && !quest::istaskactive(65))
			{
			# Give the task
			my @task_array;
			push(@task_array, 65);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($item1==18847)      # Tattered note
		{
		quest::say("Welcome $name! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! I also have a [charm] for you to wear that will grow as you [serve the animals] of Norrath.  Talk to my friend Hoyce and he can get you started.");
		# Verified
		quest::faction(327, 15);   # Shamen of Justice
		quest::faction(328, 2);   # Merchants of Halas
		quest::faction(223, -2);   # Circle Of Unseen Hands
		quest::faction(336, -2);   # Coalition of Tradefolk Underground
		quest::faction(244, -3);   # Ebon Mask
		quest::summonitem("13574");   # Soiled Gray Tunic
		quest::exp("30");        # Give exp for turning in quest
		quest::ding();
		}
	else
		{
		$bonus=0;

		if (quest::istaskactivityactive(65,8)) # Tundra
			{
			$item=20690;
			if ($itemcount{20690} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(1, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 8, $itemcount{20690});
				}
			}

		if (quest::istaskactivityactive(65,9)) # Poacher Heads
			{
			$item=13825;
			if ($itemcount{13825} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 9, $itemcount{13825});
				}
			}

		if (quest::istaskactivityactive(65,10)) # Barbarian Head (Talyn)
			{
			$item=13913;
			if ($itemcount{13913} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(1, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 10, $itemcount{13913});
				}
			}

		if (quest::istaskactivityactive(65,11)) # Gnoll Head (Gnoll Poacher)
			{
			$item=13813;
			if ($itemcount{13813} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(1, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 11, $itemcount{13813});
				}
			}

		if (quest::istaskactivityactive(65,12)) # Infected Rat Livers
			{
			$item=13270;
			if ($itemcount{13270} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 12, $itemcount{13270});
				}
			}

		if (quest::istaskactivityactive(65,13)) # Shark Skin (lore)
			{
			$item=13875;
			if ($itemcount{13875} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(1, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 13, $itemcount{13875});
				}
			}

		if (quest::istaskactivityactive(65,14)) # Diseased Wolf Pelt
			{
			$item=13949;
			if ($itemcount{13949} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 14, $itemcount{13949});
				}
			}

		if (quest::istaskactivityactive(65,15)) # Putrid Bear hide
			{
			$item=13298;
			if ($itemcount{13298} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(65, 15, $itemcount{13298});
				}
			}
	
		if ($bonus > 0)
			{
			quest::say("Well done!  Your charm grows in power for every beast you cleanse, while this task remains active.");
			}
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem(12);			# The progressive charm
    quest::setglobal($varname,1,5,"F");
    quest::setglobal("NB-20690-$charid",0,5,"F");
    quest::setglobal("NB-13825-$charid",0,5,"F");
    quest::setglobal("NB-13913-$charid",0,5,"F");
    quest::setglobal("NB-13813-$charid",0,5,"F");
    quest::setglobal("NB-13270-$charid",0,5,"F");
    quest::setglobal("NB-13875-$charid",0,5,"F");
    quest::setglobal("NB-13949-$charid",0,5,"F");
    quest::setglobal("NB-13298-$charid",0,5,"F");
	}

#END of FILE Zone:qeynos  ID:1138 -- Ebon_Strongbear
