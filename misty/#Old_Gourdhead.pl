my $give=1;

sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50,$z-10,$z+10);
	}

sub EVENT_ENTER
	{
	if ($give == 1)
		{
		quest::say("HAHAHAHAHA!!  $name, you should not be here, this place is acursed.");
		quest::say("Here!  Noone can say I don't give of myself!  HAHAHAHAHAHAHA!");
		quest::summonitem(27411);
		quest::settimer("givedelay", 300);
		$give=0;
		}
	else
		{
		quest::say("You again $name?.  I told you this place was acursed!  Now you know!  HAHAHAHAHA!  Be gone I tell you, be GONE!!");
		quest::playerrace(82);
		}
	}

sub EVENT_TIMER
	{
	$give = 1;
	quest::stoptimer("givedelay", 300);
	}
