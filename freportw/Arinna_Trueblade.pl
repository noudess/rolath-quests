my $taskid=97;
my $containerid=17262;
my $bracerid=9887;
my $robeid=9892;
my $titleid=65;
my $pre="Steel Warrior";
my $fix="of Freeport";

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i) 
		{
		quest::say("Well met, $name. I am Arianna Trueblade, Warlord of the Steel Warriors. I am personally in charge of all the training that our young warriors receive. I take pride in knowing that my teaching can help make the foundation of a Freeport Champion. If you are a [warrior] then we might just have something to talk about.");
		}
	if($text=~/warrior/i) 
		{
		quest::say("So you think you have what it takes to become one of Freeports finest? I will warn you now that we expect every single warrior that is brought into our ranks to go through a series of exercises. Rest assured you will be rewarded for your hard work with a set of armor that I will walk you though the process of making. Are you [ready to begin your testing]?");
		}
	if($text=~/ready to begin/i) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Very well, $name. Here is your Steel Warriors Mail Kit. This kit will be your main tool in creating your own armor. You will gather various items from all areas of Freeport from monsters and stores alike. You will use specific item combinations in this kit to fashion together armor materials that you will combine in a forge with the appropriate mold to make an armor piece. Once you are ready to attempt a piece of armor simply tell me what piece you want to craft. I will then present you with the recipe and mold for Steel Warrior [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if($text=~/helm/i) 
		{
		quest::say("Any Steel Warrior that is caught not wearing a helm is usually placed on probation. We feel it is necessary sometimes to do this so that our younger ones in training will understand the importance of keeping your head well protected. To create your helm material you will need to combine two Bricks of Crude Iron Ore, one Rat Ear, one Meat Pie and one Barley in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Helm.");
		quest::summonitem(22610); #An Enchanted Helm Mold
		}
	if($text=~/bracer/i) 
		{
		quest::say("As you progress further through your training you will find yourself in heavy battle more and more often. Bracers will ensure that you are able to fend off your opponents blows with minimum injury. To create your bracer material you will need to combine one Brick of Crude Iron Ore, one Rotting Zombie Skull, one Snake Bile and one Tiny Dagger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Bracer.");
		quest::summonitem(22611); #An Enchanted Bracer Mold
		}
	if($text=~/armguards/i) 
		{
		quest::say("A slash or gash to the arms can greatly hinder a warrior's combat abilities. Wearing these armguards will ensure that this does not happen. To create your armguard material you will need to combine two Bricks of Crude Iron Ore, two Young Kodiak Paws, one Young Plains Cat Scalp and one Freeport Stout in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Steel Warriors Armguards.");
		quest::summonitem(22613); #An Enchanted Armguard
		}
	if($text=~/boots/i) 
		{
		quest::say("Boots are very necessary for any warrior especially when you will usually be the one leading most combat units. Being on the front line and treading across terrains first make good boots a must. To create your boots material you will need to combine three Bricks of Crude Iron Ore, one Shadow Wolf Tibia and two Spiderling Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Boots.");
		quest::summonitem(22612); #An Enchanted Boot Mold
		}
	if($text=~/greaves/i) 
		{
		quest::say("While most armor pieces are very vital to a young warriors survival, greaves are one of the most important armor pieces you will craft. To create your greaves material you will need to combine four Bricks of Crude Iron Ore, one Giant Fire Beetle Brain, one Lion Tail, one Bottle and one Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Greaves.");
		quest::summonitem(22614); #An Enchanted Greaves Mold
		}
	if ($text=~/gauntlets/i) 
		{
		quest::say("Keeping your hands well guarded is without question the most important thing a warrior will do. Suffering a blow to the hands that would prevent you from defending yourself would most certainly mean death. To create your gauntlet material you will need to combine three Bricks of Crude Iron Ore, one Armadillo Tail, one Severed Orc Foot, and two Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Gauntlets.");
		quest::summonitem(22615);
		}
	if($text=~/breastplate/i) 
		{
		quest::say("Your dedication to learning everything about your class is impressive, $name. I have no doubt that you are ready to collect the pieces for your Steel Warriors Breastplate. To create your breastplate material you will need to combine five Bricks of Crude Iron Ore, one Deathfist Orc Skull, one Woven Spider Silk, one Armadillo Carapace, one Matted Lion Pelt and one Rusty Short Sword in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Steel Warriors Breastplate. Please come back to see me after you are finished with your breastplate for your [final task].");
		quest::summonitem(22616); #An Enchanted Breastplate Mold
		}
	if($text=~/final task/i) 
		{
		quest::say("I am in need of some assistance to craft a special sword that I would like to present all graduates of my training. However. I don't have all the pieces I need to make one. If you could retrieve a Pristine Giant Scarab Leg, one Lion Paw and one Vial of Smoke I will have all I need to create this weapon. I will reward you with an item that will aid in your adventures. See you soon.");
		}
	}

sub EVENT_ITEM 
	{
		{
		if (plugin::check_handin(\%itemcount, 9919 => 1, 9918 => 1, 9923 => 1)) 
			{ #Pristine Giant Scarab Leg, Lion Paw, Vial of Smoke
			quest::say("'Your determination to further your training and knowledge never ceases to amaze me. I knew I could count on you to retrieve these items for me. Excellent work $name, you have proven your value to the Steel Warriors. Here is a item that will aid you in slaying enemies of the Steel Warriors.");
			quest::exp(100);
			quest::ding();
			#Factions verified on live
    	    quest::faction(311, 25); #Steel Warriors
	        quest::faction(262, 5);	#Guards of Qeynos
    	    quest::faction(281, 5); #Knights of Truth
    	    quest::faction(230, -3); #Corrupt Qeynos Guards
    	    quest::faction(330, -3); #The Freeport Militia
			quest::summonitem(1266); #Rolath Shard of Battle
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
					quest::incstat(2,6);	# AGI
					quest::incstat(3,2);	# DEX
					quest::incstat(6,2);	# CHA
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
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
