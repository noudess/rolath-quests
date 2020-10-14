my $eventclient=0;
my $saveX = 0;
my $saveY = 0;
my $leader = 0;

sub EVENT_SAY
	{
	if ($client->AccountID() == $eventclient)
		{
		quest::say("What you wait for, dog food?  Lead to forest.");
        $leader = $userid;
        quest::follow($userid);
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal < 0 && $eventclient == -$signal)
		{
		quest::stoptimer("followme");
		quest::sfollow();
		quest::crosszonesignalnpcbynpctypeid(38181, $eventclient);
		quest::repopzone();
		}
	elsif ($signal > 0)
		{
		$eventclient = $signal;
		quest::settimer("spawn", 1);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "spawn")
		{
		plugin::SpawnMixedFormation($mob,15, 3, 4, 5, 2, 101007, 101129, 101006, 101052);
		quest::stoptimer("spawn");
		quest::settimer("followme", 1);
		}
	else
		{
		my $curx;
		my $cury;
		$curx = $npc->GetX();
		$cury = $npc->GetY();

		if (abs($curx - $saveX) > .1  || abs($cury - $saveY) > .1)
			{
			$saveX=$curx;
			$saveY=$cury;
			plugin::FollowInFormation(101007, $npc,5);
			plugin::FollowInFormation(101129, $npc,5);
			plugin::FollowInFormation(101006, $npc,5);
			plugin::FollowInFormation(101052, $npc,5);
			}
		}
	}
