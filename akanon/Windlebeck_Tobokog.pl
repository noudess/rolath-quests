my $taskid=197;
my $containerid=17124;
my $robeid=11375;
my $titleid=91;
my $pre="Warrior";
my $fix="of the Plagues";

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("What do YOU want? Did [Naygog] send you?");
		}
	if ($text =~ /naygog/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Hail $name! You must be one of Naygog's new soldiers. Naygog has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Warrior Armor you are planning on assembling. Do you wish to craft a [plague warrior helm], a [plague warrior bracer], [plague warrior gauntlets], [plague warrior boots], [plague warrior vambraces], [plague warrior greaves], or a [plague warrior breastplate].");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}

		}
	if ($text =~ /plague warrior helm/i)
		{
		quest::say("To assemble a Plague Warrior Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Coyote Pelt and two Rebel Clockwork Eye Lenses in the Mail Assembly Kit.");
		quest::summonitem(19631);    #crude helm mold
		}
	if ($text =~ /plague warrior bracer/i)
		{
		quest::say("To assemble a Plague warrior Mail Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Coyote Pelt and a Rebel Clockwork Wrist Section in the Mail Assembly Kit.");
		quest::summonitem(19632);    #crude bracer mold
		}
	if ($text =~ /plague warrior gauntlets/i)
		{
		quest::say("To assemble Plague warrior Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Coyote Pelt and two Rebel Clockwork Hand Plates in the Mail Assembly Kit.");
		quest::summonitem(19633);    #crude gauntlets mold
		}
	if ($text =~ /plague warrior boots/i)
		{
		quest::say("To assemble Plague warrior Mail Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Coyote Pelts, and two Rebel Clockwork Foot Plates in the Mail Assembly Kit.");
		quest::summonitem(19634);    #crude boot mold
		}
	if ($text =~ /plague warrior vambraces/i)
		{
		quest::say("To assemble Plague warrior Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Coyote Pelt and two Rebel Clockwork Arm Sections in the Mail Assembly Kit.");
		quest::summonitem(19635);    #crude vambrace mold
		}
	if ($text =~ /plague warrior greaves/i)
		{
		quest::say("To assemble Plague warrior Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Coyote Pelts and two Rebel Clockwork Leg Sections in the Mail Assembly Kit.");
		quest::summonitem(19636);    #crude greaves mold
		}
	if ($text =~ /plague warrior breastplate/i)
		{
		quest::say("To assemble a Plague warrior Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Coyote Pelt, a Rebel Clockwork Chest Plate, and a Rebel Clockwork Back Plate in the Mail Assembly Kit.");
		quest::summonitem(19637);    #crude breastplate mold
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
				quest::incstat(0,4); 	# STR
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
