sub EVENT_SPAWN
	{
	quest::emote("gazes upon his lance and begins to laugh maniacally");
	quest::shout("AH HAH! I am corporeal once more! I cannot hold this form for long, but it will be long enough for me to rip open that flea brothel and..well, I wont spoil it for you, heheheheh. Come! Assist me in the attack on the Kejekan village! The one that wears the iron beads must die at my hands and NO OTHER! Just make sure I get to him and you will be rewarded.");
	quest::SetRunning(1);
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 3)
		{
		quest::say("Kejekan! You smell it? That's the smell of death!");
		}
	elsif ($wp == 6)
		{
		quest::emote("points at Disciple Okarote.");
		quest::say("That's him!  Make my revenge complete!");
		plugin::DoAnim("point");
		}
	elsif ($wp == 7)
		{
		quest::say("He's escaped. I've failed.' Ridossan suddenly collapses into a pile of dust and is gone.");
		}
	}


sub EVENT_SIGNAL
	{
	quest::depop();
	}
