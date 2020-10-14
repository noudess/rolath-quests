my $alternate=0;

sub EVENT_SPAWN
	{
	quest::SetRunning(1);
	$npc->CastSpell(716, $npc->GetID());
	quest::settimer("selos", 7);
	}

sub EVENT_SAY
	{
	if ($text =~/hail/i)
		{
		quest::say("Hello $name.  I am here to collect mail for delivery to Erurin and beyond.  One day, we will build a [facility] here, but for now, I will have to do.");
		}
	elsif ($text =~/facility/i)
		{
		quest::say("Yes, the Antonican Bards hope to establish a base here.  I sure wish they'd get on with it.  I am not sure how long I can survive alone, making these dangerous treks. Perhaps you can [help]");
		}
	elsif ($text =~/help/i)
		{
		quest::say("Oh my, yes, would you?  We're going to need materials for the new outpost, and some carriers for the mail.  All I have now is this letter for [Paineel] and a message for [Aderius].");
		}
	elsif ($text =~/paineel/i)
		{
		quest::say("Oh yes!  It would really speed things up for me if I didn't have to stop in there.");
		quest::emote("shifts from side to side, looking rather uncomfortable");
		quest::summonitem(232506);
		plugin::Autovtell("thanks");	
		quest::say("Just find the Overlord.  He lives.. somewhere.. inside paineel.");
		}
	elsif ($text =~/Aderius/i)
		{
		quest::say("Someone in Aderius' pride asked for this message to be sent to him.");
		plugin::Autovtell("thanks");	
		quest::summonitem(232507);
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 9)
		{
		quest::say("I'm off to Mount Klaw.  Be well my fishing friends, and thank you for the fish stew.");
		}
	elsif ($wp == 14)
		{
		quest::say("Well my catty friends, it's time to head back to Erudin.  Please make sure I have all letters you require delivered.");
		}
	elsif ($wp == 15)
		{
		quest::say("Wish me luck!");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 16)
		{
		quest::spawn_condition("stonebrunt", 7, 0);
		}
	elsif ($wp == 2)
		{
		quest::say("Hello Peepers, I was told you could give me protection to cross the mountains safely.");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(999335,1,0)
			}
		}
	elsif ($wp == 6)
		{
		quest::say("Here is a package for you, sir.");
		}
	elsif ($wp == 7)
		{
		quest::say("This looks like a box of supplies for the lighthouse.");
		}
	elsif ($wp == 8)
		{
		quest::say("Wow, this is one Smelly Box, what is in this thing?");
		}
	elsif ($wp == 14)
		{
		quest::stoptimer("selos");
		quest::shout("Mail Call for all StoneBrunt citizens");
		}
	}

sub EVENT_TIMER
	{
	if ($alternate == 1)
		{
		$npc->CastSpell(7, $npc->GetID(),-1,1);
		$alternate=0;
		}
	else
		{
		$npc->CastSpell(717, $npc->GetID(),-1,1);
		$alternate=1;
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	# Spawn a corpse
	quest::spawn(101139, 0, 0, $x, $y, $z);
	quest::setanim(101139, 3);
	}
