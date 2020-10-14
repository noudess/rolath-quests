my $taskid=75;
my $containerid=17124;
my $bracerid=19602;
my $robeid=19600;

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
  }
  if($text=~/materials/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
		quest::say("Many species of dangerous creatures, the restless dead, and halfling invaders from Rivervale inhabit the Nektulos Forest. You must defeat these creatures and halflings in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]?");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}
  }
  if($text=~/boots/i) {
    quest::say("To craft Ashen Bone Mail Boots you require two [silk thread], two ruined ash drakeling scales, and two halfling foot bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561);
  }
  if($text=~/bracer/i) {
    quest::say("To craft an Ashen Bone Mail Bracer you require a [silk thread], a ruined ash drakeling scales, and a halfling ulna bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
    quest::summonitem(19558);
  }
  if($text=~/coif/i) {
    quest::say("To craft a Ashen Bone Mail Coif you require two [silk thread], a ruined ash drakeling scales, and a halfling skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555);
  }
  if($text=~/gloves/i) {
    quest::say("To craft Ashen Bone Mail Gloves you require two [silk thread], a ruined ash drakeling scales, and two halfling finger bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if($text=~/leggings/i) {
    quest::say("To craft Ashen Bone Mail Leggings you require three [silk thread], ash drakeling scales, two halfling tibia, and a halfling pelvis bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560);
  }
  if($text=~/sleeves/i) {
    quest::say("To craft Ashen Bone Mail Sleeves you require two [silk thread], ash drakeling scales, and two halfling humerus bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if($text=~/tunic/i) {
    quest::say("To craft an Ashen Bone Mail Tunic you require four [silk thread], pristine ash drakeling scales, a halfling sternum, and a halfling ribcage. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556);
  }
}

sub EVENT_ITEM 
	{	
	if(plugin::check_handin(\%itemcount, 19584 => 1)) 
		{
		quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
		quest::exp(500);
		quest::ding();
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
				quest::incstat(1,5); 	# STA
				quest::incstat(2,3);	# AGI
				quest::incstat(3,8);	# DEX
				quest::incstat(4,0);	# INT
				quest::incstat(5,0);	# WIS
				quest::incstat(6,2);	# CHA
				quest::enabletitle(43);
				quest::shout2("All hail $name of the Ebon Mask!"); 
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
