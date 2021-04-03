my $taskid=112;
my $containerid=17247;
my $robeid=27598;
my $titleid=78;
my $pre="Apprentice Miner";
my $fix="";

sub EVENT_SAY
    {
    if ( $text =~ /hail/i )
        {
        quest::say("Gud to meet ye there $name. Me names Crovsar Dirkbringer and I run dis here mining operation. Anyone else that tell ye different simply aint telling da truth! I like to spend most of me time minin but I also like to help our young miners pick dere way to glory as a great rogue! Er I mean a great miner! Aye, dats it. If ye are a young minin [rogue] of Kaladim den I might just have some things for ye to do.");
        }
    if ( $text =~ /rogue/i )
        {
        quest::say("A young rogue ye say ye is eh Gilborn? Well den If`n yer ready to git your hands dirty and yer pockets full I will be happy to explain to you the [training] exercises dat I have our new recruits all undergo to earn dere keep in dese here mines!");
        }
    if ( $text =~ /training/i )
        {
        quest::say("Well den it must be obvious that not just any young miner can git his things and venture out into da world without the proper armor to protect dem Aye? Dis is why I have developed training exercises dat will test both yer fightin and collectin skills and will in da end yield you a full set of Apprentice Miners Chainmail! Now makin da armor will nat be hard at all because I will be able to give you the tools necessary too craft da armor pieces once you have created da correct armor [materials].");
        }
    if ( $text =~ /materials/i )
        {
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Now were talkin! I can see dat ye are very interested in carving yer way into da Kaladim history books so lets git started. First off you will use this Dusty Mail Assembly Kit to collect various magical items that can be combined in da kit to create the armor materials that I spoke of earlier. You will then take the material to a forge along with patterns that I will present ye with to create da specific armor piece ye asked for. When ye are ready simply say what armor piece ye want to craft and I can provide ye with the armor material recipes and patterns for Apprentice Miners [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
        }
    if ( $text =~ /boots/i )
        {
        quest::say("To create your boots material you will need to combine 3 Bricks of Crude Bronze, 1 Cracked Giant Scarab Carapace, 2 Runny Eye Warbeads and 1 Snake Scale and 1 Spiderling Silk in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Boots.");

        #Summon: Crude Boots Mold
        quest::summonitem(19634);
        }
    if ( $text =~ /bracers/i )
        {
        quest::say("To create your bracer material you will need to combine 1 Bricks of Crude Bronze, 1 Orc Scoutsmans Wrist Pouch, 1 Towering Brute War Helm and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Bracer.");

        #Summon: Crude Bracer Mold
        quest::summonitem(19632);
        }
    if ( $text =~ /coifs/i )
        {
        quest::say("To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Skunk Scent Gland, 1 Snake Scale and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Coif.");

        #Summon: Crude Helm Mold
        quest::summonitem(19631);
        }
    if ( $text =~ /gauntlets/i )
        {
        quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Barmas Tongue, 1 Aqua Goblin Headdress, 1 Goblin Parts and 1 Dwarven Bandit Coinpurse in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Gauntlets.");

        #Summon: Crude Gauntlets Mold
        quest::summonitem(19633);
        }
    if ( $text =~ /legplates/i )
        {
        quest::say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze, 1 Symbol of Hatred, 1 Aqua Goblin Tongue and 1 Severed Greenblood Finger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Legplates.");

        #Summon: Crude Greaves Mold
        quest::summonitem(19636);
        }
    if ( $text =~ /sleeves/i )
        {
        quest::say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Bat Fur, 1 Spider Legs and 1 Giant Scarab Egg Sack in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Sleeves.");

        #Summon: Crude Vambraces Mold
        quest::summonitem(19635);
        }
    if ( $text =~ /tunics/i )
        {
        quest::say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Enraged Goblin Beads, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Basilisk Tongue and 1 Goblin Parts in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Tunic. When ye finish yer tunic come on back fer I got one more [assignment] for a miner that I know I can trust!");

        #Summon: Crude Breastplate Mold
        quest::summonitem(19637);
        }
    if ( $text =~ /assignment/i )
        {
        quest::say("Well da assignment is simple $name. I jess simply need ye to fetch me some items that I need to create a minin pick dat I plan on distributing to all da new miners around dese parts dat pass my exercises, much like yerself. If you would like to help me [collect] the items I need I could perhaps fix ye up one of dese first minin picks. Whatta ya say dere $name?");
        }
    if ( $text =~ /collect/i )
        {
        quest::say("Das great news to hear indeed! Please seek out 1 Aqua Goblin Backbone and 2 Pristine Skunk Claws and I will surely reward ye for yer trouble. I hope to see ye soon!");
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

    if ( plugin::check_handin( \%itemcount, 28067 => 1, 28068 => 2 ) )
        {
        quest::say("'I had no doubt in my mind dat I could count on seeing you again but not quite dis soon! Luckily due to my pick craftin expertise I was able to use the items you gathered to make dis fine Minin pick! I hope it will serve you well through all of your prosperous adventures! Good luck to ye , you have done well!");
        quest::summonitem(1266);
		#Factions verified on zam
		quest::faction(322, 20);	#:: + Miners Guild 628
		quest::faction(223, -1);	#:: - Circle Of Unseen Hands
		quest::faction(379, -1);	#:: - Butcherblock Bandits
		quest::faction(241, 1);		#:: + Deeppockets
		quest::faction(244, -3);	#:: - Ebon Mask
        }

    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins( \%itemcount, $class, 'Rogue' );
    }

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
