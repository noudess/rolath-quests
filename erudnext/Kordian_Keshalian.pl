# erudnext deepwater knight armor
#
sub EVENT_SAY 
	{

	if ($text=~/hail/i) 
		{
		quest::say("Good day, $name, is there something I can help you with? I am currently training young paladins the way of our house so if you are a [paladin] perhaps we can start you off on the right path.");
		}

	if ($text=~/paladin/i) 
		{
		quest::say("All right then $name, lets see what you got. When you are ready to begin I will send you into the field to collect [various items].");
		}

	if ($text=~/various items/i) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("There are numerous items that you will need to collect and combine in your kit. I will present you with the recipe for Sentinel [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to attempt a specific piece please let me know what piece you wish to [craft] and I will give you the necessary mold along with the recipe.");
			my @task_array;
			push(@task_array, 38);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You have already been blessed");
			}
		}

	if ($text=~/helm/i) 
		{
		quest::say("To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Fire Beetle Leg, 1 Spider Silk and 1 Short Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Helm.");
		quest::summonitem(38911);
		}

	if ($text=~/bracer/i) 
		{
		quest::say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 2 Rat Whiskers, 1 Snake Scales and 1 Ration in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Bracer.");
		quest::summonitem(38907);
		}

	if ($text=~/armguard/i) 
		{
		quest::say("To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 1 Snake Fang, 1 Bone Chip and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Armguards.");
		quest::summonitem(38908);
		}

	if ($text=~/boot/i) 
		{
		quest::say("To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Rat Ear, 1 Fresh Fish and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Boots.");
		quest::summonitem(38910);
		}

	if ($text=~/greave/i) 
		{
		quest::say("To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 2 Fire Beetle Legs, 1 Kobold Head and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Greaves.");
		quest::summonitem(38913);
		}

	if ($text=~/gauntlet/i) 
		{
		quest::say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Skunk Tail, 1 Snake Venom Sac and 2 Bat Wings in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Gauntlets.");
		quest::summonitem(38909);
		}

	if ($text=~/breastplate/i) 
		{
		quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Skunk Eye, 1 Large Briar Snake Skin, 1 Snake Fang, 1 Skeleton Tibia, and 1 Snake Bile in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Breastplate. Return to me for one [final favor] I have to ask of you after you have completed your breastplate.");
		quest::summonitem(38912);
		}

	if ($text=~/final favor/i) 
		{
		quest::say("Well you see we have been having quite a problem with poachers benefiting off of our wildlife and I think as Paladins it is our duty to see that it does not continue. If you would like to help I will have you collect some [specific items] along with the head of a poacher.");
		}

	if ($text=~/specific items/i) 
		{
		quest::say("Return to me with 1 Large Briar Snake Skin, 1 Giant Wood Spider Thorax, 1 Plague Rat Tail and 1 Poachers Head to claim your reward.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 20355 => 1, 19660 => 1, 9131 => 1, 13825 => 1)) 
		{
		quest::say("Please accept this shard and sealer container.  With it you will be able to affix this shard to any weapon you choose to use.");
		quest::summonitem(1266);
		quest::exp(500);
		quest::ding();
		}

	if (quest::istaskactivityactive(38, 7))
		{
		# Turning in container sets the can't do this again flag.
		if (plugin::check_handin(\%itemcount, 61093 => 1))
			{
			quest::updatetaskactivity(38,7);
			}
		}

	if (quest::istaskactivityactive(38, 14))
		{
		if (plugin::check_handin(\%itemcount, 61150 => 1))
			{ # Robe gets you a title & stats
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,5);
				quest::incstat(1,6);
				quest::incstat(2,3);
				quest::incstat(3,3);
				quest::incstat(5,6);
				quest::incstat(6,3);
				if ($class eq "Paladin")
					{
					quest::enabletitle(5); 	# Paladin
					quest::shout2("All Hail Sentinel $name!."); 
					}
				quest::updatetaskactivity(38,14);
				}
			else
				{
				quest::summonitem(61150);
				}
			} 
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem(61093);
    quest::setglobal($varname,1,5,"F");
	}
# EOF zone: erudnext ID: 24098 NPC: Kordian_Keshalian

