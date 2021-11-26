sub EVENT_CAST_BEGIN
	{
	plugin::SetAnim(stand);
	quest::settimer("stand",10);
	}

sub EVENT_TIMER
	{
	plugin::SetAnim(sit);
	quest::stoptimer("stand");
	}
