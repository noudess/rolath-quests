sub EVENT_SPAWN
	{
	quest::set_proximity($x-200,$x+200,$y-200,$y+200); 
	}

sub EVENT_ENTER
	{
	my $songkey = $client->AccountID();
	if (quest::get_data($songkey))
		{
		# Song already playing
		}
	else
		{
		$client->PlayMP3("AveMaria.mp3");
		quest::set_data($songkey, 1, 1200); # Don't replay for 20 minutes.
		}
	}
