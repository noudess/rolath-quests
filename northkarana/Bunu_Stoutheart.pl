my $leader=0;

sub EVENT_SAY
	{
	if ($text=~/hail/i)
		{
		quest::say("Hail, $name!  I am Bunu Stoutheart of the [Fangbreakers].  I am a loyal shaman who serves the will of the Tribunal.");
		}
	if ($text=~/fangbreakers/i)
		{
		quest::say("The Fangbreakers are Norrath's foremost [lycanthrope] hunters.  We bring those bloodthirsty beasts to justice.");
		}
	if ($text=~/lycanthrope/i)
		{
		quest::say("Lycanthropes, or werewolves, are victims of a horrible curse that transforms them into vicious murdering beasts.  But the fact that they are not in control of themselves does not excuse them from responsibility! They must be punished for the atrocities they commit!");
		}
	}

sub EVENT_SIGNAL
	{
	# Park here.
	$npc->SaveGuardSpot($x, $y, $z, $h);
	quest::sfollow();

	# Set a timer to follow Nul after a bit.
	$leader=$signal;
	quest::say("FANGBREAKERS HO!!");
	quest::settimer("follow", 10);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("follow");
	# follow Nul at random range
	my $range = plugin::RandomRange(20, 50);
	quest::follow($leader, $range);
	}
