my $taskid=109;
my $containerid=55492;
my $robeid=55477;
my $titleid=75;
my $pre="Wrathbringer";
my $fix="of the Earth";

sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{
		quest::emote("scratches her beard.");
		quest::say("What do we have here? A young [berserker] perhaps seeking fame and glory?");
		}
	if($text=~/berserker/i)
		{
		quest::say("To be honest, I do not think that fame and glory will become yours so soon, but I can instruct you on how to make a helpful set of armor if you are [interested].");
		}
	if($text=~/interested/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Take this assembly kit. With this kit, you will be able to combine the various components necessary to make your armor. I can instruct you on how to make [boots], [bracer], [coif], [gloves], [gorget], [leggings], or a [tunic]. I suggest you wait to make the tunic last, as it is the most difficult item to construct.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if($text=~/boots/i)
		{
		quest::say("To make Stonewrath boots, you must obtain two small pieces of ore, one aviak eye, and one pristine skunk claws. You should able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Boots Material to a forge along with this mold to create your new boots.");
		# Summon: Stonewrath Boots Mold
		quest::summonitem(55488);
		}
	if($text=~/bracer/i)
		{
		quest::say("To make a Stonewrath Bracer, you must obtain one small piece of ore, one bat wing, and two bone chips. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in you assembly kit, take the Stonewrath Bracer Material to a forge along with this mold to create your new bracer.");
		# Summon: Stonewrath Bracer Mold
		quest::summonitem(55486);
		}
	if($text=~/coif/i)
		{
		quest::say("To make a Stonewrath Coif, you must obtain two small pieces of ore, one goblin brain, one bone chips, and one giant bat wing. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Coif Material to a forge along with this mold to create your new coif.");
		# Summon: Stonewrath Coif Mold
		quest::summonitem(55485);
		}
	if($text=~/gloves/i)
		{
		quest::say("To make Stonewrath Gloves, you must obtain one small piece of ore, one aviak eye, and two bone chips. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Gloves Material to a forge along with this mold to create your new gloves.");
		# Summon: Stonewrath Gloves Mold
		quest::summonitem(55490);
		}
	if($text=~/gorget/i)
		{
		quest::say("To make a Stonewrath Gorget, you must obtain one small piece of ore, one bat wing, two bone chips, and one skunk tail. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Gorget Material to a forge along with this mold to create your new gorget.");
		# Summon: Stonewrath Gorget Mold
		quest::summonitem(55487);
		}
	if($text=~/leggings/i)
		{
		quest::say("To make Stonewrath Leggings, you must obtain two small pieces of ore, one RunnyEye warbeads, and one spiderling silk. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Leggings Material to a forge along with this mold to create your new leggings.");
		# Summon: Stonewrath Leggings Mold
		quest::summonitem(55489);
		}
	if($text=~/tunic/i)
		{
		quest::say("To make a Stonewrath Tunic, you must obtain two small pieces of ore, two goblin brains, one giant bat fur, and one snake fang. You should be able to find the animal parts in the Butcherblock Mountains and the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Stonewrath Tunic Material to a forge along with this mold to create your new tunic. Once you have made your tunic, return to me and I may have another [task] for you to complete.");
		# Summon: Stonewrath Tunic Mold
		quest::summonitem(55491);
		}
	if($text=~/task/i)
		{
		quest::say("Venture to the nearby Dagnor's Cauldron and find four scalded rat skins. Once you have these items, return to me and I will reward you.");
		}
	}

sub EVENT_ITEM 
	{
	if (quest::istaskactivityactive($taskid, 7))
		{
		if (plugin::check_handin(\%itemcount, $containerid => 1))
			{
			quest::updatetaskactivity($taskid,7);
			}
		}

	if (quest::istaskactivityactive($taskid, 14))
		{
		if (plugin::check_handin(\%itemcount, $robeid => 1))
			{ # robe is last step
			if (!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,5); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,8);	# AGI
				quest::incstat(3,3);	# DEX
				quest::enabletitle($titleid);
				quest::shout2("All Hail $pre $name $fix!"); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem($robeid);
				}
			} 
		}

	# Handin: Scalded Rat Skins
	if($class eq "Berserker" && plugin::check_handin(\%itemcount, 55470 => 4))
		{
		quest::say("I see you have embraced the rage burning from within and have accomplished your task.");
		quest::summonitem(1266);
		}
	
    plugin::try_tome_handins( \%itemcount, $class, 'Paladin' );
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
