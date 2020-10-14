my $taskid=80;
my $containerid=17124;
my $bracerid=19595;
my $robeid=19593;


sub EVENT_SAY 
	{
	if ($text=~/materials/i) 
		{
		quest::say("Many species of dangerous creatures and even the walking remains of the dead inhabit the Nektulos Forest. You must defeat these creatures and undead in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]?");
		}
	if ($text=~/boots/i) 
		{
		quest::say("To craft Bone Mail Boots you require two [silk thread], two ruined wolf pelts, and two calcified foot bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Boot Pattern.");
		quest::summonitem(19561);
		}
	if ($text=~/bracer/i) 
		{
		quest::say("To craft a Bone Mail Bracer you require a [silk thread], a ruined wolf pelt, and a calcified ulna bone. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Bracer Pattern.");
		quest::summonitem(19558);
		}
	if ($text=~/coif/i) 
		{
		quest::say("To craft a Bone Mail Coif you require two [silk thread], a ruined wolf pelt, and a calcified skull. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Cap Pattern.");
		quest::summonitem(19555);
		}
	if ($text=~/gloves/i) 
		{
		quest::say("To craft Bone Mail Gloves you require two [silk thread], a ruined wolf pelt, and two calcified finger bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Glove Pattern.");
		quest::summonitem(19559);
		}
	if ($text=~/leggings/i) 
		{
		quest::say("To craft Bone Mail Leggings you require three [silk thread], a low quality wolf pelt, two calcified tibia, and a calcified pelvis. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Leggings Pattern.");
		quest::summonitem(19560);
		}
	if ($text=~/sleeves/i) 
		{
		quest::say("To craft Bone Mail Sleeves you require two [silk thread], a low quality wolf pelt, and two calcified humerus bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Sleeves Pattern.");
		quest::summonitem(19557);
		}
	if ($text=~/tunic/i) 
		{
		quest::say("To craft a Bone Mail Tunic you require four [silk thread], a medium quality wolf skin, a calcified sternum, and a calcified ribcage. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Tunic Pattern.");
		quest::summonitem(19556);
		}
	if ($text=~/silk thread/i) 
		{
		quest::say("Silk Thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
		}
	if (($text=~/sewing kit/i) || ($text=~/loom/i)) 
		{
		quest::say("A sewing kit may be purchased at the Furrier Royale in Neriaks Third Quarter or at the Silk Underground in Neriaks Foreign Quarter. A community loom may be found at the Silk Underground in Neriaks Foreign Quarter.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 19584 => 1)) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("So you are one of Ulraz's new recruits. You are to assist in the construction of the armor you will don as a new Shadowknight of the Lodge of the Dead. I have assembled a kit that is used in the crafting of Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	elsif (quest::istaskactivityactive($taskid, 7))
		{
		if (plugin::check_handin(\%itemcount, $containerid => 1))
			{
			quest::updatetaskactivity($taskid,7);
			}
		}

	elsif (quest::istaskactivityactive($taskid, 14))
		{
		if (plugin::check_handin(\%itemcount, $robeid => 1))
			{ # robe is last step
			if (!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,5); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,3);	# DEX
				quest::incstat(4,7);	# INT
				quest::incstat(5,0);	# WIS
				quest::incstat(6,0);	# CHA
				quest::enabletitle(44);
				quest::shout2("All Hail Bone Knight $name!"); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem($robeid);
				}
			} 
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
#END of FILE Zone:neriakb  ID:41046 -- Krivn_S`Ta
