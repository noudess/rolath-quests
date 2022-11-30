sub EVENT_SPAWN
	{
	$prev_wp{$mobid}=-1;
	$personalpause{$mobid}=plugin::RandomRange(0,42);
	my $date = localtime;
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	$wpsave{$mobid} = $wp;

	quest::write("madmen.log", "$mobid : $wp : $wpsave{$mobid} : $prev_wp{$mobid}");

	my $date2 = localtime;

	if ($wpsave{$mobid} == $prev_wp{$mobid})
		{
		quest::resume(); # Grid got stuck, zone suspend maybe?
		}
	elsif ($wpsave{$mobid} == $personalpause{$mobid})
		{
		$pauselen{$mobid}=plugin::RandomRange(60,150);
		quest::pause($pauselen{$mobid});
		}

	$prev_wp{$mobid} = $wpsave{$mobid};
	}
