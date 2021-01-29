my $taskid=51;
my $containerid=17124;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You do not yet bear the sweet aroma of death and decay that the Plague Bringer bestows upon his most faithful servants. What is it that you seek from Wellis?");
  }
  if ($text=~/gauntlets/i) {
    quest::say("To assemble scourge knight gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Wolf Pelt and two Decaying Finger Bones in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  if ($text=~/boots/i) {
    quest::say("To assemble scourge knight boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Wolf Pelts, and two Decaying Foot Bones in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  if ($text=~/bracer/i) {
    quest::say("To assemble a scourge knight bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Wolf Pelt and a Decaying Ulna Bone in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  if ($text=~/helm/i) {
    quest::say("To assemble a scourge knight helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Wolf Pelt and a Decaying Skull in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  if ($text=~/greaves/i) {
    quest::say("To assemble scourge knight greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Wolf Pelts and two Decaying Tibia in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  if ($text=~/vambraces/i) {
    quest::say("To assemble scourge knight vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Wolf Pelt and two Decaying Humerus Bones in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
  if ($text=~/breastplate/i) {
    quest::say("To assemble a scourge knight breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Wolf Pelt, a Decaying Sternum, and a Decaying Ribcage in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 20206 => 1)) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Welcome to the Bloodsabers young Scourge Knight. I will help prepare you for your spreading of the disease. You must use this Mail Assembly Kit to construct the pieces of your armor. Each piece will require different materials for its construction. Will you craft [Gauntlets of the Scourge Knight], [Boots of the Scourge Knight], a [Bracer of the Scourge Knight], a [Helm of the Scourge Knight], [Greaves of the Scourge Knight], [Vambraces of the Scourge Knight], or a [Breastplate of the Scourge Knight]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	elsif (plugin::check_handin(\%itemcount, 20188 => 1, 19946 => 1)) 
		{
		quest::emote("Wellis Pestule fashions a grip out of the giant king snake skin, sharpens the edge of the blade to be razor sharp, and polishes the weapon with a strange blood like substance."); 
		quest::say("A fine weapon for the Bloodsabers. We must keep this for the war.  Please accept this powerful shard in its stead.  Go now and spread the Disease!");
		quest::summonitem(1266);
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
		if (plugin::check_handin(\%itemcount, 20214 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,4); 	# STR
				quest::incstat(1,3); 	# STA
				quest::incstat(4,1);	# INT
				quest::enabletitle(20);
				quest::shout2("All Hail Scourge Knight $name!"); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem(20214);
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
