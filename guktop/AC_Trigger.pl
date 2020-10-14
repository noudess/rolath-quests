#BEGIN Ancient Croc spawn simulation

my $numcrocs=0;
my $AC=65139;
my $waitingfordeath=1;

sub EVENT_SPAWN
	{
	quest::ze(15,"Starting Ancient Croc cycle code");
	SPAWN_CROCS();
	}


sub SPAWN_CROCS
	{
	$numcrocs=plugin::RandomRange(1,5);
	if ($numcrocs == 1)
		{
		# Spawn the AC (in middle)
        quest::spawn2($AC,0,0,475,1655,-74,131);
		}
	elsif ($numcrocs == 2)
		{
		# Spawn crocs 2 & 4
        quest::spawn2(65134,0,0,460,1677,-74,160);
        quest::spawn2(65068,0,0,459,1642,-74,122);
		}
	elsif ($numcrocs == 3)
		{
		# Spawn  crocs 1 3 and 5
        quest::spawn2(65095,0,0,480,1683,-74,90);
        quest::spawn2(65069,0,0,475,1655,-74,131);
        quest::spawn2(65094,0,0,479,1622,-74,90);
		}
	elsif ($numcrocs == 4)
		{
		# Spawn  crocs 1 2 4 5
        quest::spawn2(65095,0,0,482.47,1686.72,-70.47,181);
        quest::spawn2(65134,0,0,460,1677,-74,160);
        quest::spawn2(65068,0,0,459,1642,-74,122);
        quest::spawn2(65094,0,0,479,1622,-74,90);
		}
	elsif ($numcrocs == 5)
		{
		# Spawn  all 5 normal crocs
        quest::spawn2(65095,0,0,482.47,1686.72,-70.47,181);
        quest::spawn2(65134,0,0,460,1677,-74,160);
        quest::spawn2(65069,0,0,475,1655,-74,131);
        quest::spawn2(65068,0,0,459,1642,-74,122);
        quest::spawn2(65094,0,0,479,1622,-74,90);
		}
	$waitingfordeath = 1;
	}

sub EVENT_SIGNAL
	{
	quest::ze(15,"croc death");
	if ($waitingfordeath == 1)
		{
		# Set Timer on respawns
		$waitingfordeath = 0;
		quest::settimer("NextSpawn", 960);
		quest::ze(15,"Starting Timer for next cycle");
		}
	}

sub EVENT_TIMER
	{
	quest::ze(15,"Timer up depop and respawn");
	quest::stoptimer("NextSpawn");
    quest::depop(65095);
    quest::depop(65134);
    quest::depop(65069);
    quest::depop(65068);
    quest::depop(65094);
	SPAWN_CROCS();
	}
