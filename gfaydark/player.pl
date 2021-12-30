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
	}

sub EVENT_CLICKDOOR 
	{
	# Handle The clickers
	if ($doorid == 73 || $doorid == 74)
		{
		quest::signal(54369);
		}

	if ($doorid == 79 || $doorid == 78)
		{
		quest::signal(54377);
		}

	if ($doorid == 81 || $doorid == 82)
		{
		quest::signal(54380);
		}
	}
