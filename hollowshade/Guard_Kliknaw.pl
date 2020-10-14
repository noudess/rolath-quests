#Guard_Kliknaw  Hollowshade  ID  166078

#Save spawn point - using stop and moveto loses it, despite sending 1 to save

my $savex=0;
my $savey=0;
my $savez=0;
my $saveh=0;

sub EVENT_COMBAT
	{
	my $cur_target = $npc->GetHateTop();
	if($cur_target) 
		{
        my $target_name = $cur_target->GetCleanName();

		if ($combat_state == 1)
			{
			quest::say("Not on my watch, $target_name. Shar Vahl has no tolerance for aggression here!");
			}
        }

	if ($combat_state == 0)
		{
		quest::say("Let that be a message to the Moor.");
		}
	}

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
		quest::moveto(2637, 1226, 143.12,360,1);
		}
	elsif ($x == 2004 && $signal == 7)
		{
		# Time to go back to guard spot
		quest::stop();
		quest::moveto($savex, $savey, $savez, $saveh,1);
		}
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6220 =>1 )) {
  quest::emote("yells, 'Head count! Head count time!' A moment later he says");
    quest::say("I'm pretty sure that they're all here. Just take this back and act like your didn't just see that.");
    quest::emote("He winks and hands you the report.");
    quest::summonitem(6221);
    quest::faction(1513,10 );
    quest::exp(1000);
quest::ding();
  }
  plugin::return_items(\%itemcount);
}
