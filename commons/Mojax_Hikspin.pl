my $active = 0;

sub EVENT_SAY 
	{
	quest::settimer("sit", 10);
	plugin::SetAnim("stand");
	$npc->FaceTarget($client);

	if ($text=~/hail/i) 
		{
		quest::say("Hi. How are you? The fish are biting pretty good. That is what Skipynn tells me. I sure wish I had a different [job]. If I did, I could fish all day long.");
		}
	if ($text=~/job/i) 
		{
		quest::say("I am a messenger for [Antonius Bayle], ruler of the great city of [Qeynos].");
		if ($active == 0)
			{
			quest::settimer("walk", 60);
			}
		}
	if ($text=~/qeynos/i) 
		{
		quest::say("Huh?! Have you been living in a cave? The great city of Qeynos is the mightiest nation in Antonica! You'd best journey toward the west and visit the city whose influence stretches beyond the horizons.");
		}
	  if ($text=~/antonius bayle/i) 
		{
		quest::say("How can it be that you do not know of Antonius Bayle? Was it not he who named this great continent of Antonica? Is it not he who rules over the most powerful city on Norrath? Surely you jest!");
		}
	  if ($text=~/Hall of Truth/i) 
		{
		quest::say("I have been expecting you. I am very parched. Could you please get me a bottle of milk? Once you do that will show you where I hid the note.");
		$active = 1;
		quest::stoptimer("walk");
		# Give them 30 minutes to buy milk before reenabling walk
		quest::settimer("milktimeout", 1800);
		}
	}

sub EVENT_ITEM 
	{
	if ($faction > 4)
		{
		quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		}
	elsif (plugin::check_handin(\%itemcount, 13087 =>1 )) 
		{
		quest::say("Aaahhhh. Now that is refreshing. Just let me rest for a bit. The note is safe and sound in my bedroll inside the inn.");
		#Factions verified on live
		quest::faction(281,1 );
		quest::faction(271,-1 );
		quest::faction(330,-1 );
		quest::faction(311,1 );
		quest::faction(362,1 );
		quest::ding();
		quest::exp(100);
		quest::stoptimer("walk");
		quest::stoptimer("sit");
		quest::stoptimer("milktimeout");
		quest::settimer("rest", 6);
		}
	plugin::return_items(\%itemcount);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("$timer");
	if ($timer eq "milktimeout")
		{
		$active=0;
		}
	elsif ($timer eq "rest")
		{
		quest::start(86);
		my $dugx = plugin::RandomRange(1600,3200);
		my $dugy = plugin::RandomRange(0,-400);
		quest::spawn(21136,0,0,$dugx,$dugy,30);
		}
	elsif ($timer eq "walk")
		{
		quest::start(86);
		}
	elsif ($timer eq "die")
		{
		quest::depop_withtimer();
		}
	elsif ($timer eq "sit")
		{
		plugin::SetAnim(sit);
		}
	}

sub EVENT_WAYPOINT_ARRIVE
    {
    if ($wp == 5)
        {
		if ($active == 1)
			{
			quest::say("Here you are.  I hid it in this box behind the marker.  Take it to Eestyana of the Temple of Marr.  Goodbye.");
			}
		quest::creategroundobject(18822, $npc->GetX(), $npc->GetY(), -55, 0);
        }
    }

sub EVENT_SIGNAL
	{
	quest::moveto($npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading(), 1);
#	quest::stop();
	quest::say("Oh No!  Duggin has stolen the note!  It won't be in it's hiding place.  He took it,  HE took it.");	
	quest::settimer("die", 60);
	}
