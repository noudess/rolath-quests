my $taskid=120;
my $containerid=17367;
my $robeid=27515;
my $titleid=85;
my $pre="Trueshot";
my $fix="";

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("It is a pleasure to meet you $name, I am Samatansyn Flamecaller, Warder of Tunare and Guildmaster of Faydarks Champions. I have studied here for many of my years until recently when I took up teaching. I have many pupils that undergo my vigorous [training exercises].");
		}
	if ($text =~ /training exercises/i)
		{
		quest::say("I have a series of tests that all new rangers of Kelethin are suggested to participate in. These tests will help you develop many of your skills including hunting and gathering and will also provide you with a chance to fashion your own Trueshot Chainmail. If you are a [ranger of Tunare] and are willing to begin your training I will be happy to explain to you how the tests work.");
		}
	if ($text =~ /ranger of tunare/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Excellent $name, then lets get started! Here is your Trueshot Assembly Kit. You will collect various items from the Faydark and Clan Crushbone that will be necessary for creating your armor materials in your assembly kit. Once you have fashioned together a specific armor material you can then take it to a forge along with the applicable pattern to create your Trueshot Chainmail armor piece. Simply tell me what armor piece you [want] to craft and I can provide you with the material recipes and patterns for Trueshot Chainmail [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}

	if ($text =~ /coif/i)
		{
		quest::say("To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Royal Jelly, 1 Spiderling Eye and 1 Ration in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Coif.");
		quest::summonitem(22671);
		}
	if ($text =~ /bracer/i)
		{
		quest::say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Skeleton Tibia, 1 Pixie Wing and 1 Gypsy Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Bracer.");
		quest::summonitem(22672);
		}
	if ($text =~ /sleeves/i)
		{
		quest::say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Wasp Venom Sacs, 1 Large Widow Abdomen and 1 White Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Sleeves.");
		quest::summonitem(22673);
		}
	if ($text =~ /boots/i)
		{
		quest::say("To create your boots material you will need to combine 3 Bricks of Crude Bronze, 1 Severed Orc Foot, 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Boots.");
		quest::summonitem(22674);
		}
	if ($text =~ /legplates/i)
		{
		quest::say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze, 1 Orc Fibula, 1 Orc Clavicle, and 1 Lightstone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Legplates.");
		quest::summonitem(22675);
		}
	if ($text =~ /gauntlets/i)
		{
		quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Orc Ulna, 1 Orc Tibia, and 2 Orc Finger Bones in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Gauntlets.");
		quest::summonitem(22676);
		}
	if ($text =~ /tunic/i)
		{
		quest::say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Orc Fibula, 1 Golden Bandit Tooth, 1 Pristine Forest Drakeling Scale, 1 Orc Ribcage and 1 Orc Eye in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Tunic. Please return to me after you have completed your tunic, for I have one final [favor] to ask of you.");
		quest::summonitem(22677);
		}
	if ($text =~ /favor/i)
		{
		quest::say("I have received word that there are numerous elves being held hostage in the confines of Clan Crushbone, beaten and forced to perform slave work under horrible conditions. There is believed to be a specific Orc that patrols the jail cells that has a master key in his possession for all of the elven hostages. If you were to retrieve this master key for me I would possibly be able to make copies of it and distribute them to my task force so that we may attempt to rescue our helpless bretheren. Will you [retrieve the master key]?");
		}
	if ($text =~ /retrieve the master key/i)
		{
		quest::say("Excellent news, I was afraid I would not be able to find someone willing to help. Please bring me the master key along with 2 Orc Eyes and I shall craft you a long sword worthy of your great deeds.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 27539 => 1, 13266 => 2))  #Master Key and 2 Orc Eyes
		{
		quest::say("You have done great, young $name! This key will enable us to rescue many innocent residents of Kelethin. Please take this shard of Rolath, you have truly earned it along with my sincere thanks.  Good luck to you.");
		quest::summonitem(1266);
		#faction per ZAM
		quest::faction(246, 5); #Faydarks Champions
		quest::faction(279, 1); #King Tearis Thex
		quest::faction(226, 1); #Clerics of Tunare
		quest::faction(310, 1); #Soldiers of Tunare
		quest::faction(234, -1); #Crushbone Orcs
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
				quest::incstat(0,3); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,6);	# AGI
				quest::incstat(3,5);	# DEX
				quest::incstat(4,1);	# INT
				quest::incstat(5,4);	# WIS
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
		plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

