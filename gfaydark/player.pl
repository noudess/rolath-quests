sub EVENT_ENTERZONE
	{
	quest::settimer("gspires", 10);
	}

sub EVENT_TIMER
	{
	if ($timer eq "gspires")
		{
		my $gfay = $client->GetGlobal(spire_gf);
		if (defined $qglobals{nexus_gf} && defined $gfay && $client->GetGlobal(spire_gf) == 1)
			{
			if (plugin::check_hasitem($client, 19720)) 
				{
				quest::selfcast(2433); #self only to avoid AE
				$client->SetGlobal("spire_gf",0,1,"F");
				quest::delglobal("message_gf");
				$client->NukeItem(19720); #removes stone from inventory.
				}
			elsif (!defined $qglobals{message_gf} && !plugin::check_hasitem($client, 19720)) 
				{
				$client->Message(15,"You don't have the correct component to travel to Luclin.");
				#prevent component message from being spammed.
				$client->SetGlobal("message_gf",1,1,"M20");
				}
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
