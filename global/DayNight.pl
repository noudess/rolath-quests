# This workarounds the problem when booted zone is already in-sync with spawn_events, and since no time updates occur the spawn_condition is defaulted to 0.

sub EVENT_SPAWN 
{
	EVENT_CYCLE();
	quest::settimer(1,20);
}

sub EVENT_TIMER
{
	
	EVENT_CYCLE();
	quest::stoptimer(1);
}

sub EVENT_CYCLE
{
	if($zonesn eq 'lakerathe' || $zonesn eq 'freportn' || $zonesn eq 'oot')
	{
		if ($zonetime < 600 || $zonetime > 1999) 
		{
			quest::spawn_condition($zonesn, 1,1);
		}
		else 
		{
			quest::spawn_condition($zonesn, 1,2);
		}
	}


	if($zonesn eq 'commons' || $zonesn eq 'everfrost' || $zonesn eq 'kithicor' || $zonesn eq 'lfaydark' || $zonesn eq 'northkarana' || $zonesn eq 'qey2hh1' || $zonesn eq 'rathemtn' || $zonesn eq 'riwwi' || $zonesn eq 'southkarana' || $zonesn eq 'eastwastes' || $zonesn eq 'sro' || $zonesn eq 'freportw' || $zonesn eq 'freporte')
	{
		if ($zonetime < 600 || $zonetime > 1999) 
		{
			quest::spawn_condition($zonesn, 2,0);
			quest::spawn_condition($zonesn, 1,1);
		}
		else 
		{
			quest::spawn_condition($zonesn, 2,1);
			quest::spawn_condition($zonesn, 1,0);
		}
	}
	
# Naxot	
	if($zonesn eq 'burningwood')
	{
		if ($zonetime < 100 || $zonetime > 1299) 
		{
			quest::spawn_condition($zonesn, 2,0);
		}
		else 
		{
			quest::spawn_condition($zonesn, 2,1);
		}
	}
	
# Gronk 1 Ryn 2
	if($zonesn eq 'oggok')
	{
		if ($zonetime < 800 || $zonetime > 1199) 
		{
			quest::spawn_condition($zonesn, 2,0);
			quest::spawn_condition($zonesn, 1,1);
		}
		else 
		{
			quest::spawn_condition($zonesn, 2,1);
			quest::spawn_condition($zonesn, 1,0);
		}
	}
}
