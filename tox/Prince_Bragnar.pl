my $eventclient= 0;

sub EVENT_SPAWN
	{
	quest::settimer("depop", 360);
	}

sub EVENT_SAY
	{
	if ($client->AccountID() == $eventclient)
		{
		quest::say("Dogs protect your puny city now.  Tell leaders not to break deal or they will not live to see next meal");
		quest::enabletitle(49);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("depop");
	quest::say("I go back to caves now.  You waeklings stay in the light");
	quest::depop();
	}

sub EVENT_SIGNAL
	{
	$eventclient = $signal;
	}
