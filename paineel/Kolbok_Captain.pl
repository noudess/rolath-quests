my $saveX = 0;
my $saveY = 0;
my $linecount = 0;

sub EVENT_SPAWN
	{
	$linecount = 0;
	quest::signalwith(10,100); # Tell zone controller about event.	
	quest::processmobswhilezoneempty(1);
	quest::settimer("spawn", 1);
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	my $date2 = localtime;
	quest::write("KolbokMovement.log", "$date2: arrived at waypoint($wp)");
	}

sub EVENT_TIMER
	{
	if ($timer eq "spawn")
		{
		plugin::SpawnMixedFormation($mob,15, 3, 4, 5, 2, 75165, 75166, 75167, 75168);
		quest::stoptimer("spawn");
		quest::settimer("form", 5);
		}
	elsif ($timer eq "form")
		{
		$linecount = $linecount + 1;
		quest::write("KolbokMovement.log", "$linecount : forming");
		if ($linecount == 1)
			{
			quest::shout("The liars must pay for breaking the pact with Clan Kolbok!");
			}
		elsif ($linecount == 2)
			{
			quest::shout("Prepare for battle.  Magiks to be used now!");
			quest::settimer("form", 60);
			}
		elsif ($linecount == 3)
			{
			quest::shout("Form the lines!  Form the lines!");
			quest::settimer("followme", 1);
			quest::settimer("form", 30);
			}
		elsif ($linecount == 4)
			{
			quest::stoptimer("form");
			quest::shout("Betrayers they are.  Let them all die!  To the gates!");
			}
		}
	else
		{
		my $curx;
		my $cury;
		$curx = $npc->GetX();
		$cury = $npc->GetY();

		quest::write("KolbokMovement.log", "X ($curx) Y ($cury)");
		if (abs($curx - $saveX) > .1  || abs($cury - $saveY) > .1)
			{
			$saveX=$curx;
			$saveY=$cury;
			plugin::FollowInFormation(75165, $npc,5);
			plugin::FollowInFormation(75166, $npc,5);
			plugin::FollowInFormation(75167, $npc,5);
			plugin::FollowInFormation(75168, $npc,5);
			}
		}
	}
