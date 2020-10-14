sub EVENT_SPAWN
	{
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
	}

sub EVENT_ENTER
	{
	# if client does not have the key to this door, make sure if they get close
	# and they are feared, they dont path through (bug in eqemu code).
	# If they are already close, and then get feared, I guess its still broken.
	if (!$client->KeyRingCheck(20362))
		{
		my $cx = $client->GetX();
		if ($client->IsFeared())
			{
			if ($cx < 54.09)
				{
				quest::gmmove(0, -567.21, -38.65)
				}
			else
				{
				quest::gmmove(93, -587, -38.65)
				}
			}
		}
	}
