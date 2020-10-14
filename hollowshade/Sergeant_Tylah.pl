#Save spawn point - using stop and moveto loses it, despite sending 1 to save

my $savex=0;
my $savey=0;
my $savez=0;
my $saveh=0;
my $enamored=0;

sub EVENT_SPAWN
	{
	$savex=$x;
	$savey=$y;
	$savez=$z;
	$saveh=$h;
	}

sub EVENT_SAY 
	{
	if($enamored==1 && $userid==$qglobals{MoorSavior} && $text=~/hail/i)
		{
		quest::doanim(62);
		quest::say("I am quite impressed with you, $name");
		quest::say("I hereby don thee, $name Savior of the Moor!");
		quest::enabletitle(2);
		quest::settimer("ReverantPause", 5);
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Good day to you $name, would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food.");
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "ReverantPause")
		{
		quest::stoptimer("ReverantPause");
		quest::say("Be well, savior!");
		quest::doanim(27);
		quest::settimer("BackToWork", 3);
		}
	if ($timer eq "BackToWork")
		{
		$enamored=0;
		quest::stoptimer("BackToWork");
		quest::sfollow();
		quest::moveto($savex, $savey, $savez, $saveh,1);
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3457 => 4)) {
    quest::emote("devours all four of the eggs in the blink of an eye, 'Delicious! May the spirits bless you $name! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
    quest::summonitem(3459);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}


sub EVENT_SIGNAL
    {
	if ($signal == 5)		#One race has taken over Hollowshade
		{
		quest::SetRunning(1);
		quest::shout("Guards, merchants, we cannot win this battle! Grab what you can carry and retreat back to Shar Vahl! Hurry!");
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
		quest::shout("Wait!  Guard the way to Shar Vahl!  We cannot let them advance any further.");
		quest::moveto(2645, 1206, 143.12,360,1);
		}
	elsif ($x == 2004 && $signal == 7)
		{
		# Time to go back to guard spot
		quest::stop();
		quest::shout("Praise be!  The enemy's leader has been defeated!  Guards!  Back to your posts!!");
		quest::follow($qglobals{MoorSavior});
		$enamored=1;
		}
	}
