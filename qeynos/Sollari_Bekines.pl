#####################################
#Quests: Bard Wind Spirits Armor
#NPC: Sollari Bekines
#Zone: qeynos
#Original Author Unknown
#Modified by Drool & Neysa
#####################################

sub EVENT_SAY
  {
    if ( $text =~ /Hail/i )
      {
        quest::say( "Hello, there! I am Sollari Bekines of the League of Antonican Bards. I am at your service to train you as best I can. There have been a number of young bards entering our concert halls lately seeking guidance. If you are a young bard in [search of training]. I might have some work for you.");
      }

    if ( $text =~ /search of training/i )
      {
        quest::say( "You need to look no further then. I can surely provide you with the knowledge you will need to make it in this world as a songweaver. The exercises that you will need to complete will test your gathering and fighting skills. Once you have completed your training you will be outfitted with a suit of your very own armor! When you are [ready to begin] I will explain to you how the training will work.");
      }

	if ( $text =~ /i am ready to begin/i )
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say( "Here is your Wind Spirits Assembly Kit. In this kit you will collect a different items that will be combined in certain quantities to create infused armor materials. These armor materials that you create can then be taken to a forge along with the applicable armor mold to fashion together a piece of Wind Spirits Armor. When you would like to craft an armor piece you must simply tell me what piece you [want] to craft. I will then provide you with the recipe and mold necessary for creating Wind Spirits [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
			my @task_array;
			push(@task_array, 42);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}

    if ( $text =~ /helm/i )
      {
        quest::say( "To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Coyote Skull, 1 Bat Fur and 1 Honey Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Helm.");
        quest::summonitem(22610);
      }

    if ( $text =~ /bracers/i )
      {
        quest::say( "To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 Gnoll Backbone, 1 Gnoll Scoutsmans Documents and 1 Throwing Spear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Bracer.");
        quest::summonitem(22611);
      }

    if ( $text =~ /armguards/i )
      {
        quest::say( "To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Ruined Wolf Pelts, 1 Diseased Wolf Pelt and 1 Arrow in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Armguards.");
        quest::summonitem(22613);
      }

    if ( $text =~ /boots/i )
      {
        quest::say( "To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Brown Bear Femur and 2 Blackburrow Gnoll Pelts in your assembly kit, Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Boots.");
        quest::summonitem(22612);
      }

    if ( $text =~ /greaves/i )
      {
        quest::say( "To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Giant Spider Egg Sack, 1 Black Wolf Tooth, 1 Bottle and 1 Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Greaves.");
        quest::summonitem(22614);
      }

    if ( $text =~ /gauntlets/i )
      {
        quest::say( "To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Giant Fire Beetle Carapace, 1 Lion Tooth, and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Gauntlets.");
        quest::summonitem(22615);
      }

    if ( $text =~ /breastplate/i )
      {
        quest::say( "To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Low Quality Bear Skin, 1 Woven Spider Silk, 1 Lock of Scarecrow Straw, 1 Matted Lion Pelt and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Breastplate. When you are finished with your Breastplate and have completed your armor set please come see me for one [final exercise].");
        quest::summonitem(22616);
      }

    if ( $text =~ /final exercise/i )
      {
        quest::say( "I need your help with ridding the hills of some of the most vile creatures, the gnolls of course! My resident alchemist has instructed me that he needs some items from these furballs for a antidote he is working on. I need you to bring me 2 Vials of Gnoll Blood and 2 Gnoll Pelvises. Once you have returned with these items I will reward you with a an item worthy of the finest Qeynos Songweaver. I look forward to seeing you soon.");
      }
  }

sub EVENT_ITEM
  {
    if ( plugin::check_handin( \%itemcount, 27423 => 2, 27424 => 2 ) )
      {
        #text made up
        quest::say( "Great work, $name.  You have rid the world of more gnolls and brought me the components I require.");
		quest::summonitem(1266);
		quest::summonitem(66180);

        #not completely sure about the faction hits
        quest::faction(284, 10 );    #League of Antonican Bards
        quest::faction(291, 5 );     #Merchants of Qeynos
        quest::faction(121,  5 );     #Citizens of Qeynos
        quest::exp(500);
		quest::ding();
      }

	if (quest::istaskactivityactive(42, 7))
		{
		if (plugin::check_handin(\%itemcount, 17269 => 1))
			{
			quest::updatetaskactivity(42,7);
			}
		}

	if (quest::istaskactivityactive(42, 14))
		{
		if (plugin::check_handin(\%itemcount, 27371 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,4); 	# STR
				quest::incstat(1,3); 	# STA
				quest::incstat(2,6);	# AGI
				quest::incstat(3,7);	# DEX
				quest::incstat(6,9);	# CHA
				if ($class eq "Bard")
					{
					quest::enabletitle(13);
					quest::shout2("All Hail Wind Spirit $name!."); 
					}
				quest::updatetaskactivity(42,14);
				}
			else
				{
				quest::summonitem(27371);
				}
			} 
		}

    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins( \%itemcount, $class, 'Bard' );
  }

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem(17269);
    quest::setglobal($varname,1,5,"F");
	}


sub EVENT_WAYPOINT_ARRIVE
	{
	$npc->CastSpell(7,1050);

		if ($wp == 2)
			{
			quest::emote("sings 'Ode to Korvik'");
			quest::emote("sings 'whom the werewolf cursed'");
			}

		elsif ($wp == 3)
			{
			quest::emote("sings 'and many a dark night'");
			quest::emote("sings 'he wished he had died first!'");
			quest::doanim (28);
			}

		elsif ($wp == 4)
			{
			quest::emote("sings 'Korvik was saved'");
			quest::emote("sings 'by the Fangbreakers cure'");
			}

		elsif ($wp == 5)
			{
			quest::emote("sings 'and the brave adventurers'");
			quest::emote("sings 'who helped make him pure!'");
			quest::doanim (51);
			}

		elsif ($wp == 6)
			{
			quest::emote("sings 'Ode to Korvik'");
			quest::emote("sings 'now a mail man'");
			}

		elsif ($wp == 7)
			{
			quest::emote("sings 'make Jusean his brother proud'");
			quest::emote("sings 'he knows that he can!'");
			quest::doanim (27);
			}

		elsif ($wp == 8)
			{
			quest::emote("sings 'Korvik is brave'");
			quest::emote("sings 'nothing can put him asunder'");
			}

		elsif ($wp == 9)
			{
			quest::emote("sings 'he completes his route'");
			quest::emote("sings 'even in rain and thunder!'");
			quest::doanim (67);
			}

		elsif ($wp == 10)
			{
			quest::emote("sings 'Neither snow nor sleet'");
			quest::emote("sings 'will slow him down'");
			}

		elsif ($wp == 11)
			{
			quest::emote("sings 'for Korvik knows he'");
			quest::emote("sings 'must get the mail to town!'");
			quest::doanim (48);
			}

		elsif ($wp == 12)
			{
			quest::emote("sings 'Ode to Korvik the mail carrier'");
			quest::emote("sings 'whom the doggies chase'");
			}

		elsif ($wp == 13)
			{
			quest::emote("sings 'and many a danger'");
			quest::emote("sings 'he knows he must face!'");
			quest::doanim (68);
			}

		elsif ($wp == 14)
			{
			quest::emote("sings 'A special suit of clothing'");
			quest::emote("sings 'to help him on his way'");
			}

		elsif ($wp == 15)
			{
			quest::emote("sings 'and for his safety'");
			quest::emote("sings to Karana we will pray!");
			quest::doanim (62);
			}

	}
#END of FILE Zone:qeynos  ID:1050 -- Sollari_Bekines
