sub EVENT_SPAWN
	{
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
	}

sub EVENT_ENTER
	{
	# if client does not have the key to this door, make sure if they get close
	# and they are feared, they dont path through (bug in eqemu code).
	# If they are already close, and then get feared, I guess its still broken.
	if (!$client->KeyRingCheck(20361))
		{
		my $cx = $client->GetX();
		if ($client->IsFeared())
			{
			if ($cx < -84.27)
				{
				quest::gmmove(-153, -273, -10.69)
				}
			else
				{
				quest::gmmove(-20, -273, -10.69)
				}
			}
		}
	}
