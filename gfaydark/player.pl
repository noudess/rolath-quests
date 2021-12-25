my $lift69up = 0;
my $lift77up = 0;
my $lift80up = 0;

sub EVENT_ENTERZONE
	{
	quest::settimer("spires", 10);
	$nexus_gf   = undef;
	$spire_gf   = undef;
	$message_gf = undef;
	}

sub EVENT_TIMER
	{
	if ($timer eq "spires")
		{
		if (defined $qglobals{nexus_gf} && defined $qglobals{spire_gf}
			&& $qglobals{spire_gf} == 1 && plugin::check_hasitem($client, 19720))
			{
			quest::selfcast(2433);    #self only to avoid AE
			quest::setglobal("spire_gf", 0, 1, "F");
			quest::delglobal("message_gf");
			$client->NukeItem(19720);    #removes stone from inventory.
			$nexus_gf   = undef;
			$spire_gf   = undef;
			$message_gf = undef;
			}
		elsif (defined $qglobals{nexus_gf} && defined $qglobals{spire_gf}
			   && $qglobals{spire_gf} == 1 && !defined $qglobals{message_gf}
			   && !plugin::check_hasitem($client, 19720))
			{
			$client->Message(15, "You don't have the correct component to travel to Luclin.");
			quest::setglobal("message_gf", 1, 1, "M20") ;
			$nexus_gf   = undef;
			$spire_gf   = undef;
			$message_gf = undef;
			}
		elsif (defined $qglobals{nexus_gf} && defined $qglobals{spire_gf}
			   && $qglobals{spire_gf} == 1 && defined $qglobals{message_gf}
			   && !plugin::check_hasitem($client, 19720))
			{
			$nexus_gf   = undef;
			$spire_gf   = undef;
			$message_gf = undef;
			}
		}

	# The client seems to send the door home (bottom) after 20 seconds...
	# Emulate it so the door state is maintained.
	if ($timer eq "home69")
		{
		quest::stoptimer("home69");
		FORCE_CLOSE(73,74,69);
		$lift69up=0;
		}

	if ($timer eq "home77")
		{
		quest::stoptimer("home77");
		FORCE_CLOSE(79,78,77);
		$lift77up=0;
		}

	if ($timer eq "home80")
		{
		quest::stoptimer("home80");
		FORCE_CLOSE(81,82,80);
		$lift80up=0;
		}
	}

sub FORCE_CLOSE
	{
    local($lowbutt, $highbutt, $door);
    ($lowbutt, $highbutt, $door) = ($_[0], $_[1], $_[2]);

	if (quest::isdooropen($lowbutt))
		{
		quest::forcedoorclose($lowbutt);
		}

	if (quest::isdooropen($highbutt))
		{
		quest::forcedoorclose($highbutt);
		}

	quest::forcedoorclose($door);
	}

sub FORCE_OPEN
	{
    local($lowbutt, $highbutt, $door);
    ($lowbutt, $highbutt, $door) = ($_[0], $_[1], $_[2]);

	if (!quest::isdooropen($lowbutt))
		{
		quest::forcedooropen($lowbutt);
		}

	if (!quest::isdooropen($highbutt))
		{
		quest::forcedooropen($highbutt);
		}

	quest::forcedooropen($door);
	}

sub EVENT_CLICKDOOR 
	{
	# Handle The clickers
	if ($doorid == 73 || $doorid == 74)
		{
		if ($lift69up)
			{
			quest::stoptimer("home69");
			FORCE_CLOSE(73, 74, 69);				
			$lift69up=0;
			}
		else
			{
			quest::settimer("home69", 20);
			FORCE_OPEN(73, 74, 69);				
			$lift69up=1;
			}
		}

	if ($doorid == 79 || $doorid == 78)
		{
		if ($lift77up)
			{
			quest::stoptimer("home77");
			FORCE_CLOSE(79, 78, 77);				
			$lift77up=0;
			}
		else
			{
			quest::settimer("home77", 20);
			FORCE_OPEN(79, 78, 77);				
			$lift77up=1;
			}
		}

	if ($doorid == 81 || $doorid == 82)
		{
		if ($lift80up)
			{
			quest::stoptimer("home80");
			FORCE_CLOSE(81, 82, 80);				
			$lift80up=0;
			}
		else
			{
			quest::settimer("home80", 20);
			FORCE_OPEN(81, 82, 80);				
			$lift80up=1;
			}
		}
	}
