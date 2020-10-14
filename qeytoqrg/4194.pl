sub EVENT_SPAWN
	{
	quest::shout2("Ahhhwwwwaaaaeeeeeee.....  Holly.... Hollly.... Holly....");
	quest::settimer("moanandgroan", 300);
	}

sub EVENT_SAY
	{
	quest::say("Holllllyyy..  Hollyy... Help me...");
	}

sub EVENT_TIMER
	{
	$message=plugin::RandomRange(1,4);
	if ($message == 1)
		{
		quest::shout2("My staff...  Where is my staff....");
		}
	elsif ($message == 2)
		{
		quest::shout2("The bear was eating me...  Where is my handdddd?");
		}
	elsif ($message == 3)
		{
		quest::shout2("Holly.... Hollly.... Holly....");
		}
	else
		{
		quest::shout2("My eternal love... where is she?  What has become of me?");
		}
	}

sub EVENT_ITEM
	{
	# Potion
	if (plugin::check_handin(\%itemcount, 14516 => 1))
		{
		quest::say("Ahhhhh.... Hollyyyyyy, my love, I found the source of the plague.  It is as we suspected, the Bloodsabers and their minion Tovax are behind this.  If I had proof of Tovax's death, I could surely rest in peace.");
		}

	# Neck
	if (plugin::check_handin(\%itemcount, 27414 => 1))
		{
		# Spawn bear - it will attack me.
		quest::say("Yes, my brave ones, you have dispatched the foul minion of the Bloodsabers.  I can be at peace knowing my beloved bears and my Holly will once again be safe.  You must have courage to face one more battle, and it will not be easy.  Take arms, I hear the defiled bear approaching....");
		quest::spawn2(4195, 0, 0, $x-200, $y+200, $z, 70);
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("At last our foe is dispatched, fair Holly.  Now my soul will join the souls of the other Protectors of the Pine in eternal peace.  I shall miss you my love.");
	quest::signal(4195);
	quest::depop(4194);
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::signal(4195);
	}

sub EVENT_ITEM
	{
	# Potion
	if (plugin::check_handin(\%itemcount, 14516 => 1))
		{
		quest::say("Ahhhhh.... Hollyyyyyy, my love, I found the source of the plague.  It is as we suspected, the Bloodsabers and their minion Tovax are behind this.  If I had proof of Tovax's death, I could surely rest in peace.");
		}

	# Neck
	if (plugin::check_handin(\%itemcount, 27414 => 1))
		{
		# Spawn bear - it will attack me.
		quest::say("Yes, my brave ones, you have dispatched the foul minion of the Bloodsabers.  I can be at peace knoing my beloved bears and my Holly will once again be safe.  You must have courage to face one more battle, and it will not be easy.  Take arms, I hear the defiled bear approaching....");
		quest::spawn2(4195, 0, 0, $x-200, $y+200, $z, 70);
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("At last our foe is dispatched, fair Holly.  Now my soul will join the souls of the other Protectors of the Pine in eternal peace.  I shall miss you my love.");
	quest::depop(4194);
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::signal(4195);
	}
