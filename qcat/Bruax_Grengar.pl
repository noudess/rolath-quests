#
my $taskid=47;
my $containerid=17125;
my $fang_count=0;
my $skin_count=0;
my $eye_count=0;
my $staff_count=0;
	

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail $name. I am Bruax Grengar, master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the [sorcerous arts]. If you a practitioner of a sorcerous art I can give you instructions to obtain an [outfit and robe] that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a [Staff of the Bloodsabers].");
  }
  if($text=~/sorcerous arts/i) {
    quest::say("I speak of those who practice the sorcerous arts other than necromancy: the arts of Enchantment, Magery, and Wizardry. It is a common misnomer proclaimed by those uneducated to the ways of the Plague Bringer that only Shadowknights and Necromancers serve Bertoxxulous. In fact this temple alone has members from all walks of life, from tailors, scholars, and blacksmiths to warriors and sorcerers.");
  }
  if ($text=~/outfit/i) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("I have prepared this special curing kit for the crafting of an outfit and robe. The materials required for each article of clothing vary. Do you desire to craft a [scourge sorcerer cap], [scourge sorcerer wristband], [scourge sorcerer gloves], [scourge sorcerer boots], [scourge sorcerer sleeves], [scourge sorcerer pantaloons], or [scourge sorcerer robe]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
	  }

  if ($text=~/cap/i) {
    quest::say("To craft a Scourge Sorcerer Cap you will require two [silk thread], klicnik drone bile, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555);
  }
  if ($text=~/wristband/i) {
    quest::say("To craft a Scourge Sorcerer Wristband you require a [silk thread], klicnik drone bile, and a king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
    quest::summonitem(19558);
  }
  if ($text=~/gloves/i) {
    quest::say("To craft Scourge Sorcerer Gloves you require two [silk thread], klicnik drone bile, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if ($text=~/boots/i) {
    quest::say("To craft Scourge Sorcerer Boots you require two [silk thread], klicnik drone bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561);
  }
  if ($text=~/sleeves/i) {
    quest::say("To craft Scourge Sorcerer Sleeves you require two [silk thread], klicnik warrior bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if ($text=~/pantaloons/i) {
    quest::say("To craft Scourge Sorcerer Pantaloons you require two [silk thread], klicnik warrior bile, and four large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560);
  }
  if ($text=~/robe/i) {
    quest::say("To craft a Scourge Sorcerer Robe you will require three [silk thread], klicnik noble bile, two giant king snake skins, and a giant whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
    quest::summonitem(11395);
  }
  if($text=~/staff of the bloodsabers/i) {
    quest::say("A Staff of the Bloodsabers is a useful implement for young sorcerers dedicated to Bertoxxulous the Plague Lord. I will assist you in the creation of a staff but first you must complete a task for me. The sorcerers of The Order of Three are supporters of Antonius Bayle IV. the haughty ruler of Qeynos. They lend magical aid to the Knights of Thunder and Priests of Life to identify and capture members of the Bloodsabers. A rather troublesome member of The Order of Three, Larkin Tolman, has recently been spotted at a settlement in the Western Plains of Karana. Find this Larkin Tolman and bring me his head.");
  }
}

sub EVENT_ITEM
	{
	my $partial=0;

	if (plugin::check_handin(\%itemcount, 20204 => 1)) 
		{
		quest::say("Well done, $name. The Bloodsabers have many enemies within the city of Qeynos and its surrounding regions. You must exercise much caution when not within the safety of our temple here in the Qeynos Catacombs. Take this Rough Bloodsaber Staff and when you have gathered a Giant King Snake Skin, two Gnoll Fangs, and a Giant Fire Beetle Eye, return them to me with this staff and I will complete its construction.");
		quest::summonitem(20203);
		quest::exp(130);
		quest::ding();
		# FActions Verified on Live
		quest::faction(221,10);
		quest::faction(262,-1);
		quest::faction(296,1);
		quest::faction(341,-2);
		quest::faction(230,1);
		}
	else
		{
		while (plugin::check_handin(\%itemcount, 13915 => 1))
			{
			$fang_count = $fang_count + 1;
			$partial=1;
			quest::say("Thank you for the fang!");
			}

		if (plugin::check_handin(\%itemcount, 19946 => 1)) 
			{
			$skin_count = $skin_count + 1;
			$partial=1;
			quest::say("Thank you for the skin!");
			}
		if (plugin::check_handin(\%itemcount, 13251 => 1)) 
			{
			$eye_count = $eye_count + 1;
			$partial=1;
			quest::say("Thank you for the eye!");
			}
		if (plugin::check_handin(\%itemcount, 20203 => 1)) 
			{
			$staff_count = $staff_count + 1;
			$partial=1;
			quest::say("Thank you for the staff!");
			}

		if ($fang_count >= 2 && $skin_count >= 1 && $eye_count >= 1 && $staff_count >= 1)
			{
			$partial=0;
			$fang_count = $fang_count -2;
			$skin_count = $skin_count -1;
			$eye_count = $eye_count -1;
			$staff_count = $staff_count -1;
			quest::say("Excellent work! I must keep this staff for our internal uses, but take this shard as your reward.");
			quest::summonitem(1264);
			quest::exp(150);
			quest::ding();
			# Factions Verified on Live
			quest::faction(221,5);
			quest::faction(262,-1);
			quest::faction(296,1);
			quest::faction(341,-1);
			quest::faction(230,1);
			}
		elsif ($partial == 1)
			{
			quest::say("Where's the rest?! fang: $fang_count skin: $skin_count eye: $eye_count staff: $staff_count");
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
		if (plugin::check_handin(\%itemcount, 20242 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(2,2);	# AGI
				quest::incstat(3,2);	# DEX
				quest::incstat(4,6);	# INT
				quest::enabletitle(25);
				quest::shout2("All Hail Scourge Caster $name!."); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem(20242);
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
#END of FILE Zone:qcat  ID:45065 -- Bruax_Grengar
