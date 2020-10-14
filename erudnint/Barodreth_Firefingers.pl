## Quest for newbie craft keeper armor

sub EVENT_SAY 
	{ 
	my @task_array;

	if ($text=~/hail/i)
		{ 
		quest::say("Greetings, $name. Are you a [young initiate] of the Craft Keepers? If you are then I might have some great news for you. We are currently in the process of training up all new recruits so this might be your lucky day.");
		} 

	if ($text=~/young initiate/i) 
		{ 
		quest::say("Excellent, $name. Many have passed before me and said they wished to be the greatest practicioner of the arcane to ever set foot in these halls. Many of those same people didn't amount to much but I think you are different. If you are I will be happy to get you started. Shall we [begin]?"); 
		} 

	if ($text=~/begin/i) 
		{ 
		quest::say("Fantastic, I will be delighted to get you started. Toxxulia forest is where the majority of your training will be held. There are many [important components] I will need you to [gather] out in the forest and also in town."); 
		} 

	if ($text=~/important components/i) 
		{ 
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("All right then, $name, here is your Craft Keepers Sewing Kit. In this sewing kit you will combine a number of recipes that will be used for creating your Craft Keepers armor. When you are ready to craft a certain armor piece all you must do is tell me which piece you [want] to craft. I will then present you with the component recipe along with the applicable pattern for Craft Keeper [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. When you have completed the material for whatever piece you asked for you will combine it in a sewing kit with the appropriate pattern to fashion your armor piece. Its as easy as that. I suggest though that you attempt your robe last as the components are more difficult then any other piece to collect."); 
			my @task_array;
			push(@task_array, 26);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You have already been blessed");
			}
		} 

	if ($text=~/bracer/i)
		{ 
		quest::say("To create your bracer material you will need to combine one Woven Spider Silk, two Bone Chips, one Fire Beetle Leg and one Red Wine in your assembly kit. Once you have created the proper material, take it to a sewing kit along with this pattern to fashion your very own Bracer of the Craft Keeper."); 
		quest::summonitem(22584); 
		} 

	if ($text=~/cap/i)
		{ 
		quest::say("To create your cap material you will need to combine two Woven Spider Silks, one Rat Ear, one Spiderling Legs and one Short Ale in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Cap of the Craft Keeper."); 
		quest::summonitem(22583); 
		} 

	if ($text=~/gloves/i) 
		{ 
		quest::say("To create your gloves material you will need to combine three Woven Spider Silks, one Rat Whiskers, one Snake Scales and one Bat Wing in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Gloves of the Craft Keeper."); 
		quest::summonitem(22633); 
		} 

	if ($text=~/sandals/i)
		{ 
		quest::say("To create your boot material you will need to combine three Woven Spider Silks, one Kobold Skull, one Snake Fang and one Ration in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sandals of the Craft Keeper."); 
		quest::summonitem(22585); 
		}

	if ($text=~/sleeves/i)
		{ 
		quest::say("To create your armguards material you will need to combine two Woven Spider Silks, one Spider Legs, one Fire Beetle Leg and one Bandage in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sleeves of the Craft Keeper."); 
		quest::summonitem(22631); 
		} 

	if ($text=~/trousers/i) 
		{ 
		quest::say("To create your trousers material you will need to combine four Woven Spider Silks, two Spiderling Silks, one Skunk Scent Gland and one Bottle of Kalish in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Trousers of the Craft Keeper."); 
		quest::summonitem(22632); 
		} 

	if ($text=~/robe/i)
		{ 
		quest::say("To create your robe material you will need to combine five Woven Spider Silks, one Giant Wood Spider Thorax, one Skunk Tail, one Spider Venom, one Fire Beetle Leg and one Giant Rat Tooth in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Robe of the Craft Keeper. Please return to me once you have fashioned your robe for I might have a [final task] for you to complete."); 
		quest::summonitem(22634); 
		} 

	if ($text=~/final task/i)
		{ 
		quest::say("There are a few items that I need for my studies and I was hoping that you could retrieve them for me. If you are willing to [seek out the items] I will be happy to reward you with my personal walking staff once you return."); 
		} 

	if ($text=~/seek out the items/i)
		{ 
		quest::say("Please retrieve one Calcified Ribcage, one Kobold Hide, one Twilight Bloom and one Giant Wood Spider Femur. I will eagerly await your return."); 
		} 
	} 

sub EVENT_ITEM 
	{ 
    if (plugin::check_handin(\%itemcount, 19552 => 1, 19659 => 1, 13424 => 1, 63125 => 1)) 
		{ # New shard & container (was weapon)
		quest::summonitem(1264);
		quest::summonitem(66180);
		quest::say("Very good, $name! However, I find that I still need my walking stick.  In it's stead, please accept this shard and sealer container.  With it you will be able to affix this shard to any weapon you choose to use."); 
		quest::exp(500);
		quest::ding();
		} 

	if (quest::istaskactivityactive(26, 7))
		{
		# Turning in container sets the can't do this again flag.
		if (plugin::check_handin(\%itemcount, 61094 => 1))
			{
			quest::updatetaskactivity(26,7);
			}
		}

	if (quest::istaskactivityactive(26, 14))
		{
		if (plugin::check_handin(\%itemcount, 61157 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,2);
				quest::incstat(1,6);
				quest::incstat(2,6);
				quest::incstat(4,8);
				quest::incstat(6,3);
				if ($class eq "Wizard")
					{
					quest::enabletitle(9); 	# Wizard
					quest::shout2("All Hail $name of the Crimson Hand!."); 
					}
				elsif ($class eq "Magician")
					{
					quest::enabletitle(8); 	#Magician
					quest::shout2("All Hail $name of the Gate Callers!."); 
					}
				elsif ($class eq "Enchanter")
					{
					quest::enabletitle(7);		# Enchanter
					quest::shout2("All Hail $name of the Gate Callers!."); 
					}
				quest::updatetaskactivity(26,14);
				}
			else
				{
				quest::summonitem(61157);
				}
			} 
		}
	} 

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem(61094); 
    quest::setglobal($varname,1,5,"F");
	}
#END of FILE Zone:erudnint  ID:23076 -- Barodreth Firefingers 
