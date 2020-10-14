sub EVENT_SAY
	{
	if ($text=~/heretic/i)
		{
		quest::say("Oh, did Leraena send you?  Good to see her take action.  Yes, there is a Heretic Diplomat nosing around.  I saw her talking to Kobolds twice!  Can you imagine, covorting with animals!");
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("We need not raise our hands to our brothers.  Can we not just wait and see how negotiations go?");
	}
