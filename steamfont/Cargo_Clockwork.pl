#:: Create a scalar variable to track whether or not the delivery was successful
my $delivery = 0;
my $windmill = 0;
my $grep = 0;
my $days=0;

#:: Create scalar variables for the bandits to export NPC_Type_ID
my $bandit1id = 56178;    #:: Hector_the_highway_bandit
my $bandit2id = 56179;    #:: Renaldo_the_highway_bandit
my $bandit3id = 56180;    #:: Jerald_the_highway_bandit

my $hatecharid;	#Save id of attacker to request help after escape


sub EVENT_SPAWN
	{
	# If this quest has never run, start at day = 0
	if (!defined($qglobals{"CargoDays"}))
		{
		quest::setglobal("CargoDays", 0, 0, "F");
		}
	else
		{
		# If we've seen 7am four times, move to day 5 immediately
		if ($qglobals{"CargoDays"} == 4)
			{
			quest::setglobal("CargoDays", 5, 0, "F");
			}
		}

	# One EQ day is 72 minutes. Timers dont process with an empty zone, so
	# this really isnt 5 EQ days, its 5 EQ days + dead zone days
	quest::settimer("DayTimer", 4320);
	}

sub EVENT_SIGNAL
	{
	#:: Match a signal '1' from steamfont/Watchman_Grep.pl
	if ($signal == 1)
		{
		quest::emote("Chuga.. Chug..Chug..");
		quest::say("This unit requires maintenance.");
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "DayTimer")
		{
		if ($qglobals{"CargoDays"} < 4)
			{
			$days = $qglobals{"CargoDays"} + 1;
			}
		else
			{
			quest::settimer("CargoTimer", 5);
			$days = 0;
			}
		quest::setglobal("CargoDays", $days, 0, "F");
		quest::debug("CargoDays is $days");
		}
	elsif ($timer eq "CargoTimer")
		{
		#:: Key a data bucket
		$key = $npc->GetCleanName() . "-failed";

		#:: Match if the data bucket does not exist
		if (!quest::get_data($key))
			{
			#:: Match if the time is 7 AM
			if ($zonehour == 7)
				{
				#:: Set the data bucket for 7200s (2 hours)
				quest::set_data($key, 1, 7200);

				quest::debug("Cargo Clockwork headed to windmills.");
				quest::debug("Turning on zone processing.");

				#:: Start path grid 177 - path to the windmills
				quest::say("This unit requires oiling.");
				quest::processmobswhilezoneempty(1);
				quest::start(177);
				}
			}

		# Arrived at Frebin (windmills)
		if ($x == -400 && $y == -150 && $windmill == 0)
			{
			quest::debug("Cargo Clockwork At windmills");
			$windmill = 1;
			quest::emote("Chuga.. Chug..Chug..");
			quest::say("This unit requires maintenance.");
			}

		#:: Match if at the spawnpoint (WP 0) and if delivery was completed
		if ($x == 700 && $y == -1783 && $delivery == 1)
			{
			quest::debug("Cargo Clockwork Home");
			quest::debug("Turning zone processing off");
			#:: Stop pathing on path grid 177
			quest::processmobswhilezoneempty(0);
			quest::stop();

			#:: Reset the delivery state
			$delivery = 0;
			$grep = 0;
			$windmill = 0;

			#:: Reset the data bucket
			quest::delete_data($key);
			quest::stoptimer("CargoTimer");
			}

		#:: Match if at the crossroads with Watchman Grep (WP 7)
		if ($x == 550 && $y == -830 && $grep == 0)
			{
			#:: Pull a list of clients from the entity list
			my @ClientList = $entity_list->GetClientList();

			#:: Match if the ClientList is not empty
			if (scalar @ClientList > 0)
				{
				quest::say("kachunk .. kachunk..");
				$grep = 1;

				#:: Send a signal '1' to Watchman Grep with no delay
				quest::signalwith(56066, 1, 0);
				}
			}

		#:: Match if at the highway robbery location and delivery has not been completed
		if ($x == 90 && $y == -700 && $delivery == 0)
			{
			#:: Set delivery complete
			$delivery = 1;
			quest::debug("Cargo Clockwork Delivery Complete");
			quest::debug("Spawning bandits");
			quest::emote("Chuga.. Chug..Chug..");
			quest::emote(
						"The chugging of the Cargo Clockwork comes to a halt.");

			#:: Spawn Hector_the_highway_bandit (56178)
			$bandit1 = quest::spawn2($bandit1id, 0, 0, 30, -700, -109, 62);

			#:: Get Hector_the_highway_bandit's ID from the entity list
			$bandit1obj = $entity_list->GetMobID($bandit1);

			#:: Add the Cargo_Clockwork to the hate list of the bandit
			$bandit1npc = $bandit1obj->CastToNPC();
			$bandit1npc->AddToHateList($npc, 1);

			#:: Spawn Renaldo_the_highway_bandit (56179)
			$bandit2 = quest::spawn2($bandit2id, 0, 0, 95, -732, -108, 240);

			#:: Get Renaldo_the_highway_bandit's ID from the entity list
			$bandit2obj = $entity_list->GetMobID($bandit2);

			#:: Add the Cargo_Clockwork to the hate list of the bandit
			$bandit2npc = $bandit2obj->CastToNPC();
			$bandit2npc->AddToHateList($npc, 1);

			#:: Spawn Jerald_the_highway_bandit (56180)
			$bandit3 = quest::spawn2($bandit3id, 0, 0, 53, -615, -107, 113);

			#:: Get Jerald_the_highway_bandit's ID from the entity list
			$bandit3obj = $entity_list->GetMobID($bandit3);

			#:: Add the Cargo_Clockwork to the hate list of the bandit
			$bandit3npc = $bandit3obj->CastToNPC();
			$bandit3npc->AddToHateList($npc, 1);
			quest::say("This is highway robbery.");
			}

		#:: Match if the NPC has a highway bandit from its hate list targeted
		if ($npc->GetTarget() && ($targetname =~ /highway_bandit/i))
			{
			quest::debug("Wiping hate for $targetname");
			#:: Wipe the hate list (to cause a target switch)
			$npc->WipeHateList();
			}
		}
	elsif ($timer eq "helpme")
		{
		quest::debug("inside helpme");
		quest::say("Click.. Click... Attacked on route, engaging regeneration device.  Requesting help from all nearby units!");
		quest::signalwith(56106, $hatecharid);
		quest::stoptimer("helpme");
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	#:: Stop the 5 second timer
	quest::debug("Cargo Clockwork Dead");
	quest::debug("Turning off zone quest override.");
	quest::stoptimer("CargoTimer");

	#:: Reset delivery status to 0
	$delivery = 0;
	$grep = 0;
	$windmill = 0;

	#:: Send a signal to each bandit so they can gloat
	quest::signal($bandit1id, 0);
	quest::signal($bandit2id, 0);
	quest::signal($bandit3id, 0);

	# Spawn Driver Bryggin
	quest::spawn2(56147, 0, 0, $x, $y, $z, $h);
	quest::processmobswhilezoneempty(0);
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::debug("Cargo Clockwork enters Combat");
		quest::setnexthpevent(30);
		}
	else
		{
		quest::debug("Cargo Clockwork exits Combat");
		}
	}

sub EVENT_HP
	{
	quest::debug("Cargo Clockwork Fleeing. This leaves bandits up.");
	quest::emote("looks concerned.");
	my @hatelist = $npc->GetHateList();
	@hatelist = sort {$b->GetHate() <=> $a->GetHate()} @hatelist;
	my $isclient;
	foreach $ent (@hatelist)
		{
		if($ent)
			{
			my $h_ent = $ent->GetEnt();
			my $ent_name = $h_ent->GetCleanName();
			if($h_ent)
				{
				$isclient = $h_ent->IsClient();
				if ($isclient > 0)
					{
					quest::emote("activates his homing gadget.");
					quest::settimer("helpme",2);
					$hatecharid = $h_ent->CastToClient()->CharacterID();
					$npc->WipeHateList();
					$npc->GMMove($npc->GetSpawnPointX(), $npc->GetSpawnPointY(),
				 		$npc->GetSpawnPointZ(), $npc->GetSpawnPointH());
					last;
					}
				}
			}
		}
	}
