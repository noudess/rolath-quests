my $taskid=90;
my $containerid=17124;
my $bracerid=9866;
my $robeid=9871;
my $titleid=58;
my $pre="Dismal Priest";
my $fix="";

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Yes? What is it you want from me? I have nothing that you would be interested in. Not even money to pay the ridiculous taxes imposed by the Freeport Militia.");
   }

    if($text=~/dismal priest boots/i)
   {
   quest::say("'To assemble Dismal priest Mail Boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Large Fire Beetle Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19634);
   } 

    if($text=~/dismal priest bracer/i)
   {
   quest::say("To assemble a Dismal priest Mail Bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Sand Scarab Hatchling Sternite in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }  

    if($text=~/dismal priest breastplate/i)
   {
   quest::say("To assemble a Dismal priest Breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Giant Fire Beetle Carapace, and two Giant Fire Beetle Tergites in the Mail Assembly Kit.");
   quest::summonitem(19637);
   } 

    if($text=~/dismal priest gauntlets/i)
   {
   quest::say("To assemble Dismal priest Gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Sand Scarab Hatchling Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   } 

    if($text=~/dismal priest greaves/i)
   {
   quest::say("To assemble Dismal priest Greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Large Fire Beetle Sternites in the Mail Assembly Kit.");
   quest::summonitem(19636);
   } 

    if($text=~/dismal priest helm/i)
   {
   quest::say("To assemble a Dismal priest Helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Sand Scarab Hatchling Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   } 

    if($text=~/dismal priest vambraces/i)
   {
   quest::say("To assemble Dismal priest Vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Large Fire Beetle Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
   } 

}

sub EVENT_ITEM
	{
	# Note to Jerra Renlock ID- 19844
	if($itemcount{19844} == 1)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Ah, so Zhem wants me to assist you with some armor. You will surely need it if you are an associate of the likes of him. This Mail Assembly Kit will be needed for you to construct your armor. The materials required depend on the armor section you plan to construct. Do you plan to construct a [dismal priest helm], a [dismal priest bracer], [dismal priest gauntlets], [dismal priest boots], [dismal priest vambraces], [dismal priest greaves], or a [dismal priest breastplate].");
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
				quest::incstat(0,2); 	# STR
				quest::incstat(1,3); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,2);	# DEX
				quest::incstat(5,6);	# WIS
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
    if (plugin::check_handin(\%itemcount, 19922 =>1 ))
        {
        quest::say("You have done well, here is something you can really use.  I'll keep this for the guild.");
        quest::summonitem(1264); # Rolath Shard
        quest::exp(100);
        quest::ding();
        }

	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}

#END of FILE Zone:freporte  ID:10126 -- Jerra_Renlock
