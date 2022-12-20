my $taskid=188;
my $containerid=17253;
my $robeid=9076;
my $titleid=92;
my $pre="Shortnoble";
my $fix="";

sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_ENTER
    {
    #:: Match a 18775 - Tattered Note
    if (plugin::check_hasitem($client, 18775))
        {
        $client->Message(15, "Iony Gredlong's tiny voice echoes throughout the room.  'Welcome to the Abbey of Deep Musing Cleshe.  I am Iony Gredlong, your new Guild Master should you accept the ways of the Clerics of the Deep Muses.  Read the note in your inventory and then hand it to me when you are ready to begin your training.'");
        }
    }

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("It is very nice to meet you $name. I am Iony Gredlong Priestess of the Underfoot. I coordinate all the training for new clerics here in the Deep Musing. If you are a [cleric] then I might just have some tests for you that will challenge your wisdom as well as your fighting abilities.");
		}
	if ($text =~ /trades/i)
		{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");

		#:: GIve a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
		}
	if ($text =~ /second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");

		#:: GIve a 51122 - Tradeskill Basics : Volume I
		quest::summonitem(51122);
		}
	if ($text =~ /cleric/i)
		{
		quest::say("Well you would certainly be eligible for my training then young $name. I have a number of armor recipes that I give to young clerics to make sure that when they leave the comfort of the Steamfont Mountains they are ready for whatever battles they may face. If you are [interested in creating your own armor] then all you must do is simply ask and I will give you instructions to get started.");
		}
	if ($text =~ /interested in creating/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("I am always happy to see an eager young one like yourself! Brell certainly takes pride in all young gnomes that draw power from him to give life so you should consider yourself very special. To create your own armor you are going to collect [various items] from Ak`Anon and Steamfont. You will then combine them in this assembly kit. Once you have made a material you will place it in a forge along with molds that I will present to you to create your armor.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if ($text =~ /various items/i)
		{
		quest::say("There are numerous items that you will need to collect and combine in your kit. I will present you for the recipe for Shortnoble Platemail [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to attempt a specific piece please let me know what piece you want to [craft] and I will give you the necessary mold along with the recipe.");
		}
	if ($text =~ /helm/i)
		{
		quest::say("Getting something on top of your head is a wise idea $name. To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Whisker, 1 Spiderling Silk and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Helm");
		quest::summonitem(22610);
		}
	if ($text =~ /bracer/i)
		{
		quest::say("Bracers are very important to keep your wrists safe in battle $name. To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Size 4 Gizmo, 1 Clockwork Spider Mesh and 1 Cloth Choker in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Bracer.");
		quest::summonitem(22611);
		}
	if ($text =~ /boots/i)
		{
		quest::say("Well you cant go running around the Steamfont Mountains with no shoes on now can you. To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Kobold Tooth, 2 Spiderling Silks and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Boots.");
		quest::summonitem(22612);
		}
	if ($text =~ /armguards/i)
		{
		quest::say("In order to keep those big muscles that all gnomes like us are blessed with you will definitely need some Armguards! To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 2 Harpy Wings and 1 Snake Fang in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Armguards.");
		quest::summonitem(22613);
		}
	if ($text =~ /greaves/i)
		{
		quest::say("Pants are most definitely an essential armor piece for any young cleric in training. To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 1 High Quality Cat Pelt, 1 Minotaur Scalp, 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Greaves.");
		quest::summonitem(22614);
		}
	if ($text =~ /gauntlets/i)
		{
		quest::say("Keeping your hands well protected is very important while you are in training. To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Brain and 2 Mountain Lion Claws in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Gauntlets.");
		quest::summonitem(22615);
		}
	if ($text =~ /breastplate/i)
		{
		quest::say("I believe you are ready to craft and gather the components for the most difficult piece of Shortnoble Platemail. To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Clockwork Spider Thorax Plate, 1 Brownie Parts, 1 Aviak Talon 1 Scrap Metal and the evil Halorniop`s Insignia in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shortnoble Platemail Breastplate. Return to me for one [final favor] I have to ask of you after you have completed your breastplate.");
		quest::summonitem(22616);
		}
	if ($text =~ /final favor/i)
		{
		quest::say("I thank you for returning to me young Gearsword. I must say that it is now quite clear that you are very capable of completing any task I should assign you due to your eagerness to learn. I am currently in need of a few specific items to craft a weapon worthy of any servant of Brell. It is my hope that I can pass these out to our new recruits quite soon. Will you [collect the items I require]?");
		}
	if ($text =~ /collect the items/i)
		{
		quest::say("I need 3 Flawless Harpy Claws and 1 Ebon Drake Backbone still to have all the items necessary to craft this new mace. Once I have these items I can make a Shortnobles Walking Staff. For your trouble I will offer you my first staff made should I be able to create one. I hope to see you soon!");
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
				quest::incstat(0,2); 	# STR
				quest::incstat(1,3); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,2);	# DEX
				quest::incstat(5,6);	# WIS
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

	if (plugin::check_handin(\%itemcount, 9105 => 3, 9106 => 1))
		{
		quest::say("Thank you! I am afraid due to your lateness that I cannot offer you the staff. This shard should serve you well though.");
		quest::summonitem(1264);    #Shard of Sorcery
		# Need faction/xp
		}

	if (plugin::check_handin(\%itemcount, 18775 => 1))
		{
		quest::say("Welcome to the Abbey of Deep Musing.  Here you can train and raise your abilities to the peak of perfection. Take this tunic and wear it with pride. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13517);    #worn felt tunic
		#Factions verified on live
		quest::faction(240, 100);      #Deep Muses
		quest::faction(288, 15);      #Merchants of Ak'Anon
		quest::faction(255, 15);      #Gem Choppers
		quest::faction(238, -15);    #Dark Reflection
        $client->AddLevelBasedExp(2.5, 1);
		quest::ding();
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
