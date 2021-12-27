my $taskid=121;
my $containerid=17365;
my $robeid=27508;
my $titleid=86;
my $pre="Scout";
my $fix="of Tunare";

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings to you $name. I welcome you to the Scouts of Tunare training halls. I have seen many scouts pass through my halls with unimaginable abilities and daggers guided by Tunare herself. I cannot say for certain what the future has in store for you. But I can say that wherever your adventures may take you it is always wise to have the proper [training].");
		}
	if ($text =~ /training/i)
		{
		quest::say("The training that I speak of is only intended for rogues of Tunare that wish to develop skills that will mold them into the most deadly assassins in all of the lands. If you are a [rogue of Tunare] then I will be happy to explain the training exercises to you. However. if you are not a rogue I suggest you seek training from another house.");
		}
	if ($text =~ /rogue of tunare/i)
		{
		quest::say("Excellent $name, let us get started then. Your training will test your fighting and gathering skills respectively. because of the items you will be required to gather all over the Faydark for [magical armor materials].");
		}
	if ($text =~ /magical armor materials/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("First things first. here is your Assassins Mail Assembly Kit. Inside this kit you will combine different magical items. which in certain quantities in your mail kit can create armor materials for specific pieces of Tunarean Scouts Armor. Once you have completed a specific armor material you can then place it in a forge with the applicable pattern to create your piece of armor.  Simply tell me what armor piece you [want] to craft and I can provide you with the material recipes and armor patterns for [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if ($text =~ /coifs/i)
		{
		quest::say("To create your coif material you will need to combine 2 Bricks of Crude Bronze. 1 Pixie Wing . 1 Ruined Wolf Pelt and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Coif of the Tunarean Scout.");
		quest::summonitem("22671");
		}
	if ($text =~ /bracers/i)
		{
		quest::say("To create your bracer material you will need to combine 1 Brick of Crude Bronze. 2 Wasp Wings. 1 Faerie Wing and 1 Cask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Tunarean Scout.");
		quest::summonitem("22672");
		}
	if ($text =~ /sleeves/i)
		{
		quest::say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze. 1 Fairy Dust and 1 Royal Jelly and 1 Elven Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sleeves of the Tunarean Scout.");
		quest::summonitem("22673");
		}
	if ($text =~ /boots/i)
		{
		quest::say("To create your boots material you will need to combine 3 Bricks of Crude Bronze. 1 Basilisk Hatchling Hide. 1 Orc Hatchet and 1 Bottle of Milk in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Tunarean Scout.");
		quest::summonitem("22674");
		}
	if ($text =~ /legplates/i)
		{
		quest::say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze. 2 Orc Eyes. 1 Orc Scalp and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Legplates of the Tunarean Scout.");
		quest::summonitem("22675");
		}
	if ($text =~ /gauntlets/i)
		{
		quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze. 1 Orc Head. 1 Orc Skull . and 2 Bat Wings in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Tunarean Scout.");
		quest::summonitem("22676");
		}
	if ($text =~ /tunics/i)
		{
		quest::say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze. 1 Coyote Skull. 1 Orc Ribcage. 1 Pristine Forest Drakeling Scale. 1 Crushbone Shoulderpads and 1 Golden Bandit Tooth in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Tunic of the Tunarean Scout. Please return to me after you have completed your tunic. for I have one final [favor] to ask of you.");
		quest::summonitem("22677");
		}
	if ($text =~ /what favor/i)
		{
		quest::say("I have recently been trying my hand at weaponcrafting and I can say that it is going quite well. Before I can practice my skills however I need some [specific items] that will enable me to begin crafting daggers for our young scouts like yourself that have completed the training exercises.");
		}
	if ($text =~ /specific items/i)
		{
		quest::say("In order to craft some more daggers I am in need of 1 Preserved Orc Hide and 2 Rotting Orc Teeth. You can most likely find these items on the vile orcs that inhabit the Faydark and Clan Crushbone of course. Bring me these items and I will reward you.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 27535 => 1, 27536 => 2))  #Preserved Orc Hide and 2 Rotting Orc Tooth
		{
		quest::say("These are the final supplies I need to finish this training dagger I have been working on. I am very proud of the progress that you have made and I am happy to present you with this shard of Rolath.  I wish you good luck in your future adventures $name, you have made me quite proud.");
        quest::summonitem(1266);
		#Faction per ZAM
		quest::faction(316, 5); #Tunare's Scouts
		#Give 8% exp up to level 10
		$client->AddLevelBasedExp(8,10);
		quest::ding();
		}

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
				quest::incstat(1,5); 	# STA
				quest::incstat(2,3);	# AGI
				quest::incstat(3,6);	# DEX
				quest::incstat(6,3);	# CHA
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

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

