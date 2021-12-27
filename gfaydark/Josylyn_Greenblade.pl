my $taskid=122;
my $containerid=17124;
my $robeid=20307;
my $titleid=87;
my $pre="Emerald Warrior";
my $fix="";

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings $name. It is my duty to teach young Fier`Dal the arts of defense and fighting so that they may become skilled members of the Emerald Warriors. There are many [threats] facing our forests and our home Kelethin, thus we warriors must be prepared both physically and mentally to defend our people. It is wise for all young Emerald Warriors to acquire a [suit of armor] to protect them from the weapons of our enemies.");
		}
	if ($text =~ /suit of armor/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("You will require this specially prepared Mail Assembly Kit to assemble a suit of Emerald Novice Armor. The required materials vary depending on the piece of armor you seek to craft. Once you have been properly outfitted return to me and I will present you with another [task]. Do you seek to craft [Emerald Novice Gauntlets], [Emerald Novice Boots], an [Emerald Novice Bracer], an [Emerald Novice Helm], [Emerald Novice Greaves], [Emerald Novice Vambraces], or an [Emerald Novice Breastplate]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if ($text =~ /what task/i)
		{
		quest::say("Although our city of Kelethin gains much protection from its construction in the treetops of the Faydark, like all things it has weaknesses in its defenses. The Crushbone Orcs often attempt to ignite the trees with the fires of their torches. Young Emerald Warriors are often stationed on the forest floor beneath Kelethin to watch for these orc arsonists and stop them. Go now to the forest floor and should you catch one of these orcs slay him and bring me his orcish torch.");
		}
	if ($text =~ /what threats/i)
		{
		quest::say("The threats that face Tunares children here in the Faydarks are many, some more obvious than others. The orcish Clan Crushbone has a citadel to the north and is perpetually invading the Faydarks in order to pillage supplies and expand their territory. The foolish pixies that inhabit the forests often cause harm to the trees and animals with their mischievous pranks, and recently the [Arboreans] have returned from centuries of slumber.");
		}
	if ($text =~ /what arboreans/i)
		{
		quest::say("The Arboreans are an ancient species of sentient plant-folk. Their sentience however does not manifest as intelligence or wisdom. They are little more than mobile weeds, multiplying quickly and draining the nutrients from the soil and flora they come into contact with. Old legends from when our people first migrated to Faydwere from the Eldarr Forest of Tunaria tell of a great famine caused by the Arboreans. The Heartwood Master and his most blessed of druids wove powerful magics that destroyed the Arboreans, but some of their seeds endured, buried in the soil for centuries, and recently they have sprouted and are once again destroying our beloved forests.");
		}
	if ($text =~ /gauntlets/i)
		{
		quest::say("To assemble emerald novice gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Forest Drakeling Scales and two Arborean Sprout Twigs in the Mail Assembly Kit.");
		quest::summonitem("19633");
		}
	if ($text =~ /boots/i)
		{
		quest::say("To assemble emerald novice boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Forest Drakeling Scales, and two Arborean Sprout Roots in the Mail Assembly Kit.");
		quest::summonitem("19634");
		}
	if ($text =~ /bracer/i)
		{
		quest::say("To assemble an emerald novice bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Forest Drakeling Scales and an Arborean Sprout Bark in the Mail Assembly Kit.");
		quest::summonitem("19632");
		}
	if ($text =~ /helm/i)
		{
		quest::say("To assemble an emerald novice helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Forest Drakeling Scales and an Arborean Sapling Bark in the Mail Assembly Kit.");
		quest::summonitem("19631");
		}
	if ($text =~ /greaves/i)
		{
		quest::say("To assemble emerald novice greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Forest Drakeling Scales and two Arborean Sapling Barks in the Mail Assembly Kit.");
		quest::summonitem("19636");
		}
	if ($text =~ /vambraces/i)
		{
		quest::say("To assemble emerald novice vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Forest Drakeling Scales and two Arborean Sapling Barks in the Mail Assembly Kit.");
		quest::summonitem("19635");
		}
	if ($text =~ /breastplate/i)
		{
		quest::say("To assemble an emerald novice breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Pristine Forest Drakeling Scales, and two Mature Arborean Barks in the Mail Assembly Kit.");
		quest::summonitem("19637");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 20281 => 1))
		{
		quest::summonitem(20294);
		quest::say("Good work $name!  Take this Dull Emerald Novice Sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are not familiar with the process. Once that is accomplished, bring me the Sharp Emerald Novice Sword, a Pristine Forest Drakeling Scales, and an Arborean Amber. I will put the finishing touches on the sword, it will make a fine weapon for one of our more experienced defenders.");
		#faction per ZAM
		quest::faction(326, 5); #Emerald Warriors
		quest::faction(276, 1); #Kelethin Merchants
		quest::faction(325, 1); #Merchants of Felwithe
		quest::faction(270, -1); #Indigo Brotherhood
		quest::exp(100);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 20298 => 1, 20274 => 1, 20271 => 1))
		{
		quest::emote("fashions a grip out of the pristine forest drakeling scales, fastens the arborean amber to the pommel of the weapon, and polishes the blade with a luminescent substance.");
		quest::say("Thank you $name, please take this shard of Rolath and put it to good use.");
		quest::summonitem(1266);
		#faction per ZAM
		quest::faction(326, 5); #Emerald Warriors
		quest::faction(276, 1); #Kelethin Merchants
		quest::faction(325, 1); #Merchants of Felwithe
		quest::faction(270, -1); #Indigo Brotherhood
		#Give 8% exp up to level 10
		$client->AddLevelBasedExp(8,10);
		quest::ding();
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
				quest::incstat(2,5);	# AGI
				quest::incstat(3,5);	# DEX
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

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

