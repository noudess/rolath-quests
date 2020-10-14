sub EVENT_SPAWN
	{
	quest::set_proximity($x - 15, $x + 15, $y -15, $y + 15);
	}

sub EVENT_ENTER
	{
	quest::say("Have you met Jade?  We wait all this time, and build her wonderrrrful furniture to scratch up... and she's never arround!  Banker's hours!!");
	}

sub EVENT_SAY
	{
	if($text =~ /hail/i)
		{
		plugin::Autovtell("greet");
		}
	}
