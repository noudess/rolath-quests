sub EVENT_SPAWN
	{
	quest::settimer("recast", 60);
	}

sub EVENT_SAY
	{
	quest::say("ah yes, hail... I am busy.  Leaving me alone please you will?  I'm not good feeling.");
	quest::castspell(587, $mobid);  # Illusion Erudite.
	}

sub EVENT_TIMER
	{
	quest::emote("looks around to see if anyone sees him");
	quest::castspell(587, $mobid);  # Illusion Erudite.
	quest::settimer("recast", 2400);
	}
