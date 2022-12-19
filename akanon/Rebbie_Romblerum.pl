my $taskid=194;
my $containerid=17124;
my $robeid=11093;
my $titleid=90;
my $pre="Plague Walker";
my $fix="of the Rusty Daggers";

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name!");
		}
	if ($text =~ /silk thread/i)
		{
		quest::say("Silk Thread is created by combineing two spiderling silk in a sewing kit.");    #text is made up as i could not find the real text reply.
		}
	if ($text =~ /plague rust boots/i)
		{
		quest::say("To assemble Plague Rust Boots you will require two [silk thread], two ruined ebon drakeling scales, and two rebel clockwork foot plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		quest::summonitem(19561);
		}
	if ($text =~ /plague rust bracer/i)
		{
		quest::say("To assemble a Plague Rust Bracer you will require a [silk thread], ruined ebon drakeling scales, and a rebel clockwork wrist section. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
		quest::summonitem(19558);
		}
	if ($text =~ /plague rust gloves/i)
		{
		quest::say("To assemble Plague Rust Gloves you will require two [silk thread], ruined ebon drakeling scales, and two rebel clockwork hand plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		quest::summonitem(19559);
		}
	if ($text =~ /plague rust leggings/i)
		{
		quest::say("To assemble Plague Rust Leggings you will require three [silk thread], two ebon drakeling scales, and two rebel clockwork leg sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
		quest::summonitem(19560);
		}
	if ($text =~ /plague rust sleeves/i)
		{
		quest::say("To assemble Plague Rust Sleeves you will require two [silk thread], ebon drakeling scales, and two rebel clockwork arm sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		quest::summonitem(19557);
		}
	if ($text =~ /plague rust tunic/i)
		{
		quest::say("To assemble a Plague Rust Tunic you will require four [silk thread], pristine ebon drakeling scales, a giant rat pelt, and a rebel clockwork chest plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		quest::summonitem(19556);
		}
	if ($text =~ /plague rust coif/i)
		{
		quest::say("To assemble a Plague Rust Coif you will require two [silk thread], ruined ebon drakeling scales, and a rebel clockwork head plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		quest::summonitem(19555);
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
				quest::incstat(1,5); 	# STA
				quest::incstat(2,3);	# AGI
				quest::incstat(3,6);	# DEX
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

	if (plugin::check_handin(\%itemcount, 10988 => 1))
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Hail $name! You must be one of Kaxon's new trainees. Kaxon has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Rust Mail you are planning on assembling. Do you wish to craft, a [plague rust bracer], [plague rust gloves], [plague rust boots], [plague rust sleeves], [plague rust leggings], or a [plague rust tunic].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}

		}

	plugin::return_items(\%itemcount);
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
