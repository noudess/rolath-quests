my $questtier=0;
my $minwave=4;
my $maxwave=8;
my $numlocs=8;
my $numdiffmobs=3;
my %moblist;
my $bosschance=2.5;
my $inprogress=0;

my %spawnlocs = (
	1 => { "x" => 965, "y" => -2442, "z" => -43, "h" => 134},
	2 => { "x" => 924, "y" => -2467, "z" => -44, "h" => 0},
	3 => { "x" => 882, "y" => -2536, "z" => -41, "h" => 58},
	4 => { "x" => 884, "y" => -2593, "z" => -45, "h" => 190},
	5 => { "x" => 899, "y" => -2640, "z" => -43, "h" => 220},
	6 => { "x" => 958, "y" => -2655, "z" => -41, "h" => 276},
	7 => { "x" => 1046, "y" => -2644, "z" => -43, "h" => 301},
	8 => { "x" => 1117, "y" => -2599, "z" => -44, "h" => 333}
);

my %crackedlist = (
	1 => { "odds" => 33, "npctype" => 999240},
	2 => { "odds" => 66, "npctype" => 999241},
	3 => { "odds" => 100, "npctype" => 999242}
);

my %brokenlist = (
	1 => { "odds" => 3, "npctype" => 999228},
	2 => { "odds" => 16, "npctype" => 999229},
	3 => { "odds" => 31, "npctype" => 999230},
	4 => { "odds" => 49, "npctype" => 999231},
	5 => { "odds" => 72, "npctype" => 999232},
	6 => { "odds" => 100, "npctype" => 999233}
);

my %pristinelist = (
	1 => { "odds" => 3, "npctype" => 999228},
	2 => { "odds" => 16, "npctype" => 999229},
	3 => { "odds" => 31, "npctype" => 999230},
	4 => { "odds" => 49, "npctype" => 999231},
	5 => { "odds" => 72, "npctype" => 999232},
	6 => { "odds" => 100, "npctype" => 999233}
);


sub EVENT_SPAWN
	{
	$questtier=0;
	$inprogress=0;
	}

sub EVENT_SAY 
	{ 
	if ($text=~/Hail/i)
		{
		quest::say("Ahh a visitor, I see? Welcome to the Cave of the Damned. I am the keeper of these caves, and I have been charged with holding the spiritual [manifestations] at bay. Many bloody battles have been fought on the shores of Gunthak, many more battles will be fought here.");
		}
	elsif ($text=~/manifestations/i)
		{
		quest::say("Most of the spirits that perish on the beach move on to the next world, though a few remain bound to their ships or comrades and remain on the shore. Every once in a great while, however, a spirit breaks its bond to the beach and is drawn to this cave. There is magic in this cave, dark magic. The spirits that find their way here draw power from the magic in the caves. I assure that the spirits that find their way here remain contained in the cave, along with their [treasures].");
		}
	elsif ($text=~/treasures/i)
		{
		quest::say("I figured that would pique your interest. A few of the spirits here managed to retain a portion of their material possessions. If you wish, I can channel the spirits into a form where you may request their treasures. Of course, there is a [price].");
		}
	elsif ($text=~/price/i)
		{
		quest::say("Finger bones. There is strong magic in the bones of our fingers, and I use such bones to summon the spirits, as well as keep them bound to this cave. Bring me four identical finger bones, the better condition the bones are in, the stronger the spirits I call will be.");
		}
	} 

sub EVENT_ITEM 
	{
	if ($inprogress < 1)
		{
		# turn in to start quest
		if(plugin::check_handin(\%itemcount, 56001 => 4)) 
			{
			$questtier=1;
			$boss=999243; #Simati
			%moblist=%crackedlist;
			}
		elsif(plugin::check_handin(\%itemcount, 56002 => 4)) 
			{
			$questtier=2;
			$boss=9999999; # Tagai
			%moblist=%brokenlist;
			}
		elsif(plugin::check_handin(\%itemcount, 56003 => 4)) 
			{
			$questtier=3;
			$boss=9999999; # Multiple?
			%moblist=%pristinelist;
			}
		if ($questtier > 0)
			{
			$inprogress=1;
			quest::say("The price has been paid and the spirits have taken notice.  Be on your guard.");
			quest::settimer("StartRaid", 5);
			}
		}
	else
		{
		quest::say("I am busy right now.");
		}
	}

sub EVENT_TIMER 
	{
	if ($timer eq "StartRaid") 
		{
		quest::stoptimer("StartRaid");
		SPAWN_WAVE();
		quest::settimer("Wave", 210);
		}

	if ($timer eq "Wave") 
		{
		quest::stoptimer("Wave");
		quest::settimer("Wave", 210);
		SPAWN_WAVE();
		}

	if ($timer eq "EndRaid") 
		{
		quest::stoptimer("EndRaid");
		# Only say this if named not killed..
		# quest::shout("One of the spirits has escaped!  I can't let him break through my defenses.  I am closing the portal.");
		END_RAID();
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
	
	# See if we get the boss

	$roll=plugin::RandomRange(1,100);
	if ($roll <= $bosschance)
		{
		quest::shout("You seem to have this situation under control. I will depart now. Best of luck.");

		quest::stoptimer("Wave");

		# Set timer to depop all mobs
		quest::settimer("EndRaid", 600);

		$loci=plugin::RandomRange(1,$numlocs);
		$myx=$spawnlocs{$loci}{"x"};
		$myy=$spawnlocs{$loci}{"y"};
		$myz=$spawnlocs{$loci}{"z"};
		quest::spawn(999243,0,0,$myx,$myy,$myz);
		}
	elsif ($bosschance < 25)
		{
		$bosschance*=2;
		}
		
	quest::ze(15, "Boss chance is now: $bosschance");

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


sub END_RAID
	{
	# Stop the waves
	$inprogress=0;
	quest::stoptimer("Wave");

	# Despawn all raid mobs
	quest::depopall(999240);
	quest::depopall(999241);
	quest::depopall(999242);
	quest::depopall(999243);

	# Despawn Dimaal - repop in db is an hour
    quest::depop(224115);
	}
