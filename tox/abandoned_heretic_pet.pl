$lastx=0;
$lasty=0;

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($x == -380 && $y == -2570)
		{
		if ($lastx == -312)
			{
			quest::say("Snap to it, ingrates!  Do you always sleep on the job.  On your toes, such as they are. Speed up that digging!");
			quest::signal(38179);
			}
		}
	$lastx = $x;
	$lasty = $y;
	}

sub EVENT_ITEM { 
     if (plugin::check_handin(\%itemcount, 13894 => 1)){
          quest::say("Good work, you should be running this operation instead of that Talrigar fellow. Have a small reward. A little bit of the gems I found while tunneling through this rock.");
          quest::summonitem(quest::ChooseRandom(10015,10016,10017,10018)); 
               }
     else {
          plugin::return_items(\%itemcount);
          quest::say("I have no use for this.");
          }
     }
