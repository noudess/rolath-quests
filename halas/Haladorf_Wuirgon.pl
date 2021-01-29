my $taskid=63;
my $containerid=55352;
my $bracerid=55333;
my $robeid=55351;

sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{ 
		quest::say("Welcome. If you are a young [berserker] wishing to begin your training, I can perhaps be of assistance.");
		}
	elsif($text=~/berserker/i)
		{
		quest::say("Tell me, do you feel the rage inside? If you truly wish to become a powerful berserker, you must let your rage consume you. Others will shun you, will call you an animal. But I will tell you this, my friend; they will appreciate our powers on the field of battle. The rage is our way of life. Ours is a lost way of life, and I seek to change that. The berserker way will be known again. If you truly feel the rage inside your soul, I will assist you with the making of your Order of the Rabidwolf [armor].");
		}
	elsif($text=~/armor/i)
		{
		quest::say("While a true berserker shouldnt need a suit of armor to battle his foes, this armor will show your dedication to our cause and will offer you added protection while you are still learning our ways. And truth be told, there are times when our rage alone is enough to protect us from the claws of savage beasts. When you are [ready to begin] your training, let me know.");
		}
	elsif($text=~/ready to begin/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Here is your assembly kit. With this kit, you will be able to combine the various components necessary to make your armor. I can instruct you on how to make [boots], [leggings], [bracers], [gloves], a [coif], a [gorget], and a [tunic]. I suggest you wait to make the tunic last, as it is the most difficult item to construct.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	elsif($text=~/boots/i)
		{
		quest::say("To craft Rabidwolf Boots, you must find two small pieces of ore, one spiderling legs, and one polar bear skin. Once your have combined these items in your assembly kit, take the Order of the Rabidwolf Material to a forge along with this mold to create your new boots.");
		quest::summonitem(55347); #rabidwolf boot mold
		}
	elsif($text=~/bracers/i)
		{
		quest::say("To craft a Rabidwolf Bracer, find two small pieces of ore, two bone chips, and one polar bear skin. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Bracer Material to a forge along with this mold to create your new bracer.");
		quest::summonitem(55345); #rabidwolf bracer mold
		} 
	elsif($text=~/coif/i)
		{
		quest::say("To craft a Rabidwolf Coif, find two small pieces of ore, two gnoll pup scalps, and one bone chips. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Coif Material to a forge along with this mold to create your new coif.");
		quest::summonitem(55344); #rabidwolf coif mold
		}
	elsif($text=~/gloves/i)
		{
		quest::say("To craft Rabidwolf Gloves, find one small piece of ore, three bone chips, and two ruined wolf pelts. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Glove Material to a forge along with this mold to create your new gloves.");
		quest::summonitem(55349); #rabidwolf glove mold
		}
	elsif($text=~/gorget/i)
		{
		quest::say("To craft a Rabidwolf Gorget, find one small piece of ore, one ruined wolf pelt, one patch of gnoll fur, and two bone chips. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Gorget Material to a forge along with this mold to create your new gorget.");
		quest::summonitem(55346); #rabidwolf gorget mold
		}
	elsif($text=~/leggings/i)
		{
		quest::say("To craft Rabidwolf Leggings, find one small piece of ore, one ruined wolf pelt, one bone chips, and two spiderling legs. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Leggings Material to a forge along with this mold to create your new leggings.");
		quest::summonitem(55348); #rabidwolf leggings mold
		}
	elsif($text=~/tunic/i)
		{
		quest::say("This is the most difficult piece of your armor that you will create. To craft a Rabidwolf Tunic, find three small pieces of ore, one polar bear skin, one ruined wolf pelt, and one spider venom sac. Once you have combined these items in your assembly kit, take the Order of the Rabidwolf Tunic Material to a forge along with this mold to create your new tunic. If you are successful in creating your tunic, I may have another [task] for you.");
		quest::summonitem(55350); #rabidwolf tunic mold
		}
	elsif($text=~/task/i)
		{
		quest::say("A true berserker is afraid of nothing. Prove to me that you are worthy of your final reward. Venture to the home of the gnolls, Blackburrow and find one gnoll sternum, one severed gnoll foot, one gnoll foot bones, and one giant snake rattle. Once you have these items, hand them to me.");
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
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,5); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,7);	# AGI
				quest::incstat(3,2);	# DEX
				quest::enabletitle(33);
				quest::shout2("All Hail Rabid Wolf $name!"); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem($robeid);
				}
			} 
		}

	#handin: 1x gnoll sternum, 1x severed gnoll foot, 1x gnoll foot bones, 1x giant snake rattle
	if(plugin::check_handin(\%itemcount, 20184 => 1, 27409 => 1, 20179 => 1, 13058 => 1))
		{
		quest::say("Well done, $name.  Take this shard, and use it with pride!");
		quest::summonitem(1266);
		quest::exp(500);
		quest::ding();
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
