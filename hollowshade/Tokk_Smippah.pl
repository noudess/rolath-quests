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
		quest::moveto(2722, 1299, 143.12,360,1);
		}
	elsif ($x == 2004 && $signal == 7)
		{
		# Time to go back to guard spot
		quest::stop();
		quest::moveto($savex, $savey, $savez, $saveh,1);
		}
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name. I am Tokk. perhaps you've heard of me? I'd be out in the forest aiding in the war if it weren't for some nasty wounds I took from the grunts. I'm working here as a merchant until they heal. then it's back to the fray. I'll be back out there soon. perhaps we'll raid a grimling camp together."); }
}
#END of FILE Zone:hollowshade  ID:166010 -- Tokk_Smippah 

