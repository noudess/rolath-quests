my %spawnlocs = (
	1 => { "y" => -190, "x" => -272, "z" => 4, "h" => 134, "npc" => 101},
	2 => { "y" => -190, "x" => -262, "z" => 4, "h" => 134, "npc" => 101},
	3 => { "y" => -190, "x" => -252, "z" => 4, "h" => 134, "npc" => 101},
	4 => { "y" => -190, "x" => -242, "z" => 4, "h" => 134, "npc" => 101},
	5 => { "y" => -180, "x" => -272, "z" => 4, "h" => 134, "npc" => 101},
	6 => { "y" => -180, "x" => -262, "z" => 4, "h" => 134, "npc" => 101},
	7 => { "y" => -180, "x" => -252, "z" => 4, "h" => 134, "npc" => 101},
	8 => { "y" => -180, "x" => -242, "z" => 4, "h" => 134, "npc" => 101},
	9 => { "y" => -170, "x" => -272, "z" => 4, "h" => 134, "npc" => 101},
	10 => { "y" => -170, "x" => -262, "z" => 4, "h" => 134, "npc" => 101},
	11 => { "y" => -170, "x" => -252, "z" => 4, "h" => 134, "npc" => 101},
	12 => { "y" => -170, "x" => -242, "z" => 4, "h" => 134, "npc" => 101},
	13 => { "y" => -160, "x" => -272, "z" => 4, "h" => 134, "npc" => 101},
	14 => { "y" => -160, "x" => -262, "z" => 4, "h" => 134, "npc" => 101},
	15 => { "y" => -160, "x" => -252, "z" => 4, "h" => 134, "npc" => 101},
	16 => { "y" => -160, "x" => -242, "z" => 4, "h" => 134, "npc" => 101}
);

# Tiles will be 2201-2216.
# Healthy then diseased.
my %moblist=(
	1 => {"id" => 2156},
	2 => {"id" => 2157},
	3 => {"id" => 2200}
	); 

my @lefties=(3,4,7,8,11,12,15,16);

sub EVENT_SPAWN
	{
	$mazeactive=0;
	$start=0;
	$end=0;
	$step=0;
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello, $name. Antonius Bayle and the council have ordered a full investigation of these folks that call themselves the Bloodsabers. I hear his plan is to eventually round up every member of this strange disease worshiping cult and bring them in to answer for their terrible crimes against our city and people. Vegalys Keldrane is heading up the investigation.");
		}
	elsif ($text =~ /research/i)
		{
		quest::say("Though we were able to eradicate the plague, thanks to the heroic efforts of Mezmer, we at the Temple of Life must continue to strive in our fight against disease and sickness. Research conducted by citizens such as you allowed us to find a cure. Thus I will continue to find those willing to help us with our research. Being a researcher doesn't take strength or brute force, though those qualities do sometimes help. Being a researcher takes intelligence first and foremost. No offense, but not everyone has that quality. This will be no easy task. Are you still [interested] in research?");
		}
	elsif ($text =~ /interested/i)
		{
		quest::say("Still interested then? Very well, you look rather intelligent. As a show of your commitment to this task, please turn in your [Interrogator's Badge].");
		}
	elsif ($text =~ /Interrogator's Badge/i)
		{
		quest::say("You'll need to talk to Vegalys Keldrane about that. If you are trustworthy enough for Vegalys to allow you to wear that badge, then you are trustworthy enough for we to allow you access to our sacred secrets. I'm sure you can understand our need to ensure you are on our side considering the state of affairs facing our fine city these days. This information cannot fall into the wrong hands.");
		}
	elsif ($text =~ /problem/i)
		{
		quest::say("Unfortunately, those vile followers of the Plague Bringer are still attempting to foul up our plans. Several our [test animals] have been stolen from us by a gnome, a member of the Dark Reflection. These animals are very important to our research, as the briefing describes.");
		}
	elsif ($text =~ /test animals/i)
		{
		quest::say("Those animals are enchanted with a sort of anti-disease aura. It sounds crazy but we thought that perhaps we could use a sort of 'anti-epidemic' to spread a cure for any disease. Perhaps one day, this aura can be perfected and there will be an end to all disease. Alas, the aura is as of yet imperfect and also quite [volatile]. Rats are hearty and prolific and we had hoped to use them to spread health, much in the same way they often spread disease.");
		}
	elsif ($text =~ /volatile/i)
		{
		quest::say("Yes, the enchantment we placed on the rodents does not last long at all. It disperses its curing magic almost instantly. We fashioned several containers at great expense and they have the ability to preserve an enchantment for long periods of time. After enchanting a rat we [place them in the container] until we are ready to conduct our tests.");
		}
	elsif ($text =~ /place them in the container/i)
		{
		quest::say("Oh, I assure you it is completely humane and the rats do seem to enjoy prolonged exposure to the enchantment while in the container. In fact, it is all we can do to get them out of the containers once we put them in! In any case, those containers are dreadfully expensive to make and those rats... Well, we have begun to become sort of attached to them. Please find this [gnome].'");
		}
	elsif ($text =~ /gnome/i)
		{
		quest::say("Her name is Oobnopterbevny Biddilets. She was last seen high tailing it across the Plains of Karana. She infiltrated our temple and stole the containers that held our beloved rodents, which were already enchanted and prepared for our next round of tests. I shudder to think of what this monster may be doing to those poor animals. Anyway, retrieve them at any cost. You will need them for the [test] you will be conducting.");
		}
	elsif ($text =~ /test/i)
		{
		quest::say("The briefing explains how the test is to be conducted but first you need to find the test animals. Get the rodents first from that gnome. Then give me your Researcher's Briefing and we will start the test. Release all three rodents as directed then give me the three Empty Enchanted Jars. If you were able to cure all of the diseased rodents by properly using our enchanted rodents, we will consider this test a success and you shall be rewarded with the Researcher's Badge.");
		}
	}

sub EVENT_ITEM
	{
	#The three empy jars after the rats are cured.  Check that puzzel was actually completed correctly.
	if (plugin::check_handin(\%itemcount, 2587 => 1, 2588 => 1, 2589 => 1))
		{
		if ($mazeactive && !COUNT_DISEASED())
			{
			quest::say("You did it! You have proven you have the intelligence required and you may wear this Researcher's Badge with pride! Thank you for returning the jars.");
			quest::faction(341,5);
			quest::faction(280,1);
			quest::faction(262,2);
			quest::faction(221,2);
			quest::faction(219,1);
			quest::exp(50000);
			quest::ding();
			quest::summonitem(2583);
			quest::stoptimer("puzzle");
			}
		elsif ($mazeactive)
			{
			quest::say("I am afraid that you have failed the test.  There are still rats that have not been cured.");
			}
		else
			{
			quest::say("Nice try bonehead.");
			}

		DERATIFY();
		}
	elsif (plugin::check_handin(\%itemcount, 2387 => 1))
		{
		# Handed in the badge
		quest::say("It seems Vegalys trusts you, so I guess I can trust you as well. Take this briefing. It explains our research and it describes the test you will be conducting. If you can complete the test successfully, then the Temple of Life may one-day call upon you should we ever be faced with a crisis such as the one inflicted upon us by those foul worshipers of Bertoxxulous. Thank Rodcet Nife that the Three-fold Plague of Bertoxxulous was finally eradicated. However, we have a [problem] we need assistance with first.");
		quest::summonitem(18295);
		quest::exp(2500);
		}
	elsif (plugin::check_handin(\%itemcount, 18295 => 1))
		{
		# spawn rats
		SPAWN_KNOWN_GRID();

		$mazeactive=1;

		# Set game timer for 18 minutes (6 hours game time)
		quest::settimer("puzzle", 1080);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "puzzle")
		{
		quest::stoptimer("puzzle");
		DERATIFY();
		quest::depop_withtimer();
		}

	if ($timer eq "cure2")
		{
		quest::stoptimer("cure2");
		$dist=2*4;
		# Look up or down
		if ($start < 9)
			{
			# shoot up
			if ($start < 5)
				{
				$dist=3*4;
				}
			$end=$start+$dist;
			$step=4;
			}
		else
			{
			# shoot down
			if ($start > 12)
				{
				$dist=3*4;
				}
			$end=$start-$dist;
			$step=-4;
			}

		$delay=6;
		if (!CURE())
			{
			$delay=1;
			}
		quest::settimer("heal", $delay);
		}

	if ($timer eq "heal")
		{
		quest::stoptimer("heal");
		HEALED();
		}
	}

sub SPAWN_KNOWN_GRID
	{
	my @puzzle1=(0, 2201,2156,2203,2204,2157,2157,2207,2208,2157,2210,2157,2156,2156,2157,2215,2156);
	my @puzzle2=(0, 2156,2202,2203,2156,2157,2206,2157,2208,2209,2157,2157,2157,2156,2214,2215,2156);
	my @puzzle3=(0, 2156,2157,2157,2204,2205,2157,2157,2156,2209,2156,2156,2157,2213,2214,2215,2216);
	my @puzzle4=(0, 2156,2202,2157,2156,2156,2157,2207,2156,2157,2210,2157,2156,2213,2214,2156,2156);
	my @puzzle5=(0, 2156,2157,2157,2204,2157,2206,2157,2156,2209,2157,2211,2212,2156,2156,2215,2216);
	my @puzzles=(0,\@puzzle1, \@puzzle2, \@puzzle3, \@puzzle4, \@puzzle5);

	my $grid = plugin::RandomRange(1,5);

	for (my $h = 1; $h < 17; $h++)
		{
		$sX = $spawnlocs{$h}{"x"};
		$sY = $spawnlocs{$h}{"y"};
		$sZ = $spawnlocs{$h}{"z"};
		$spawnlocs{$h}{"npc"} = $puzzles[$grid][$h];
		$smob = $spawnlocs{$h}{"npc"};
		quest::spawn($smob, 0, 0, $sX,$sY,$sZ);
		}
	}

sub EVENT_SIGNAL
	{
	my $mod = $signal % 2;
	my $dist=2;
	$start=$signal;

	# Look right or left
	if (IS_IN_LIST(\@lefties, $signal))
		{
		# shoot left
		if ($mod == 0)
			{
			$dist = 3;		
			}
		$end=$signal-$dist;
		$step=-1;
		}
	else
		{
		# shoot right
		if ($mod > 0)
			{
			$dist = 3;		
			}
		$end=$signal+$dist;
		$step=1;
		}

	$delay=6;
	if (!CURE())
		{
		$delay=1;
		}

	quest::settimer("heal", $delay);

	quest::settimer("cure2", $delay+3);

	}


sub HEALED
	{
	my $i;
	my $j;

	for ($i=$start+$step; $i != $end+$step ; $i = $i + $step)
		{
		# If we find a healthy rat, stop and cure backwards
		if ($spawnlocs{$i}{"npc"} == 2156)
			{
			for ($j=$i-$step; $j != $start ; $j = $j - $step)
				{
				if ($spawnlocs{$j}{"npc"} == 2157)
					{
					my @npcs = $entity_list->GetNPCList();

					foreach $npc (@npcs)
						{
						my $mobX = int($npc->GetX());
						my $mobY = int($npc->GetY());
						if ($mobX == $spawnlocs{$j}{"x"} && 
							$mobY == $spawnlocs{$j}{"y"})
							{
							$npc->Depop();
							# Healthy spawn
							$spawnlocs{$j}{"npc"}=2156;
							quest::spawn($spawnlocs{$j}{"npc"}, 0, 0, 
								$spawnlocs{$j}{"x"}, $spawnlocs{$j}{"y"}, 
								$spawnlocs{$j}{"z"});
								 
							}
						}
					}
				}
			}
		}
	}

sub CURE
	{
	my $ci;
	my $cj;
	my $cc=0;

	for ($ci=$start+$step; $ci != $end+$step ; $ci = $ci + $step)
		{
		# If we find a healthy rat, stop and cure backwards
		if ($spawnlocs{$ci}{"npc"} == 2156)
			{
			for ($cj=$ci-$step; $cj != $start ; $cj = $cj - $step)
				{
				if ($spawnlocs{$cj}{"npc"} == 2157)
					{
					my @npcs = $entity_list->GetNPCList();
					foreach $npc (@npcs)
						{
						my $mobX = int($npc->GetX());
						my $mobY = int($npc->GetY());
						if ($mobX == $spawnlocs{$cj}{"x"} && 
							$mobY == $spawnlocs{$cj}{"y"})
							{
							$npc->SpellEffect(474, 100, 10, 1, 3000, 0);
							$npc->Emote("shivers as impurities are removed");
							$cc = $cc + 1;
							}
						}
					}
				}
			}
		}
	if ($cc > 0)
		{
		foreach $pc ($entity_list->GetClientList())
			{
			$pc->PlayMP3("RatCure.wav");
			}
		}
	return $cc;
	}

sub DERATIFY
	{
	my $di;
	my @npcs = $entity_list->GetNPCList();
	foreach $npc (@npcs)
		{
		my $mobX = int($npc->GetX());
		my $mobY = int($npc->GetY());
		for ($di=1;$di<=16;$di++)
			{
			if ($mobX == $spawnlocs{$di}{"x"} && 
				$mobY == $spawnlocs{$di}{"y"})
				{
				$npc->Depop(0);
				}
			}
		}

	$mazeactive=0;
	}

sub COUNT_DISEASED
	{
	my @dpcs = $entity_list->GetNPCList();
	my $c = 0;
	my $cdi;
	my $mobX;
	my $mobY;

	foreach $npc (@dpcs)
		{
		if ($npc->GetNPCTypeID() == 2157)
			{
			$mobX = int($npc->GetX());
			$mobY = int($npc->GetY());
			for ($cdi=1;$cdi<=16;$cdi++)
				{
				if ($mobX == $spawnlocs{$cdi}{"x"} && 
					$mobY == $spawnlocs{$cdi}{"y"})
					{
					$c = $c + 1;
					}
				}
			}
		}
	return $c;
	}

sub IS_IN_LIST
	{
	my $arr = shift;
	my $lnpc = shift;

	foreach (@{$arr})
		{
		if ($lnpc == $_)
			{
			return 1; 
			}
		}	

	return 0;
	}
