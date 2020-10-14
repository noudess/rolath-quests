sub EVENT_SPAWN
	{
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
	}

sub EVENT_ENTER
	{
	# if client does not have the key to this door, make sure if they get close
	# and they are feared, they dont path through (bug in eqemu code).
	# If they are already close, and then get feared, I guess its still broken.
	if (!$client->KeyRingCheck(20363))
		{
		my $cy = $client->GetY();
		if ($client->IsFeared())
			{
			if ($cy > -631)
				{
				quest::gmmove(-177, -590, -66.65)
				}
			else
				{
				quest::gmmove(-173, -678, -67.65)
				}
			}
		}
	}
