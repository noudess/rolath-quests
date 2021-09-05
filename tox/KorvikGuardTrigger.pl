my $thelevel=0;
my $group;
my $kobolds=0;
my $erudites=0;
my @koboldlist = (38192,38193,38194,38195,38196,38197,38198,38199,38200,38201,38202,38203,38204,38205,38206,38207,38208,38209);
my @eruditelist = (38182,38187,38183,38188,38184,38189,38185,38190,38186,38191);

sub EVENT_ENTER
	{
	plugin::playmp3once("war.mp3");
	}

sub EVENT_EXIT
	{
	plugin::playmp3once("");
	}

sub EVENT_SIGNAL
	{
	# clear any pending timer for normalcy..
	quest::stoptimer("backtonormal");
#	quest::shout2("War manager got signal to start war");
	quest::set_proximity(-494,-94,-2550,-2150,-53,-32);
	# Monitor the war
	my $starter = $signal;
    my $theclient = $entity_list->GetClientByAccID($starter);
    $group = $theclient->GetGroup();
    $thelevel = $group->GetHighestLevel()-2;
	quest::settimer("deathcount", 5);
	quest::settimer("levelcheck", 30);
	quest::settimer("korvikwar", 1800);
	}

sub EVENT_TIMER
	{
	if ($timer eq "backtonormal")
		{
		quest::clear_proximity();
		plugin::playmp3once("");
		quest::spawn_condition("tox", 3, 1);
		quest::stoptimer("backtonormal");
		}
	elsif ($timer eq "deathcount")
		{
		$kobolds = 0;
		$erudites = 0;
		# Count mobs on both sides.  If Either side is 0, we need to end the
		# war.
		my @moblist = $entity_list->GetMobList();

		foreach $mobby (@moblist)
			{
			my $npctype = $mobby->GetNPCTypeID();
			if (plugin::IS_IN_LIST(\@koboldlist, $npctype))
				{
				$kobolds = $kobolds + 1;
				}

			if (plugin::IS_IN_LIST(\@eruditelist, $npctype))
				{
				$erudites = $erudites + 1;
				}
			
			}		

		#quest::shout("Kobolds $kobolds -- Erudites $erudites");
		if ($kobolds == 0 or $erudites == 0)			
			{
			PROCESS_VICTORY();
			}
		if ($kobolds < 12 or $erudites < 12)
			{
			# Dont disquality in battle - someone may zone
			quest::stoptimer("levelcheck");
			}	
		}
	elsif ($timer eq "levelcheck")
		{
		quest::shout2("Rechecking group level for war");
		$newlevel = $group->GetHighestLevel()-2;
		if (($newlevel - 5) >= $thelevel)
			{
			$group->GroupMessage($npc, "Your party has grown more powerful than when you accepted the mission.  The deal is off.");
			END_WAR();
			}
		}
	elsif ($timer eq "korvikwar")
		{
		quest::shout2("War timed out");
		quest::depop(24308);
		END_WAR();
		}
	}

sub RESTORE_KOBOLDS
	{
	# Don't reset to normal guards for 30 min.
	# Lets PCs think paineel is unguarded
	quest::settimer("backtonormal", 1800);

	# Clear all Kobold forces spawn conditions.
	quest::spawn_condition("tox", 4, 0);
	quest::spawn_condition("tox", 5, 0);
	quest::spawn_condition("tox", 6, 0);
	quest::spawn_condition("tox", 7, 0);
	quest::spawn_condition("tox", 8, 0);
	}

sub CLEAR_ERUDITES
	{
	# Get rid of all spawned erurite forces.
	foreach (@eruditelist)
		{
		quest::depopall($_);
		}
	# Depop Creot also... so he is back to normal.
	quest::depop_withtimer(38053);
	}

sub END_WAR
	{
	quest::shout2("War ended");
	quest::stoptimer("korvikwar");
	quest::stoptimer("levelcheck");
	quest::stoptimer("deathcount");
	CLEAR_ERUDITES();
	$running=0;
	$kobolds=0;
	$erudites=0;
	}

sub PROCESS_VICTORY
	{
	if ($kobolds == 0)
		{
		# Go back to standard spawns
		quest::shout2("Erudites Win!");
		quest::signalwith(24308, 1); 
		RESTORE_KOBOLDS();
		}
	elsif($erudites == 0)
		{
		#Leave current kobold spawn conditions alone.
		quest::shout2("Kobolds Win!");
		quest::depop(24308);
		}
	else
		{
		quest::shout2("Owls Win!");
		quest::shout2("Owls Win!");
		quest::shout2("Owls Win!");
		quest::shout2("Owls Win!");
		quest::shout2("Owls Win!");
		}
	END_WAR();
	}

sub EVENT_SPAWN
	{
	quest::shout2("shit");
	CLEAR_ERUDITES();
	}
