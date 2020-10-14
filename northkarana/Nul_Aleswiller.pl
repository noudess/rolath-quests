sub EVENT_SAY
	{
	if ($text=~/hail/i)
		{
		if (quest::istaskactivityactive(59,4))
			{
			quest::say("Well done!  I have used the components to imbue the wristband with the power to cure lycanthropy!  Take this and may it help your friend");
			quest::updatetaskactivity(59,4,1);
			}
		else
			{ 
			quest::say("Hail, $name!  What brings you out this way?  I am the leader of the [Fangbreakers].  We are employed by the [people of the Plains of Karana] to keep their homeland free of [lycanthropes].  We are on the trail of several particularly nasty [werewolves].");
			}
		}
	if ($text=~/Fangbreakers/i)
		{
		quest::say("The Fangbreakers are the greatest [lycanthrope] hunters in all of Norrath!  I am the leader and a warrior of great prowess.  Fixxin is the spellslinger in our little band.  Cory is our tracker and scout.  My tall friend Bunu keeps us all healthy as well as lending some added muscle to the group.");
		}
	if ($text=~/lycanthrope/i || $text=~/werewol/i)
		{
		quest::say("Lycanthropes or werewolves, as the peasants call them, are humans, barbarians or Erudites who are cursed with a dread disease which, under the light of the moon, transforms them into ravenous beasts of great strength and even greater hunger for living flesh.  They prowl these hills, so beware!");
		}
	if ($text=~/people of the Plains of Karana/i)
		{
		quest::say("The Plains of Karana are home to many different people of many races, but most of them are humans.  They are mainly farmers by trade.");
		}
	if ($text =~ /cure/i)
		{
		quest::say("Of course the Fang Breakers have found a cure!  But the components are very rare.  Each of my team has a skill for converting a component into an essence that is vital to the whole.  I urge you to find these components, as well as a rare armpiece seen on the werewolves that wander the Karanas.  With these, I think we can help you.");
		quest::assigntask(59);
		}
	}

sub EVENT_SPAWN
	{
	# We spawn in and we buff.  We have friends to buff.  It takes some time
	# so set a timer and buff after that timer.
	#
	# We always head out before the others
	quest::settimer("letbuffsfinish", 5);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("letbuffsfinish");
	quest::start(109);
	}

sub EVENT_WAYPOINT_DEPART
	{
	quest::signalwith(13063, $npc->GetID()); #Fixxin
	quest::signalwith(13062, $npc->GetID()); #Bunu
	quest::signalwith(13064, $npc->GetID()); #Cory
	quest::say("Ok, you chuckleheads!  SOUND OFF!");
	}
