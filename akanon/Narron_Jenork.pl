my $taskid=196;
my $containerid=17255;
my $robeid=9090;
my $titleid=97;
my $pre="Initiate";
my $fix="of the Watch";

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Pleased to meet you, $name! I am Narron Jenork, High Watchman of Ak'anon. I am one of the most skilled Watchmans in all of Ak'anon, and I pride myself on training the most promising young warriors that Ak'anon has to offer. Are you a young gnome warrior?");
		}
	if ($text =~ /young gnome warrior/i)
		{
		quest::say("Well, we can never get enough warriors around these parts, as far as I am concerned! Now if you are a new warrior, then you must go through the training to become a true watchman. I have a series of tests that will require you to test both your hunting and navigational skills. These tests will not leave you with nothing to show for your work, because upon completing them you will be outfitted with a full suit of Initiate Watchman's armor. Are you [ready to be tested]?");
		}
	if ($text =~ /ready to be tested/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Well then, let's get you started! First, I will present you with this Watchman's Mail Assembly kit to gather assorted items from both your training grounds of the Steamfont Mountains and in our great town of Ak'anon. You will then combine the different recipes of components in your kit to create a material that will be used with a mold in a forge to create your Watchman armor. When you are ready to craft a specific piece, all you must do is tell me what armor piece you want to craft, and I will present you with the recipe for the material, along with the mold. I have the material recipes necessary to make Initiate Watchman [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}

		}
	if ($text =~ /helm/i)
		{
		quest::say("No watchman can even think of going into battle without the proper helmet, and I think this one will do the job for you, $name. To create your helm material, you will need to combine 2 Bricks of Crude Bronze, 1 Piece of Scrap Metal, 1 Ruined Cat Pelt and 1 Raw Bamboo in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Helm.");
		quest::summonitem(22610);
		}
	if ($text =~ /bracer/i)
		{
		quest::say("Always a wise idea to keep your wrists well protected, because if you don't, you might have a difficult time swinging your weapons! To create your bracer material, you will need to combine 1 Brick of Crude Bronze, 1 Rusty Mace, 1 Kobold Tooth and 1 Bottle of Milk in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Bracer.");
		quest::summonitem(22611);
		}
	if ($text =~ /armguard/i)
		{
		quest::say("One always has to be able to really pack a punch with their attacks, so preventing any injuries on your arms ahead of time is good planning! To create your armguards material, you will need to combine 2 Bricks of Crude Bronze, 2 Brownie Legs, and 1 Short Beer in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Armguards.");
		quest::summonitem(22613);
		}
	if ($text =~ /boots/i)
		{
		quest::say("I certainly wouldn't advise any watchman to be on patrol without proper boots on. We aren't halflings, you know! Therefore our obsession should be with our tactical attacks, not our foothairs. To create your boot material, you will need to combine 3 Bricks of Crude Bronze, 1 Aviak Beak, 2 Wolf Meats and 1 Red Wine in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Boots.");
		quest::summonitem(22612);
		}
	if ($text =~ /greaves/i)
		{
		quest::say("Pants are a must, young $name. As a Watchman of Ak'anon, you should be known for your noble deeds and commitment to defending your home, not as a gnome that runs around with no pants on. To create your greaves material, you will need to combine 4 Bricks of Crude Bronze, 1 Coyote Pelt, 1 Rusted Blackbox and 1 Bottle in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Greaves.");
		quest::summonitem(22614);
		}
	if ($text =~ /gauntlets/i)
		{
		quest::say("Having the necessary protection on your hands and wrists will prevent any serious injuries that would make you unable to defend yourself. To create your gauntlet material, you will need to combine 3 Bricks of Crude Bronze, 1 Runaway Clockwork Gearbox, 1 Young Ebon Drakewing, and 1 Minotaur Scalp in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Gauntlets.");
		quest::summonitem(22615);
		}
	if ($text =~ /breastplate/i)
		{
		quest::say("I am very pleased to see that you have progressed so quickly in your training, $name! I do also agree that you are ready to gather the items necessary for crafting your Initiate Watchman's Breastplate. To create your breastplate material, you will need to combine 5 Bricks of Crude Bronze, 1 Runaway Clockwork Motor, 1 Brownie Brain, 1 Rusty Long Sword, 1 Grikbar Kobold Scalp and the evil Diloperia`s Bracer in your assembly kit. Once you have created the proper material, take it to a forge along with this mold to fashion your very own Initiate Watchman's Breastplate. When you are finished with your breastplate, please come back to see me. I have a [final task] for you to complete.");
		quest::summonitem(22616);
		}
	if ($text =~ /final task/i)
		{
		quest::say("Much like most of the other guildmasters in our great city, we have decided to begin presenting all new worthy recruits with weapons that symbolize their devotion to Ak'anon. I am in need of a [few items] from the mountains to make this weapon. If you will collect these items for me, I will be happy to reward you with one of these fine weapons.");
		}
	if ($text =~ /few items/i)
		{
		quest::say("I will need for you to bring me 1 Clockwork Oil Extract, 1 Minotaur Tibia, 1 Young Ebon Drake Ribcage and 1 Renegade Clockwork Scrapmetal. Return to me after you have gathered this items and I will reward you with your weapon.");
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
				quest::incstat(0,4); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,6);	# AGI
				quest::incstat(3,3);	# DEX
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

	if (plugin::check_handin(\%itemcount, 9111 => 1, 9112 => 1, 9113 => 1, 9114 => 1))
		{
		quest::say("Well done, young $name! Since you have brought me the necessary items, I now present you with this Rolath Shard of battle. Use it worthily.");
		quest::summonitem(1266);
		quest::ding();
		#Factions per ZAM
		quest::faction(255, 25);     # Gem Choppers better
		quest::faction(288, 6);     # Merchants of Ak'Anon better
		quest::faction(333, 6);     # King Ak'Anon better
		quest::faction(238, -6);    # Dark Reflection worse
		quest::faction(1604, -1);    # Clan Grikbar worse
		quest::exp(29127); # Copied fro Garret's xp reward
		}

	elsif (plugin::check_handin(\%itemcount, 12378 => 1)) #Box of Undead Brownies
		{
		quest::say("Wonderful!! Watchman Dexlin sent word that you would be returning these specimens. I shall see that the Eldritch Collective gets them.  For you there is a reward. Manik has donated a pair of Watchman Boots!!");
		#Factions per ZAM
		quest::faction(255, 20);     # Gem Choppers better
		quest::faction(288, 5);     # Merchants of Ak'Anon better
		quest::faction(333, 5);     # King Ak'Anon better
		quest::faction(238, -5);    # Dark Reflection worse
		quest::faction(1604, -1);    # Clan Grikbar worse
		quest::exp(10000);
		quest::ding();
		quest::summonitem(12379);    # Watchman Boots
		quest::givecash(0, 0, 0, 5);
		}
	else
		{
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
