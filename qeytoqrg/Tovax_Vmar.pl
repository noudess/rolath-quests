# Just in case we reloadquests without repop
my $drop_note_loc=4761;
my $dropped=0;

sub EVENT_SPAWN
	{
	$drop_note_loc=quest::ChooseRandom(4761, 4439, 4845);
	}

sub EVENT_SAY
	{
	if ($text=~/Hail/)
		{
		if ($faction <= 6)
			{
			quest::say("What?  Who the heck are you and how do you know my name?!  Never mind... Just leave me alone!");
			}
		else
			{
			plugin::reject_say();
			}
		}
	}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Ooh... Aaah!! No! Please! Ouch.... Aarghhhhh!");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($dropped == 0 && $y == $drop_note_loc)
		{
		quest::creategroundobject(18802, $x, $y, $z, 0, 7200);
		$dropped=1;
		$drop_note_loc=quest::ChooseRandom(4761, 4439, 4845);
		}
	elsif ($dropped == 1)
		{
		$dropped=0;
		quest::say("Sragg is going to have my head for losing that letter.");
		}	
	}
