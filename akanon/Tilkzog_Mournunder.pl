my $taskid=191;
my $containerid=17125;
my $robeid=11394;
my $titleid=88;
my $pre="Plague Sorceror";
my $fix="";

sub EVENT_SAY
	{
	if ($text =~ /silk thread/i)
		{
		quest::say("To create silk thread, combine 2 spiderling silk inside a tailoring kit.");
		}
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name. I am Tilkzog Mournunder, Necromancer of the Dark Reflection. It is my duty here to assist not only the young necromancers of the Dark Reflection but also those wizards, magicians, and enchanters that have been called into the service of the Plague Bringer. I will aid you in obtaining an outfit of [durable clothing] suitable for a young sorcerer of the Dark Reflection. Once you have been adequately outfitted for venturing beyond our homeland in service of the Plague Bringer return to me and I will assist you in obtaining a [staff of dark reflections].");
		}
	if ($text =~ /staff of dark reflections/i)
		{
		quest::say("The Dark Reflection has many enemies even within our home of Ak'Anon and the surrounding Steamfont Mountains. Many fear and oppose the beliefs that grant us our vision and powers. A wizard of the Eldrich Collective by the name of Winex Kloktik has been aiding members of the Deep Muses hunt and slay those loyal to Bertoxxulous and the Dark Reflection. Seek Winex Kloktik and eliminate her. When you have completed this task bring me Winex's Staff.");
		}
	if ($text =~ /durable clothing/i)
		{
		quest::say("The sorcerous servants of Bertoxxulous, the Plague Bringer, are privileged with the sight of the Dark Reflection. This gift enlightens us to the powers of disease, decay, death, and destruction. Forces that are misunderstood and feared by the majority of Norrath, including our fellow gnomes of Ak'Anon. These forces are the catalyst of change, cleansing Norrath of the old and weak, and we are the agents of this catalyst. However, before you will be of much use to the Dark Reflection you must gather the [components] necessary for the outfit that will protect and aid you in your duties.");
		}
	if ($text =~ /components/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("You will need this Curing Kit and varying components depending on the piece of clothing you wish to fabricate. Do you desire to craft a [plague sorcerer cap], [plague sorcerer wristband], [plague sorcerer gloves], [plague sorcerer boots], [plague sorcerer sleeves], [plague sorcerer pantaloons], or [plague sorcerer robe]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	if ($text =~ /plague sorcerer boots/i)
		{
		quest::say("To craft Plague Sorcerer Boots you require two [silk thread], two ebon drakeling bile, and two large rat pelts. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		quest::summonitem(19561);
		}
	if ($text =~ /plague sorcerer cap/i)
		{
		quest::say("To craft a Plague Sorcerer Cap you will require two [silk thread], ebon drakeling bile, and a grikbar kobold scalp. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		quest::summonitem(19555);
		}
	if ($text =~ /plague sorcerer gloves/i)
		{
		quest::say("To craft Plague Sorcerer Gloves you require two [silk thread], ebon drakeling bile, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		quest::summonitem(19559);
		}
	if ($text =~ /plague sorcerer pantaloons/i)
		{
		quest::say("To craft Plague Sorcerer Pantaloons you require two [silk thread], young ebon drake bile, and four yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		quest::summonitem(19560);
		}
	if ($text =~ /plague sorcerer robe/i)
		{
		quest::say("To craft a Plague Sorcerer Robe you will require three [silk thread], ebon drake bile, a giant rat pelt, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		quest::summonitem(19556);
		}
	if ($text =~ /plague sorcerer sleeves/i)
		{
		quest::say("To craft Plague Sorcerer Sleeves you require two [silk thread], young ebon drake bile, and three yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		quest::summonitem(19557);
		}
	if ($text =~ /plague sorcerer wristband/i)
		{
		quest::say("To craft a Plague Sorcerer Wristband you require a [silk thread], ebon drakeling bile, and a large rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		quest::summonitem(19558);
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

	if (plugin::check_handin(\%itemcount, 10994 => 1))
		{
		quest::say("It is good to know that one so zealously opposed to the Dark Reflection has been eliminated. Take this Rough Hewn Staff and when you have acquired a Harpies Eye and Pristine Ebon Drakeling Scales take the Staff, Eye, and Scales to Clockwork SmithXIII. The clockwork will put the finishing touches on your new staff.");
		quest::summonitem(10999);
		#factions per ZAM
		quest::faction(238,10); # Dark Reflection
		quest::faction(245,-1); # Eldritch Collective
		quest::faction(255,-1); # Gem Choppers
		quest::faction(240,-1); # Deep Muses
		quest::exp(29127); # Matched Garret's #s
		quest::ding();
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
