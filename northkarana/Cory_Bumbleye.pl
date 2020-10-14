my $leader=0;

sub EVENT_SAY
	{
	if ($text=~/hail/i)
		{
		quest::say("Hey, $name!  I am Cory Bumbleye, expert [lycanthrope] tracker.  You had better be careful out here.  There are [werewolves] in these hills.  Heck, if it weren't for us [Fangbreakers], this whole area would be overrun with the flea-bitten beasts.");
		}
	if ($text=~/fangbreakers/i)
		{
		quest::say("I am a Fangbreaker.  We hunt werewolves.  We are the best in all of Antonica.");
		}
	if ($text=~/werewolves/i || $text=~/lycanthrope/i)
		{
		quest::say("Peh!  Werewolves are just overgrown dogs that need to be put down.  And let me tell you this, if a friend of yours ever survives a werewolf attack, I would watch him VERY closely.  If he is infected, you will have no choice but to slay him before he eats you.");
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
