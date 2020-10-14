my $taskid=94;
my $containerid=17266;
my $bracerid=9859;
my $robeid=9864;
my $titleid=61;
my $pre="Truthbringer";
my $fix="";


sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Greetings and well met $name. I am Edwardian Holyblade, noble paladin of Marr. I have devoted my life and my blade to the glory of Mithaniel Marr. I am also in charge of training all new paladins of Marr to make sure that they have the best training necessary. If you are a paladin of Marr I may have some [training] for you.");
		}
	if($text=~/training/i) 
		{
		quest::say("I have developed a training program for all young and upcoming Paladins of Marr. My tests will enable you to learn some basic hunting, navigating and armor crafting skills. All of these abilities will be very important on your path to enlightenment. If you are [ready to begin my tests] I will explain to you how the tests will work.");
		}
	if($text=~/ready to begin/i) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Very well $name. I look forward to seeing you progress through your training. Here is your special mail assembly kit. In this kit you will combine a number of components that you will collect from all areas of Freeport, North Ro and the Commonlands. The components that you will gather and combine in this kit will magically create a specific armor material piece. Each of these materials will be combined in a forge with the appropriate mold that I will provide you with. I will explain to you how the [recipes] work when you are ready.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if($text=~/recipes/i) 
		{
		quest::say("Once you have crafted your material from the specific recipes I give you, you will need the appropriate mold as I mentioned before. I can present you with the recipe and mold for Truthbringers [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate]. When you are ready to being collecting the components for a material recipe simply tell me what piece you [want] to craft.");
		}
	if($text=~/craft helm/i) 
		{
		quest::say("I would strongly suggest a good helm as you can see by my patch over my eye I was not so careful in my younger days. To create your helm material you will need to combine 2 Bricks of Crude Iron Ore, 1 Young Kodiak Paw, 1 Ruined Cat Pelt and 1 Hops in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Helm.");
		quest::summonitem("22610"); #An Enchanted Helm Mold
		}
	if($text=~/craft gauntlets/i) 
		{
		quest::say("Sooner or later you will take a tough blow to your hands. Being struck there without the right gauntlets could mean a very serious and painful injury. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron Ore, 1 Giant Spider Egg Sack, 1 Ruined Bear Pelt, and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Gauntlets.");
		quest::summonitem("22615"); #An Enchanted Gauntlet Mold
		}
	if($text=~/craft greaves/i) 
		{
		quest::say("I can't begin to tell you how important pants are $name. Any injuries to them could disable you from escaping should you need to and would surely perish due to this. To create your greaves material you will need to combine 4 Bricks of Crude Iron Ore, 1 Coyote Pelt, 1 Shadow Wolf Tibia, 1 Bottle and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Greaves.");
		quest::summonitem("22614"); #An Enchanted Greaves Mold
		}
	if($text=~/craft armguards/i) 
		{
		quest::say("A good set of armguards will keep your arms safe from any attacks you may face while in training. It is a common tactic to go for ones arms because with them disabled it becomes impossible to defend yourself. To create your armguards material you will need to combine 2 Bricks of Crude Iron Ore, 2 Black Bear Paws, and 1 Short Beer in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Armguards.");
		quest::summonitem("22613"); #An Enchanted Armguard Mold
		}
	if($text=~/craft bracers/i) 
		{
		quest::say("I have seen many paladins go without the proper wrist protection and the result was never good. To create your bracer material you will need to combine 1 Brick of Crude Iron Ore, 1 Orc Prayer Beads and 1 Red Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Bracer.");
		quest::summonitem("22611"); #An Enchanted Bracer Mold
		}
	if($text=~/craft breastplate/i) 
		{
		quest::say("Any paladins most important armor piece is always their breastplate. Should you succeed in crafting it your Truthbringer Breastplate will guard your upper body from any serious attacks that would otherwise be quite devasting. To create your breastplate material you will need to combine 5 Bricks of Crude Iron Ore, 1 Young Plains Cat Scalp, 1 Young Puma Skin, 1 Water Flask, 1 Deathfist Orc Skull and 1 Giant Fire Beetle Carapace in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Breastplate. After you have completed your breastplate come back to see me for I have one [final test] for you.");
		quest::summonitem("22616"); #An Enchanted Breastplate Mold
		}
	if($text=~/craft boots/i) 
		{
		quest::say("Boots are a wise armor choice because you never know what you will have to walk across and knowing your feet are protected is one less thing to worry about. To create your boot material you will need to combine 3 Bricks of Crude Iron Ore, 1 Lion Mane and 2 Wolf Meats in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Truthbringers Boots.");
		quest::summonitem("22612"); #An Enchanted Boots Mold
		}
	if($text=~/final test/i)
		{
		quest::say("Well for quite sometime the Freeport Militia has become more and more corrupt. They have been known to do any dastardly deed you can imagine which includes harming and sometimes killing followers of Marr. There is a group of Militia Soldiers in the commonlands that have been recently harassing a good friend of mine. His name is Pardor and he is a shopkeeper in the commonlands. As if it wasn't dangerous enough in the commonlands he know has these Militia soldiers demanding he pay them a tax that does not exist.  Will you travel to the commonlands to kill these militia soldiers? I fear for my friend's life.");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 9927 => 1, 9928 => 1, 9929 => 1, 9930 => 1)) #Fefslans Bracer, Gnoosals Bracer, Walorinags Bracer, Eridals Bracer
		{
		quest::say("Your dedication to the Temple of Marr is unquestioned $name.You have made your house very proud. May this shard bring you the best of luck and good fortune wherever your adventures may take you."); 
		quest::summonitem("1266"); #Rolath Shard of Battle
		quest::ding();
		quest::exp(100);
		#factions verified on ZAM
        quest::faction(281,"25"); #Knights of Truth
        quest::faction(362,"5"); #Priests of Marr
        quest::faction(330,"-3"); #The Freeport Militia
        quest::faction(271,"-3"); #Dismal Rage
        quest::faction(311,"2"); #Steel Warriors
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
				quest::incstat(1,6); 	# STA
				quest::incstat(2,3);	# AGI
				quest::incstat(3,2);	# DEX
				quest::incstat(5,6);	# WIS
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
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

#END of FILE Zone:freportn  ID:8004 -- Edwardian_Holyblade
