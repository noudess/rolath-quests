sub EVENT_SPAWN
	{
	my $now = $zonetime;
	my $hourlen = length($now) -2;

	my $hour = substr($now, 0, $hourlen);
	my $minutes = substr($now, $hourlen, 2);
	my $leavetime;

# $wp sticking around somehow?
	$wp = 0;

# Fix any broken spawn _condition settings from  zone crash or shutdowns.
	quest::spawn_condition("tox", 3, 0);
	quest::spawn_condition("paineel", 1, 0);
	quest::spawn_condition("warrens", 1, 0);
	quest::spawn_condition("stonebrunt", 7, 0);

#	quest::shout($now);
#    quest::shout("Hour is $hour, Minutes is $minutes");

	if ($hour < 9)
		{
		$leavetime = (9 * 60) - ($hour * 60) - (60-$minutes);
		}
	elsif ($hour == 9)
		{
		$leavetime = 20 ; # will scale down to 1 minute real time
		}
	else
		{
		$leavetime = ((24 - $hour) * 60) - $minutes + (9 * 60);
		}

#	quest::shout("Leave in $leavetime game minutes");
	my $realmin = ($leavetime * 0.05);
#	quest::shout("Leave in $realmin life minutes");
	
	quest::settimer("route", $realmin * 60);
	}

sub EVENT_SAY
	{
	if ($text=~/hail/i)
		{
		if (quest::istaskcompleted(66))
			{
			quest::say("Hello $name.  How do I look in the uniform you brought me?");
			quest::signalwith(24097, 1);
			}
		else 
			{
			quest::say("How can I help you, $name.  If you're here about [mail] talk to Ticar here.");
			quest::signalwith(24097, $client->AccountID());
			}
		}
	if ($text=~/Jusean/i)
		{
		quest::say("Yeah, he's a bigwig with the bards back in the city.  He always wanted me to follow in his footsteps. Lets see how he feels when I get mauled delivering mail.");
		plugin::DoAnim("disagree");
		}

	if ($text=~/route/i)
		{
		quest::say("The Erudites have apparantly received news that there is the potential for problems across their lands, and that a possible alliance with the more intelligent cats living in the fortress atop [Mount Klaw] might be essential to maintaining their superiority over their lands.  They believe a mail route will open communication with the Kejeken cats and that an alluiance might grow.");
		}

	if ($text=~/Mount Klaw/i)
		{
		quest::say("That's the highest peak in all of the stonebrunt mountains.  This is where the new postal carrier would live, presumendly.  That's another issue.  I am much fonder of cats than dogs, that is certain, but I have my allergies to be concerned with.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1378 => 1)) 
		{
		$client->UpdateTaskActivity(66, 0, 1);
		}
	if (plugin::check_handin(\%itemcount, 1379 => 1)) 
		{
		$client->UpdateTaskActivity(66, 1, 1);
		}
	elsif (plugin::check_handin(\%itemcount, 1380 => 1)) 
		{
		$client->UpdateTaskActivity(66, 2, 1);
		}
	if (plugin::check_handin(\%itemcount, 1381 => 1)) 
		{
		$client->UpdateTaskActivity(66, 3, 1);
		}
	if (plugin::check_handin(\%itemcount, 1382 => 1)) 
		{
		$client->UpdateTaskActivity(66, 4, 1);
		}
	if (plugin::check_handin(\%itemcount, 1383 => 1)) 
		{
		$client->UpdateTaskActivity(66, 5, 1);
		}
	if (plugin::check_handin(\%itemcount, 1384 => 1)) 
		{
		$client->UpdateTaskActivity(66, 6, 1);
		}
	if (plugin::check_handin(\%itemcount, 1385 => 1)) 
		{
		$client->UpdateTaskActivity(66, 7, 1);
		}
	if (plugin::check_handin(\%itemcount, 1386 => 1)) 
		{
		$client->UpdateTaskActivity(66, 8, 1);
		}
	if (plugin::check_handin(\%itemcount, 1387 => 1)) 
		{
		$client->UpdateTaskActivity(66, 9, 1);
		}
	if (plugin::check_handin(\%itemcount, 1388 => 1)) 
		{
		$client->UpdateTaskActivity(66, 10, 1);
		}
	if (plugin::check_handin(\%itemcount, 1389 => 1)) 
		{
		$client->UpdateTaskActivity(66, 11, 1);
		}
	if (plugin::check_handin(\%itemcount, 16828 => 1)) 
		{
		$client->UpdateTaskActivity(66, 12, 1);
		}
	if (plugin::check_handin(\%itemcount, 14514 => 1)) 
		{
		quest::emote("gazes at the murky substance");
		quest::say("What is this?");
		$haspotion=1;
		}
	plugin::return_items(\%itemcount);
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
		quest::emote("sighs");
		plugin::DoAnim("disagree");
		quest::say("You know exactly how excited I am to be here, Ticar.  Now be a good lad and fetch us some Vasty Deep Ale.");
		}
	elsif ($signal == 2)
		{
		quest::say("I wouldn't be so sure about that, my new friend.  There are talks of delays... and delays mean..... ALE!!");
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	$npc->CastSpell(717, $npc->GetID());
	if ($wp == 0)
		{
		quest::shout("Well Ticar, I'm off to Stonebrunt.  Make my funeral a memorable one.");
		}
	elsif ($wp == 16)
		{
		quest::emote("mumbles to himself, I guess this way");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 16)
		{
		quest::emote("shakes his head not sure which way to go");
		}
	elsif ($wp == 27)
		{
		quest::spawn_condition("erudnext", 3, 0);
		quest::spawn_condition("tox", 3, 1);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("route");
	quest::start(1);
	}
