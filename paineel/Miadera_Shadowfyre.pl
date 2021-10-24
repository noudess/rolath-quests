#BeginFile paineel\Miadera_Shadowfyre.pl
#Quest for Paineel - Miadera Shadowfyre: Terror Forged Mask
#

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
		}

	if ($text =~ /Maugarim/i)
		{
		quest::say("Maugarim?  That traitor is dead to us.  She has been seen consorting with the kerran.  She understands no fear, aside from the fear of the light. It is said that she lives on an island in the Ridge.");
		}

	if (quest::istaskcompleted(74) && !quest::istaskcompleted(105))
		{
		if ($text =~ /betrayal/i)
			{
			quest::say("So, only when summoned do you have the intestines to look into my eyes.. this disgusts me.  I can see only one [way] for me to allow you to remain in my service.");
			}

		if ($text =~ /way/i)
			{
			quest::say("I require you to kill, disembowel, and bring Antus, of the Necromancers, the heads of any of the criminals that have slain our dogs.  Nothing short of that will allow me in good conscience to allow you to remain in our city.");
			if (!quest::istaskactive(105))
				{
				quest::assigntask(105);
				}
			}
		}

	if ($text =~ /summoning of terror/i)
		{
		# Summoning of Terror needs amiable..
		if ($faction > 5)
			{
			quest::say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!");
			}
		elsif ($faction > 4)
			{
			quest::say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");
			}
		else
			{
			quest::say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
			}
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 10523 - Eye of Urd, 19032 - Basalt Drake Scales, 14110 - Lens of Lord Soptyvr, 14109 - Widowmistress Hair
	if ($faction < 5 && plugin::takeItems(10523 => 1, 19032 => 1, 14110 => 1, 14109 => 1)) 
		{
		quest::say("Yes, this is what I require to summon Terror!"); #Text made up
		quest::emote("begins speaking an incantation. 'Our chanters have summoned the Avatar of Terror. Take him this mundane mask so that he may forge it into a truly valuable symbol of your devotion to the lord of Fear!'");
		#:: Give a 14106 - Mundane Mask
		quest::summonitem(14106);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(265,400);	# + Heretics
		quest::faction(254,-400);	# - Gate Callers
		quest::faction(242,-400);	# - Deepwater Knights
		quest::faction(231,-400);	# - Craftkeepers
		quest::faction(233,-400);	# - Crimson Hands
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1111 to 9999cp
		my %cash = plugin::RandomCash(1111,9999);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Spawn an avatar_of_terror (75169)
		#:: Need some detail on this mob...
		quest::unique_spawn(75169,0,0,474,1230,-37,128);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
