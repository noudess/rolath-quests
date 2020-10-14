sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::say("Why you bodder me?  Go kills da froggies and udders in sa swamps and mebbie I gives you [charm] if you kills gud!"); 

		if (quest::istaskactive(103))
			{
			my $count=0;
			my $bonus=0;

			$count = $client->GetTaskActivityDoneCount(103, 5);
			$item=211;
			$varname = "NB-$item-$charid";
			if ($count != $qglobals{$varname})
				{
				quest::setglobal($varname,$count,5,"F");
				$bonus=1;
				}

			$count = $client->GetTaskActivityDoneCount(103, 6);
			$item=212;
			$varname = "NB-$item-$charid";
			if ($count != $qglobals{$varname})
				{
				quest::setglobal($varname,$count,5,"F");
				$bonus=1;
				}

			if ($bonus > 0)
				{
				quest::say("Yuz dun alot.  I see da charm glow more now!");
				}
			}
		}

	if ($text=~/charm/i)
		{
		if ($class=~/Beastlord/i)
			{
			quest::say("Yes, I gives you da charm and you go kill gud.  I wants you to kill da invading froggies and brings me der partses.  Kills dem nasty elves and humans too, dey tinks dey bedder den us, we shows dem!  Da bedder yuz kills and brings me da froggie tings I wants, da bedder da charm be."); 
			quest::say("Yuz check in sumtims and me see how charm wurkin.");
			$varname="Blessed$charid";
			if (!defined($qglobals{$varname}) && !quest::istaskactive(103))
				{
				# Give the task
				my @task_array;
				push(@task_array, 103);
				quest::taskselector(@task_array);
				}
			else
				{
				quest::say("You are already blessed.");
				}
			}
		else
			{
			quest::say("You not a beastie boy, you go away or I has Carver Cagrek serve you up for diner tonite!"); 
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($item1 == "18845")
		{
		quest::say("You fight like alligator and tear enemy limb from limb! Wear tunic that smell of swamp an devour enemy wit brodder Dark Ones! You go see Gargh now. He got work for you!");
		quest::summonitem("13576");
		#Factions verified on live
		quest::faction(237, 15);#Dark Ones
		quest::faction(308, 3);	#Shadowknights of Night Keep
		quest::faction(251, -2);#Frogluks of Guk
		quest::exp("100"); 
		quest::ding();
		}
	else
		{
		$bonus=0;

		if (quest::istaskactivityactive(103,7)) # Undead Frog Toungue
			{
			$item=16532;
			if ($itemcount{16532} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(103, 7, $itemcount{16532});
				}
			}

		if (quest::istaskactivityactive(103,8)) # Froglok Meat
			{
			$item=13409;
			if ($itemcount{13409} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(103, 8, $itemcount{13409});
				}
			}

		if (quest::istaskactivityactive(103,9)) # Froglok Blood
			{
			$item=22524;
			if ($itemcount{22524} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(5, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(103, 9, $itemcount{22524});
				}
			}

		if (quest::istaskactivityactive(103,10)) # Froglok Tadpole Flesh
			{
			$item=13187;
			if ($itemcount{13187} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(20, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(103, 10, $itemcount{13187});
				}
			}

		if (quest::istaskactivityactive(103,11)) # Froglok Tadpole Eye
			{
			$item=13186;
			if ($itemcount{13186} > 0)
				{
				$varname = "NB-$item-$charid";
				$bonus = $qglobals{$varname} + ($itemcount{$item});
				$bonus = plugin::min2(10, $bonus);
				quest::setglobal($varname,$bonus,5,"F");
				quest::updatetaskactivity(103, 11, $itemcount{13186});
				}
			}

		if ($bonus > 0)
			{
			quest::say("You dun gud, yuz charm must be glowin!");
			}
		}
	}

sub EVENT_TASKACCEPTED
    {
    $varname="Blessed$charid";
    quest::summonitem(13);          # The progressive charm
    quest::setglobal($varname,1,5,"F");
    quest::setglobal("NB-16532-$charid",0,5,"F");
    quest::setglobal("NB-13409-$charid",0,5,"F");
    quest::setglobal("NB-22524-$charid",0,5,"F");
    quest::setglobal("NB-13187-$charid",0,5,"F");
    quest::setglobal("NB-13186-$charid",0,5,"F");
    quest::setglobal("NB-211-$charid",0,5,"F");
    quest::setglobal("NB-212-$charid",0,5,"F");
    }

#END of FILE Zone:grobb  ID:6084 -- Gardunk 

