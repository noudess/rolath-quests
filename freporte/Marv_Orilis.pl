my $taskid=92;
my $containerid=17125;
my $robeid=19915;
my $titleid=60;
my $pre="Rage Sorceror";
my $fix="";

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Yes? I am a very busy man. I assist new necromancers, wizards, magicians, and enchanters that have joined the Dismal Rage. Are you a sorcerer that has [recently joined] us? ");
  }
  
  if ($text=~/recently joined/i) {
    quest::say("Then I welcome you to the path of rage. We sorcerers fulfill a crucial role within the Dismal Rage. Under the guidance of Opal Darkbriar, a founder of our order, we study the darkest aspects of the various sorcerous arts so that we may aid and bring power to others who follow our patron deity, Innoruuk, the Prince of Hate. If you desire I will help you obtain a suit of [protective clothing] suitable for a practitioner of the sorcerous arts. Once you have been properly outfitted, return to me and I will aid you in obtaining a [Staff of Dismal Rage].");
  }
  
  if ($text=~/protective clothing/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
    	quest::say("You will require this Curing Kit to craft your clothing and robe. The materials required vary depending on the article of clothing you desire to craft. Do you desire to craft a [rage sorcerer cap], [rage sorcerer wristband], [rage sorcerer gloves], [rage sorcerer boots], [rage sorcerer sleeves], [rage sorcerer pantaloons], or [rage sorcerer robe]?");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}

  }
  
  if ($text=~/rage sorcerer cap/i) {
  quest::say("To craft a Rage Sorcerer Cap you will require two [silk thread], gila monster hatchling bile, and a young gila monster skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
  quest::summonitem(19555);
   }
   
   if ($text=~/rage sorcerer wristband/i) {
   quest::say("To craft a Rage Sorcerer Wristband you require a [silk thread], gila monster hatchling bile, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
   quest::summonitem(19558);
        }
    
    if ($text=~/rage sorcerer gloves/i) {
    quest::say("To craft Rage Sorcerer Gloves you require two [silk thread], gila monster hatchling bile, two desert spiderling hairs, and a young gilla monster skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
          }
          
    if ($text=~/rage sorcerer boots/i) {
      quest::say("To craft Rage Sorcerer Boots you require two [silk thread], gila monster hatchling bile, and two ruined coyote pelts. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
      quest::summonitem(19561);
       }
       
    if ($text=~/rage sorcerer sleeves/i) {
      quest::say("To craft Rage Sorcerer Sleeves you require two [silk thread], young gila monster bile, and two young gilla monster skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
      quest::summonitem(19557);
    }
    
    if ($text=~/rage sorcerer pantaloons/i) {
      quest::say("To craft Rage Sorcerer Pantaloons you require two [silk thread], young gila monster bile, and four young gila monster skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
      quest::summonitem(19560);
    }
    
    if ($text=~/rage sorcerer robe/i) {
      quest::say("To craft a Rage Sorcerer Robe you will require three [silk thread], gila monster bile, two gila monster skins, and a desert tarantula hairs. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
      quest::summonitem(19556);
    }
    
    if ($text=~/staff of dismal rage/i) {
      quest::say("The Dismal Rage has many enemies still here in Freeport that would uncover us and see us destroyed. Lately a wizard of the Arcane Scientists, Yovik Splegle, has been asking questions about Opal Darkbriar. Find this inquisitive wizard and silence him for good. When you have completed the task return to me with the wizards head.");
    }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 19935 =>1 ))
		{
		quest::say("Poor, poor Yovik Splegle. Haha! Excellent work, $name. Quickly, fetch me a giant rattlesnake skin and a giant leaf scarab eye along with this Rough Hewn Dismal Staff and I will construct you the Staff of Dismal Rage before your very eyes.");
		quest::summonitem(19924);
		}

	if (plugin::check_handin(\%itemcount, 19924 =>1, 19852 =>1, 19936 =>1 )) 
		{
		quest::say("Nicely done, $name.  This staff will serve me well.  I suppose you want something for yourself?  Take this and carry on.");
		quest::summonitem(1264); # Rolath Shard of Sorcery
		quest::exp(100);
		#Factions Veriffied on Zam
		quest::faction(271,10);
		quest::faction(281,-1);
		quest::faction(296,2);
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
				quest::incstat(2,6);	# AGI
				quest::incstat(3,3);	# DEX
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
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
