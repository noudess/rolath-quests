sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("How dare you speak to me, you impudent sack of naseating refuse! For this outrage of insubordination I call forth the vengeance of House Mistmoore! You now have little time left to live. Enjoy it.");
		quest::attack($name);
		}
	}

sub EVENT_DEATH_COMPLETE
	{
	quest::spawn2(59129,0,0,-164,89,-220.88,113);
	}
