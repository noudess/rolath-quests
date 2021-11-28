my $liftUp = 0;
my $key=6378;
my %locked= (
	246 => { "skill" => 60 },
	247 => { "skill" => 60 }
	);

sub EVENT_CLICKDOOR 
	{
	# The rock to let you into paineel is a major PITA.
	# We want it to always alter the state of door 25.

	# Handle the lock
	if ($doorid == 246 || $doorid == 247)
		{
		my $skill = $client->GetSkill(35);
		my $need = $locked{$doorid}{"skill"};
		my $onring = $client->KeyRingCheck($key);
		my $haskey = plugin::check_hasitem($client, $key);

		if (!$haskey && !$onring && ($need > $skill))
			{
			$client->Message(13,"The Paineel entrance is locked");
			$client->Message(13,"You do not have the key.");
			}
		else
			{
			if (!$onring && $haskey)
				{
				$client->KeyRingAdd($key);
				}

			if ($doorid == 246) 
				{
				if ($liftUp)
					{
					quest::stoptimer("home");
					quest::forcedoorclose(246);
					quest::forcedoorclose(25);
					$liftUp=0;
					}
				else
					{
					$client->Message(14, "Welcome to Paineel");
					quest::forcedooropen(246);
					quest::forcedooropen(25);
					$client->CheckIncreaseSkill(35);
					$liftUp=1;
					quest::settimer("home", 15);
					}
				}

			if ($doorid == 247)
				{
				if (!$liftUp)
					{
					quest::forcedooropen(246);
					quest::forcedooropen(25);
					quest::settimer("home", 23);
					$liftUp = 1;
					$client->CheckIncreaseSkill(35);
					}
				else
					{
					quest::stoptimer("home");
					quest::forcedoorclose(246);
					quest::forcedoorclose(25);
					$liftUp=0;
					}
				}
			}
		}
	}

sub EVENT_TIMER
	{
	# The client seems to send the door home (bottom) after 20 seconds...
	# Emulate it so the door state is maintained.
	quest::stoptimer("home");
	if (quest::isdooropen(246))
		{
		quest::forcedoorclose(246);
		}
	quest::forcedoorclose(25);
	$liftUp=0;
	}
