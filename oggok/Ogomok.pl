# Add this at start to simplify
my $taskid=82;
my $containerid=55398;
my $bracerid=55379;
my $robeid=55383;
my $titleid=52;
my $pre="Strongbear";
my $fix="";

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Who you be? You fight with anger in your veins? You think you strong [berserker]?");
		}
	if($text=~/berserker/i) 
		{
		quest::say("You weak! Me teach you to be strong! Wot you think about that? Me teach you to make starting [armor].");
		}
	if($text=~/armor/i) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Dis be armor only for strong berserker ogres. Me not sure if you are good enough, but we soon find out. If you pass, you get armor. If you fail, you die. Take dis kit. You put stuff in there and combine it to make Strongbear Armor. Wot you want to craft first? I can teach how to make [boots], [bracer], [coif], [gloves], [gorget], [leggings], and [tunic]. Tunic be hardest to make.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if($text=~/boots/i) 
		{
		quest::say("To make da Strongbear Boots, youz need to find one small piece of ore, one yellow lizard scale, one low quality bear skin, and one black spider silk. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Boots Material to a forge with dis mold to make your new boots.");
		quest::summonitem(55394); #Strongbear Boots Mold
		}
	if($text=~/bracer/i) 
		{
		quest::say("To make a Strongbear Bracer, youz need to get one small piece of ore, two bone chips, and one yellow lizard scale. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Bracer Material to a forge, with dis mold to make your new bracer.");
		quest::summonitem(55392); #Strongbear Bracer Mold
		}
	if($text=~/coif/i) 
		{
		quest::say("To make Strongbear Coif, youz need to get one small piece of ore, one pristine lizard talon, one dark colored fungus, and one yellow lizard scale. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of day itemz, combine dem in your assembly kit and take da Strongbear Coif Material to a forge, with dis mold to make your new coif.");
		quest::summonitem(55391); #Strongbear Coif Mold
		}
	if($text=~/gloves/i) 
		{
		quest::say("To make Strongbear Gloves, youz need to get one small piece of ore, two pristine lizard talons, one bone chips, and one yellow lizard scale. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Gloves Material to a forge, with dis mold to make your new gloves.");
		quest::summonitem(55396); #Strongbear Gloves Mold
		}
	if($text=~/gorget/i) 
		{
		quest::say("To make Strongbear Gorget, youz need to get one small piece of ore, one pristine lizard talon, one long lizard tail, and one yellow lizard scale. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Gorget Material to a forge, with dis mold to make your new gorget.");
		quest::summonitem(55393); #Strongbear Gorget Mold
		}
	if($text=~/leggings/i) 
		{
		quest::say("To make da Strongbear Leggings, youz need to get one small piece of ore, one yellow lizard scale, one pristine lizard talon, and one low quality bear skin. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Leggings Material to a forge, with dis mold to make your new leggings.");
		quest::summonitem(55395); #Strongbear Leggings Mold
		}
	if($text=~/tunic/i) 
		{
		quest::say("You tink you can do dis? It be da most diffa...Diffikclt...Hardest piece to make. If youz tink you ready, youz need ta get one thick grizzly bear skin, two small pieces of ore, two yellow lizard scales, and one bone chips. Mebba youz can find da animal partz out in Feerrott. For da ore, mebbe you can find somewhere here in da city. Once you have all of da itemz, combine dem in your assembly kit and take da Strongbear Tunic Material to a forge, with dis mold to make your new tunic. When you done wit dat, come back ere and mebbe me have anuder [ting] for you to do. Wot you think about that?");
		quest::summonitem(55397); #Strongbear Tunic Mold
		}
	if($text=~/ting/i) 
		{
		quest::say("You say you filled with da rage? Me have da rage too. My rage start when my luv, Hooly Bubblegut got killed by nasty basilisks in da Rathe Mountains! Me want revenge!!!");
		quest::emote("'s face turns bright red.");
		quest::say("You go to doze mountains and kill basilisks. Me want four basilisk tongues. You bring me dem, and me give you reword.");
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
				quest::incstat(2,10);	# AGI
				quest::incstat(3,3);	# DEX
				quest::incstat(4,0);	# INT
				quest::incstat(5,0);	# WIS
				quest::incstat(6,0);	# CHA
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
	if(plugin::check_handin(\%itemcount, 12160 => 4)) #Basilisk Tongue x 4
		{
		quest::say("You good! You help me much. Me give you dis! Me heart still hurt for Hooly be me rage comfortz me.");
		quest::exp(250);
		quest::ding();
		quest::summonitem(1266); #Shard of Battle
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

# EOF
