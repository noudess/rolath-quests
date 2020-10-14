my $taskid=98;
my $containerid=17124;
my $bracerid=19884;
my $robeid=19882;
my $titleid=64;
my $pre="Dismal Warrior";
my $fix="";

sub EVENT_SAY
{
   if($text=~/hail/i)
   {
   quest::say("I am but a poor peddler of trinkets living amongst the rats and beggars of these slums. Perhaps you will purchase some of my wares and help a struggling merchant?");
   }

   if($text=~/forge/i)
   {
   quest::say("You can find forges all over freeport.");
   }

   if($text=~/dismal warrior breastplate/i)
   {
   quest::say("'To assemble a Dismal Warrior Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Dune Tarantula Thorax, and a Dune Tarantula Abdomen in the Mail Assembly Kit.");
   quest::summonitem(19637);
   }

    if($text=~/dismal warrior helm/i)
   {
   quest::say("To assemble a Dismal Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Desert Tarantula Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   }

    if($text=~/dismal warrior bracer/i)
   {
   quest::say("To assemble a Dismal Warrior Mail Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Dune Spiderling Tibia in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }

   if($text=~/dismal warrior gauntlets/i)
   {
   quest::say("To assemble Dismal Warrior Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Dune Spiderling Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   }

    if($text=~/dismal warrior boots/i)
   {
   quest::say("To assemble Dismal Warrior Mail Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Dune Spiderling Hairs in the Mail Assembly Kit.");
   quest::summonitem(19634);
   }

    if($text=~/dismal warrior vambraces/i)
   {
   quest::say("To assemble Dismal Warrior Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Desert Tarantula Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
   }

    if($text=~/dismal warrior greaves/i)
   {
   quest::say("To assemble Dismal Warrior Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Desert Tarantula Femurs in the Mail Assembly Kit.");
   quest::summonitem(19636);
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
	{
	if($itemcount{19843} == 1)
		{
		quest::ding();
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("I see now we have similar interests. I will help you get outfitted in an affordable suit of armor to help you in your endeavors. You will need this Mail Assembly Kit to aid you in the construction of the armor. The materials required depend on the armor section you desire to craft. Do you plan to construct a [dismal warrior helm], a [dismal warrior bracer], [dismal warrior gauntlets], [dismal warrior boots], [dismal warrior vambraces], [dismal warrior greaves], or a [dismal warrior breastplate].");
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
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
