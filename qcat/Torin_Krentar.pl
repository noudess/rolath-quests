# Bertoxxulous cleric quest armor
#
# correct reward dialogue missing for pestilence priest mace hand in
my $taskid=43;
my $containerid=17124;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The dead are watching you young one, yet you are safe under their otherworldly gaze. Is there something I can do for you?");
  }
  elsif ($text=~/gauntlet/i) {
    quest::say("To assemble pestilence priest gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Large King Snake Skin and two Gnoll Finger Bones in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  elsif ($text=~/boot/i) {
    quest::say("To assemble pestilence priest boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Large King Snake Skins, and two Gnoll Foot Bones in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  elsif ($text=~/bracer/i) {
    quest::say("To assemble a pestilence priest bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Large King Snake Skin and a Gnoll Ulna Bone in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  elsif ($text=~/helm/i) {
    quest::say("To assemble a pestilence priest helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Large King Snake Skin and a Gnoll Skull in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  elsif ($text=~/greaves/i) {
    quest::say("To assemble pestilence priest greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Giant King Snake Skins and two Gnoll Tibia in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  elsif ($text=~/vambrace/i) {
    quest::say("To assemble pestilence priest vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Giant King Snake Skin and two Gnoll Humerus Bones in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
  elsif ($text=~/breastplate/i) {
    quest::say("To assemble a pestilence priest breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Giant King Snake Skin, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 20207 => 1)) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Well met young disciple of Bertoxxulous. Perhaps one day you shall serve the Plague Lord in his realm, but for now you will serve the Bloodsabers, his mortal agents on Norrath. The armor you seek must be assembled using this Mail Assembly Kit. The materials necessary to construct the armor vary depending on the piece being crafted. Do you wish to craft [Gauntlets] of the Pestilence Priests, [Boots] of the Pestilence Priests, a [Bracer] of the Pestilence Priests, a [Helm] of the Pestilence Priests, [Greaves] of the Pestilence Priests, [Vambraces] of the Pestilence Priests, or a [Breastplate] of the Pestilence Priests?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	elsif (plugin::check_handin(\%itemcount, 20199 => 1, 19946 => 1)) 
		{
		quest::say("Well done, $name. Now go, spread the gifts of the Plague Lord upon the world.");
		quest::exp(15000);
quest::ding();
		quest::summonitem(1264);
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
		if (plugin::check_handin(\%itemcount, 20221 => 1))
			{ # robe is last step
			if(!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,1); 	# STR
				quest::incstat(1,2); 	# STA
				quest::incstat(5,6);	# WIS
				quest::enabletitle(14);
				quest::shout2("All Hail $name, Priest of Pestilence!."); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem(20221);
				}
			} 
		}
	}

# Put this at bottom (or augment existing one)
sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

# EOF zone: qcat ID: 45074 NAME: Torin_Krentar
