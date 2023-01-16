sub EVENT_ENTERZONE 
	{
	quest::settimer("tspires",10);
	}

sub EVENT_TIMER 
	{
	quest::debug("$timer");
	if ($timer eq "tspires")
		{
		my $tox = $client->GetGlobal(spire_tox);
		if (defined $qglobals{nexus_tox} && defined $tox && $client->GetGlobal(spire_tox) == 1)
			{
			if (plugin::check_hasitem($client, 19720)) 
				{
				quest::selfcast(2433); #self only to avoid AE
				$client->SetGlobal("spire_tox",0,1,"F");
				quest::delglobal("message_tox");
				$client->NukeItem(19720); #removes stone from inventory.
				}
			elsif (!defined $qglobals{message_tox} && !plugin::check_hasitem($client, 19720)) 
				{
				$client->Message(15,"You don't have the correct component to travel to Luclin.");
				#prevent component message from being spammed.
				$client->SetGlobal("message_tox",1,1,"M20");
				}
			}
		}
	}

sub EVENT_SIGNAL {
  if($signal == 666) {
    quest::updatetaskactivity(218,1,1);
  }
  if($signal == 667) {
    quest::failtask(218);
    $client->NukeItem(80038);
  }
}
