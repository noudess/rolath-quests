sub EVENT_SPAWN
	{
	$prev_wp{$mobid}=-1;
	$personalpause{$mobid}=plugin::RandomRange(0,42);
	my $date = localtime;
	quest::write("/tmp/madmen", "$date: id($mobid) spawned pitstop($personalpause{$mobid})");
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	$wpsave{$mobid} = $wp;

	quest::write("/tmp/madmen", "$mobid : $wp : $wpsave{$mobid} : $prev_wp{$mobid}");

	my $date2 = localtime;
	quest::write("/tmp/madmen", "$date2: id($mobid) arrived at waypoint($wpsave{$mobid}) pitstop($personalpause{$mobid})");

	if ($wpsave{$mobid} == $prev_wp{$mobid})
		{
		quest::resume(); # Grid got stuck, zone suspend maybe?
		}
	elsif ($wpsave{$mobid} == $personalpause{$mobid})
		{
		quest::write("/tmp/madmen", "$date2: id($mobid) arrived at waypoint($wpsave{$mobid}) LONGPAUSE($personalpause{$mobid})");
		$pauselen{$mobid}=plugin::RandomRange(60,150);
		quest::pause($pauselen{$mobid});
		}

	$prev_wp{$mobid} = $wpsave{$mobid};
	}
