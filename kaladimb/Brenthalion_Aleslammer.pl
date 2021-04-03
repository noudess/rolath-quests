my $taskid=111;
my $containerid=17249;
my $robeid=27591;
my $titleid=77;
my $pre="Defender";
my $fix="of Underfoot";

sub EVENT_SAY
    {
    if ( $text =~ /hail/i )
        {
        quest::say("Lo dere $name! I be Brenthalion Aleslammer Holy Defender of Brell! I can see that ye found my temple of Brell that I have resided over for many years. I have been appointed by da King Kazon himself to make sure dat all our young paladins get da [training] dey need before dey go out to explore da world. Aye.");
        }
    if ( $text =~ /training/i )
        {
        quest::say("Ye see $name, learning all the correct fighting tactics along with learning your way around your homeland can be no easy task for a young one new to Kaladim. That is why I have developed a series of training exercises that help me monitor our young ones as they progress through the ranks of the Paladin on their path to true enlightenment! If you are a young [paladin] of Brell I would be happy to explain to you how the exercises work and I would also recommend that you take part in them!");
        }
    if ( $text =~ /paladin/i )
        {
        quest::say("Well I would be lyin if`n hearing dose words didn't bring a smile to me face every time that I hear dem. First thing you will need a Magical Mail Assembly Kit that you will use to combine different magical items in that will create an armor material. Once you have created a armor material you can then take it to a forge along with a armor mold to fashion an armor piece. If you are able to collect all the items for them you will have the potential to make a full set of Underfoot Defenders Platemail! If`n ye are [ready to begin] collecting yer items I will be happy to give you your Magical Mail Assembly Kit and git you started!");
        }
    if ( $text =~ /ready to begin/i )
        {
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Excellent $name! Here is your Magical Mail Assembly Kit. Once you are ready to collect the items for a specific armor piece simply tell me what piece of Underfoot Defenders Platemail that you want to craft. I can provide you with the material recipe and enchanted armor molds for Underfoot Platemail [Helm], [Bracer], [Armguards], [Boots], [Greaves], [Gauntlets], and [Breastplate].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
        }
    if ( $text =~ /armguards/i )
        {
        quest::say(
            "To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 2 Scarab Legs, and 1 Spiderling Silk in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Armguards."
            );
        quest::summonitem(19635);
        }
    if ( $text =~ /boots/i )
        {
        quest::say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Aqua Goblin Foot, 2 Ogre Jawbones in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Boots.");
        quest::summonitem(19634);
        }
    if ( $text =~ /bracer/i )
        {
        quest::say("To create yer bracer material you will need to combine 1 Brick of Crude Bronze, 1 RunnyEye Warbeads, 1 Shattered Warbeads and 1 Gypsy Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Bracer.");
        quest::summonitem(19632);
        }
    if ( $text =~ /breastplate/i )
        {
        quest::say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Scarab Carapace, 1 Golden Bandit Tooth, 1 Pristine Forest Drakeling Scale, 1 Skunk Tail and 1 Enraged Goblin Beads in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Breastplate. When you have finished completing your armor set I would like you to return to me for I have one [final task] for you to complete. Aye.");
        quest::summonitem(19637);
        }
    if ( $text =~ /final task/i )
        {
        quest::say("Da final task is simply dere young $name. I myself likes to collect many trophies as well as beer steins ye see. Well sense my days have been occupied by trainin da newest up and coming lads and lasses I haven't gotten a chance to go prize hunting like I once did. So if`n yer up for da task I would like ye to collect me some [valuable trophies] fer my collection.");
        }
    if ( $text =~ /valuable trophies/i )
        {
        quest::say("There are 3 signifigant trophies I would love to have fer me trophy room. If ye can collect and bring me 1 Enraged Goblin Beads, 1 Green Goblin Head and 1 Aqua Goblin Head I will surely reward ye with a blade worthy of the finest defenders Brell has to offer. Aye.");
        }
    if ( $text =~ /gauntlets/i )
        {
        quest::say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Margyls Tongue, 1 Insignia of Greenblood, and 2 Rock Spiderling Legs in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Gauntlets.");
        quest::summonitem(19633);
        }
    if ( $text =~ /greaves/i )
        {
        quest::say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 1 Basilisk Tongue, 1 Orc Skull , and 1 Scarab Eye in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Greaves.");
        quest::summonitem(19636);
        }
    if ( $text =~ /helm/i )
        {
        quest::say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Aviak Eye, 1 Goblin Skull and 1 Ration in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Underfoot Defenders Helm.");
        quest::summonitem(19631);
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
				quest::incstat(2,3);	# AGI
				quest::incstat(3,3);	# DEX
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

    if ( plugin::check_handin( \%itemcount, 2396 => 1, 28065 => 1, 28066 => 1 ) )
        {
        quest::say("Dese will surely be a great addition to me trophy room $name! I knew I could count on you to not have a problem collecting these things for me. As I promised, I have prepared you a magical shard that will surely guide you to victory wherever your travels may take you. Gud luck to ye $name");
        quest::summonitem(1266);
		# Factions verified on Zam
		quest::faction(227, 20);    #:: + Clerics Of Underfoot
		quest::faction(274, 20);    #:: + Kazon Stormhammer
		quest::faction(293, 15);    #:: + Miner's Guild 249
        }

    plugin::try_tome_handins( \%itemcount, $class, 'Paladin' );
    }

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
