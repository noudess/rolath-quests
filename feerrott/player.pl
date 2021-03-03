sub EVENT_ENTERZONE
	{
	# Goofy shit cause movepc doesnt honor heading
	my $xx = $client->GetX();
	my $yy = $client->GetY();
	if ($xx == -90 and $yy == -1488)
		{
		quest::movepc(47, -90, -1488, 51, 380);
		}
	}
