my $taskid=68;
my $containerid=17124;
my $bracerid=19667;
my $robeid=19665;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I am busy right now. Please leave me alone."); #Text made up
  }
  if($text=~/thorn mail coif/i) {
    quest::say("To assemble a Thorn Mail Coif you will require two [silk thread], ruined thorn drakeling scales, and a giant thicket rat skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Coif Pattern.");
    quest::summonitem(19555,1);
  }
  if($text=~/thorn mail bracer/i) {
    quest::say("To assemble a Thorn Mail Bracer you will require a [silk thread], ruined thorn drakeling scales, and a large fruit bat wing. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
    quest::summonitem(19558,1);
  }
  if($text=~/thorn mail gloves/i) {
    quest::say("To assemble Thorn Mail Gloves you will require two [silk thread], ruined thorn drakeling scales, and two large fruit bat furs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559,1);
  }
  if($text=~/thorn mail boots/i) {
    quest::say("To assemble Thorn Mail Boots you will require two [silk thread], two ruined thorn drakeling scales, and two giant thicket rat pelts. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561,1);
  }
  if($text=~/thorn mail sleeves/i) {
    quest::say("To assemble Thorn Mail Sleeves you will require two [silk thread], thorn drakeling scales, and two giant fruit bat wings. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557,1);
  }
  if($text=~/thorn mail leggings/i) {
    quest::say("To assemble Thorn Mail Leggings you will require three [silk thread], two thorn drakeling scales. and two giant fruit bat furs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560,1);
  }
  if($text=~/thorn mail tunic/i) {
    quest::say("To assemble a Thorn Mail Tunic you will require four [silk thread], pristine thorn drakeling scales, a giant fruit bat rib cage, and a giant fruit bat fur. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556,1);
  }
  if($text=~/silk thread/i) {
    quest::say("To make silk thread, take 2 spiderling silks and combine them together in a loom or in your handy sewing kit."); #Text made up
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 19627 => 1)) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Pleased to meet you $name! You must be one of Megosh's new trainees. Megosh has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Thorn Mail armor you are planning on assembling. Do you wish to craft a [thorn mail coif], a [thorn mail bracer], [thorn mail gloves], [thorn mail boots], [thorn mail sleeves], [thorn mail leggings], or a [thorn mail tunic].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
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
		if (plugin::check_handin(\%itemcount, 19670 => 1))
			{ # robe is last step
			if (!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,3); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,7);	# DEX
				quest::incstat(4,2);	# INT
				quest::incstat(5,4);	# WIS
				quest::enabletitle(36);
				quest::shout2("All Hail Thorn Reaper $name!"); 
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
#END of FILE Zone:rivervale  ID:19046 -- Bipdo_Hargin
