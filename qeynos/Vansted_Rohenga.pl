sub EVENT_SPAWN
	{
	quest::spawn_condition("qeytoqrg",3,0);
	}

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Pleased to meet you $name. I am Vansted Rohenga High Priest of Karana. I have spent all of my years studying the ways of the Cleric in our wonderful Temple of Thunder. We receive many new recruits every day and it is my duty to place them in my [training program].");
		}

	if($text=~/what training program/i)
		{
		quest::say("Well all young clerics of Karana are brought up from their first day of training to know and respect their practice. I have developed a number of exercises that will enable a young cleric to make a set of their own armor by means of collecting certain items and making [enchanted armor materials] out of them.");
		}

	if($text=~/what enchanted armor materials/i)
		{
		quest::say("Recently we have discovered that combing certain items in certain quantities using a magical assembly kit can forge together an armor material. These armor materials are used with specific armor molds to create a piece of enchanted Stormhealer Armor. If you would like to [begin forging armor materials] I will present you with your Stormhealers Assembly Kit.");
		}

	if($text=~/begin forging armor materials/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Excellent $name, please take this Stormhealers Assembly Kit. It is in this kit that you will combine certain items together into materials necessary for crafting your armor. I can present you with the material recipes and armor molds for Stormhealer [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to gather the items for an armor piece simply tell me what piece you [want] to craft. Once you have created a specific material take it to a forge along with the applicable mold to create your armor piece.");
			my @task_array;
			push(@task_array, 44);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}

		if($text=~/i want to craft helms/i)
			{
			quest::say("Here is your Stormhealers Helm Mold. To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Field Rat Ribcage, 1 Rat Tooth and 1 Honey Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Stormhealer.");
			quest::summonitem("22610");
			}

		if($text=~/i want to craft bracers/i)
			{
			quest::say("Here is your Stormhealers Bracer Mold. To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 Field Rat Skull, 1 Coyote Skull and 1 Grapes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Stormhealer.");
			quest::summonitem("22611");
			}

		if($text=~/i want to craft armguards/i)
			{
			quest::say("Here is your Stormhealers Armguard Mold. To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Whiskered Bat Fangs, and 1 Torch in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Stormhealer.");
			quest::summonitem("22613");
			}

		if($text=~/i want to craft boots/i)
			{
			quest::say("Here is your Stormhealers Boot Mold. To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Ruined Blackburrow Gnoll Pelt, 2 Gnoll Fangs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boot of the Stormhealer.");
			quest::summonitem("22612");
			}

		if($text=~/i want to craft greaves/i)
			{
			quest::say("Here is your Stormhealers Greaves Mold. To create your greaves material you will need to combine 5 Bricks of Crude Iron, 1 Giant Fire Beetle Brain, 1 Shadow Wolf Paw, 1 Bottle and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Stormhealer.");
			quest::summonitem("22614");
			}

		if($text=~/i want to craft gauntlets/i)
			{
			quest::say("Here is your Stormhealers Gauntlet Mold. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Puma Skin, 1 Bear Meat, and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Stormhealer.");
			quest::summonitem("22615");
			}

		if($text=~/i want to craft breastplates/i)
			{
			quest::say("Here is your Stormhealers Breastplate Mold. To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Young Plains Cat Scalp, 1 Low Quality Bear Skin, 1 Water Flask 1 Lock of Scarecrow Straw and 1 Giant Fire Beetle Carapace in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Stormhealer. Please come back to see me after you have completed your breastplate. I have a [final favor] to ask of you.");
			quest::summonitem("22616");
			}

		if($text=~/what final favor/i)
			{
			quest::say("I thank you for returning to assist me in this very important task. It has come to my attention that the gnolls of Blackburrow are planning an attack on Qeynos sometime in the near future. Although I know that these hairballs posses no actual fighting skills, they can present a problem for the defenders of our city just due to sheer numbers. I need you to infiltrate Blackburrow and retrieve some [important documents] for me.");
			}

		if($text=~/what important documents/i)
			{
			quest::say("There is a believed to be a gnoll tactician somewhere in the gnoll camp of Blackburrow. I need you to bring whatever battle plans he may be in possession of so that I can position my troops accordingly. Return to me with whatever battle plans you can find along with 2 Gnoll Backbones and I will surely reward you for your dedication. You may well need help.  Let me know when you have assembled a group of friends and are [ready] to begin."); 
			}
		elsif($text=~/ready/i)
			{
			my $deity = $client->GetDeity();
			if ($class != "cleric" || $deity != 207)
				{
				quest::say("Only trusted prophets are ready for such a mission.");
				}
			elsif (defined $qglobals{"StormHealerFavor"})
				{
				quest::say("My sources say the tactition is elsewhere.  Come back another time.");
				}
			else
				{
				quest::setglobal("StormHealerFavor", 1, 0, "D6");
				quest::say("Make haste!  My intelligence suggests the tactition may be in the Hills!");
				quest::settimer("despawn", 7200);
				quest::spawn_condition("qeytoqrg",3,1);
				}
			}
		}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 27416 =>1, 27405 =>2 )) 
		{
		quest::say("These are exactly what I was looking for $name!  I am very proud to have one as noble as yourself amonst our ranks!  Please take this as a token of my appreciation.  I bid you farewell, and safe travels.");
		quest::exp(500);
		quest::ding();
		quest::summonitem(1264);
		quest::summonitem(66180);
		# Faction verified on live.
		quest::faction(262,7 );
		quest::faction(280,10 );
		quest::faction(341,7 );
		quest::faction(221,-10 );
		}

	if (quest::istaskactivityactive(44, 7))
		{
		if (plugin::check_handin(\%itemcount, 17265 => 1))
			{
			quest::updatetaskactivity(44,7);
			}
		}


	if (quest::istaskactivityactive(44, 14))
		{
		if (plugin::check_handin(\%itemcount, 27343 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,3); 	# STR
				quest::incstat(1,3);	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,5);	# DEX
				quest::incstat(5,6);	# WIS
				quest::incstat(6,3);	# CHA
				if ($class eq "Cleric")
					{
					quest::enabletitle(15);
					quest::shout2("All Hail Storm Healer $name!."); 
					}
				quest::updatetaskactivity(44,14);
				}
			else
				{
				quest::summonitem(27343);
				}
			} 
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem(17265);
    quest::setglobal($varname,1,5,"F");
	}

sub EVENT_TIMER
	{
	quest::spawn_condition("qeytoqrg",3,0);
	}

#END of FILE Zone:qeynos  ID:1135 -- Vansted_Rohenga 

