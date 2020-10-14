my $afterfirstwave=0;
my $savex=0;
my $savey=0;
my $savez=0;
my $saveh=0;
my $minwave=2;
my $maxwave=5;
my $numlocs=4;
my $numdiffmobs=6;
my $officerchance=1.25;
my %spawnlocs = (
	1 => { "x" => -113, "y" => -1045, "z" => 4, "h" => 134},
	2 => { "x" => -113, "y" => -1345, "z" => 37.48, "h" => 0},
	3 => { "x" => -263, "y" => -1195, "z" => 8.45, "h" => 58},
	4 => { "x" => 37, "y" => -1195, "z" => 1.22, "h" => 190}
);
my %moblist = (
	1 => { "odds" => 3, "npctype" => 999228},
	2 => { "odds" => 16, "npctype" => 999229},
	3 => { "odds" => 31, "npctype" => 999230},
	4 => { "odds" => 49, "npctype" => 999231},
	5 => { "odds" => 72, "npctype" => 999232},
	6 => { "odds" => 100, "npctype" => 999233}
);

sub EVENT_SPAWN
	{
	$savex=$x;
	$savey=$y;
	$savez=$z;
	$saveh=$h;
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 0 && $afterfirstwave==1)
		{
		quest::stop();
		quest::moveto(-100, -1213, -2.3, 0, 1);
		}
	}

sub EVENT_SAY 
	{ 
	if ($text=~/Hail/i)
		{
		quest::say("Hello $name. welcome to the front lines of our war against the bastard grimlings. As I'm sure you know. we Vah Shir shun violence, but with this enemy there is no other way. Let me know if you'd like to see some action.");
		}
	elsif ($text=~/I would like to see some action/i)
		{
		quest::say("smiles. 'I can escort you to a camp rich with enemies. With my help you can take possession of their camp. They'll try desperately to reclaim their lost territory and, if we're lucky, an officer will show up. You'll want to bring about ten soldiers as powerful as me. When you're all here and ready for battle, give me a marbled acrylia sphere.  If you slay an officer, provide me with proof and we will see you are honored appropriately!");
		}
	elsif ($text=~/path/i)
		{
		quest::start(19);
		}
	} 

sub EVENT_ITEM 
	{
	# turn in to start quest
	if(plugin::check_handin(\%itemcount, 4349 => 1)) 
		{
		quest::say("May the spirits guide us $name. Now summon your friends and all the courage you possess, this won't be easy.");

		quest::settimer("StartRaid", 10);
		}
	if(plugin::check_handin(\%itemcount, 4399 => 1)) 
		{
		quest::say("Wonderful!  This will add to the honor you have already gained, $name.  Work with Derrin to take this battle to the next level.");
		quest::summonitem(4375);
		quest::exp(100000);
		quest::ding();
		}
	plugin::GivePetItems();
	}

sub EVENT_TIMER 
	{
	if ($timer eq "StartRaid") 
		{
		quest::stoptimer("StartRaid");

		# Send Danarin on his way
		quest::start(19);
		}
	if ($timer eq "Horn") 
		{
		quest::stoptimer("Horn");

		# Perform Horn emote before charging.
		quest::doanim(41);
		}
	if ($timer eq "Wave") 
		{
		$afterfirstwave=1;
		quest::stoptimer("Wave");
		quest::settimer("Wave", 90);
		DISABLE_REPOPS();
		SPAWN_WAVE();
		}

	if ($timer eq "EndRaid") 
		{
		quest::stoptimer("EndRaid");

		# Send Danarin Home.
		quest::moveto($savex, $savey, $savez, $saveh,1);

		END_RAID();
		}

}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == -560)
		{
		# 1st waypoint
		quest::say("As we approach the camp it's important that we remain silent. I'm sure you're aware of the advantages we gain with the element of surprise.");
		}
	elsif ($x == -333)
		{
		# Time to go back to guard spot
		quest::say("Here we are, now half of you stay here with me and the other half quietly swing around to the ledge south of the camp. Make your final preparations and wait for my command. It is vitally important that I stay alive, the camp will fall to the grimlings if I am slain. Fight well friends");
		}
	elsif ($x == -323)
		{
		quest::shout("The time is NOW!  Charge for the glory of Shar Vahl!");
		quest::SetRunning(1);
		quest::settimer("Horn", 1);
		}
	elsif ($x == -96)
		{
		quest::SetRunning(0);
		quest::stop();
		quest::settimer("Wave", 180);
		quest::moveto(-100, -1213, -2.3, 0, 1);

		# Raise the Vah Shir Flag
		quest::shout("I raise this flag in the name of Shar Vahl!");
		quest::shout("Be ready, surely reinforcements will be sent to try and reclaim this camp.");
		quest::forcedooropen(68);
		}
	}

sub EVENT_DEATH
	{
	END_RAID();
	}

sub SPAWN_WAVE
	{
	my $loci=0;
	my $mob=0;
	my $roll=0;
	my $found=0;
	my $myx=0;
	my $myy=0;
	my $myz=0;
	
	# See if we get an officer

	$roll=plugin::RandomRange(1,100);
	if ($roll <= $officerchance)
		{
		$loci=plugin::RandomRange(1,$numlocs);
		$myx=$spawnlocs{$loci}{"x"};
		$myy=$spawnlocs{$loci}{"y"};
		$myz=$spawnlocs{$loci}{"z"};
		quest::spawn(999234,0,0,$myx,$myy,$myz);
		quest::stoptimer("Wave");
	
		# Give them 5 minutes - otherwise we end it.
		quest::settimer("EndRaid", 300);
		}
	elsif ($officerchance < 20)
		{
		$officerchance*=2;
		}
		
	quest::ze(15, "Officer chance is now: $officerchance");

	$nummobs=plugin::RandomRange($minwave,$maxwave);
	quest::ze(15, "Spawning $nummobs");
	for (my $i = 1; $i <= $nummobs; $i++)
		{
		$found=0;
		$loci=plugin::RandomRange(1,$numlocs);
		quest::say($spawnlocs{$loci}{"x"});
		$myx=$spawnlocs{$loci}{"x"};
		$myy=$spawnlocs{$loci}{"y"};
		$myz=$spawnlocs{$loci}{"z"};
		$roll=plugin::RandomRange(1,100);
		for (my $j = 1; $j <= $numdiffmobs && $found==0; $j++)
			{
			if ($roll <= $moblist{$j}{"odds"})
				{
				$mob=$moblist{$j}{"npctype"};
				quest::say($mob);
				quest::spawn($mob,0,0,$myx,$myy,$myz);
				$found=1;
				}
			}
		}
	}

sub DISABLE_REPOPS
	{
	quest::signalwith(999235, -1, 0);
	}

sub ENABLE_REPOPS
	{
	quest::signalwith(999235, 1, 0);
	}

sub END_RAID
	{
	quest::SetRunning(0);

	$afterfirstwave=0;
	# Stop the waves
	quest::stoptimer("Wave");

	# Despawn officer immediately if he is up.
    quest::depopall(999234);

	#Despawn any remainign waves
	quest::depopall(999228);
	quest::depopall(999229);
	quest::depopall(999230);
	quest::depopall(999231);
	quest::depopall(999232);
	quest::depopall(999233);

	# Enable repops in the camp
	ENABLE_REPOPS();
	}


