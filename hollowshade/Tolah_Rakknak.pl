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
		quest::moveto(2650, 1255, 143.12,360,1);
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
quest::say("Hello. $name. you may call me Tolah. Please feel free to peruse my wares. I think you'll find my prices very fair considering the risk I am taking to bring them here. If not. you can always go all the way to town to do your shopping.");
	quest::SetRunning(1);
 }
}
#END of FILE Zone:hollowshade  ID:166012 -- Tolah_Rakknak 

