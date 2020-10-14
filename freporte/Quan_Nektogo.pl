my $taskid=96;
my $containerid=17124;
my $bracerid=19891;
my $robeid=19889;
my $titleid=63;
my $pre="Dismal Knight";
my $fix="";

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Sorry friend. I have nothing to sell at the moment. These taxes imposed by the Freeport Militia and the Coalition of Tradefolk take a heavy toll on us poor folk.");
   }

   if($text=~/forge/i)
   {
   quest::say("You can find them all over freeport. Inside and out of many of the buildings where Weapons and armor are sold.");
   }

    if($text=~/dismal knight boots/i)
   {
   quest::say("To assemble Dismal Knight Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Cat Pelts, and two Large Leaf Scarab Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19634);
   }

   if($text=~/dismal knight bracer/i)
   {
   quest::say("To assemble a Dismal Knight Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Cat Pelt and a Leaf Scarab Sternite in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }

    if($text=~/dismal knight breastplate/i)
   {
   quest::say("To assemble a Dismal Knight Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Cat Pelt, a Giant Leaf Scarab Carapace, and two Giant Leaf Scarab Tergites in the Mail Assembly Kit.");
   quest::summonitem(19637);
   }

   if($text=~/dismal knight gauntlets/i)
   {
   quest::say("To assemble Dismal Knight Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Cat Pelt and two Leaf Scarab Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   }

   if($text=~/dismal knight greaves/i)
   {
   quest::say("To assemble Dismal Knight Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Cat Pelts and two Large Leaf Scarab Sternites in the Mail Assembly Kit.");
   quest::summonitem(19636);
   }

    if($text=~/dismal knight helm/i)
   {
   quest::say("To assemble a Dismal Knight Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Cat Pelt and two Large Leaf Scarab Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   }

   if($text=~/dismal knight vambraces/i)
   {
   quest::say("To assemble Dismal Knight Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Cat Pelt and two Large Leaf Scarab Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
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
				quest::incstat(2,5);	# AGI
				quest::incstat(3,3);	# DEX
				quest::incstat(4,5);	# INT
				quest::incstat(6,5);	# CHA
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

	# Sharpened Dismal Long Sword ID-19928 - Giant Rattlesnake Skin ID-19852
	if (plugin::check_handin(\%itemcount, 19928 =>1, 19852=>1 )) 
		{
		quest::ding();
		quest::emote(" fashions a grip out of the giant rattlesnake skin and polishes the blade of the sword with a strange glowing substance.");
		quest::say("We have need of this weapon for others, take this $name and earn your place in Dismal Rage!");
		quest::exp("100");
		quest::summonitem("1266"); #Rolath Shard of Battle
		}


	if (plugin::check_handin(\%itemcount, 19845 =>1 )) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Sorry buddy I didn't realize you were one of us. I've got no problem helping out an associate of Gunex. You'll need this Mail Assembly Kit to construct your new armor. The materials required depend on the section of armor you're planning on crafting. Do you plan on crafting a [dismal knight helm], a [dismal knight bracer], [dismal knight gauntlets], [dismal knight boots], [dismal knight vambraces], [dismal knight greaves], or a [dismal knight breastplate].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
