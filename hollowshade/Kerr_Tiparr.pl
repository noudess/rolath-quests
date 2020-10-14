#Zone:hollowshade  ID:166011 -- Kerr_Tiparr

#Save spawn point - using stop and moveto loses it, despite sending 1 to save

my $savex=0;
my $savey=0;
my $savez=0;
my $saveh=0;

sub EVENT_SPAWN
	{
	$savex=$x;
	$savey=$y;
	$savez=$z;
	$saveh=$h;
	}

sub EVENT_SIGNAL
    {
	if ($signal == 5)		#One race has taken over Hollowshade
		{
		quest::SetRunning(1);
		quest::start(2);
		}
	elsif ($signal == 7)	#Hollowshade has been retaken!
		{
		quest::start(2);
		}
	}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == 2714)
		{
		# He reached his goal. Spread out.
		quest::stop();
		quest::moveto(2676, 1195, 143.12,360,1);
		}
	elsif ($x == 2004 && $signal == 7)
		{
		# Time to go back to guard spot
		quest::stop();
		quest::moveto($savex, $savey, $savez, $saveh,1);
		}
	}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to our humble outpost. traveller. Let me know if you see anything you need. I consider it an honor to sell here, for doing so enables Vah Shir in training to stay in the field.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,5566 => 1)) {
    quest::say("Thanks $name! That was delicious. Here is the empty bowl.");
    quest::summonitem(5567);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:hollowshade  ID:166011 -- Kerr_Tiparr
