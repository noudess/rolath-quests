sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail, $name!  Bow before the greatness of the Clerics of Underfoot!  It is good to be a paladin in such an order as ours - to fight the good fight and defend Kaladim from the evil and undead.  If you be a paladin, then I pray you find the [courage to battle the undead].");
		}
	elsif ($text =~ /courage/i)
		{
		quest::say("Yes!!  To battle the undead is our greatest call.  There has been a rise in the number of dwarven skeletons seen in the Butcherblocks.  If you are a true member of this order, I shall reward you for the return of four bone chips.  We shall defend our land from evil!");
		}
	elsif ($faction > 5)
		{
		quest::say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!");
		}	
	elsif ($faction > 4)
		{
		quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist me in the crusade against the undead.");
		}	
	elsif ($text=~/remains of cromil/i) {
		quest::say("My brother Cromil ventured to the Plains of Karana on the continent of Antonica. He never returned. Rumor has it that his undead skeleton is now part of an undead army in the plains. To end this curse, I ask all good paladins of this temple to return his bones to me. Nothing less than a spell is my reward for such a deed.");
		}
	}

sub EVENT_ITEM
	{
	# Bone Chips (Kaladim) (START)
	if (plugin::check_handin(\%itemcount, 13073 => 4))
		{
		quest::say("You have done well. We thank you for your deed with this humble reward. The power behind the raising of our dead shall soon be found. You will earn more respect with more bone chips. I only wish you could assist in the return of the [remains of Cromil].");
		quest::summonitem(quest::ChooseRandom(2116, 2122, 5013, 5014, 5016, 5023, 6011, 13002, 13003));
		quest::exp(10);    # Experience
		quest::ding();
		quest::givecash("7", "10", "0", "0");    # Cash
		# factions verified on live.
		quest::faction(227, 10);                 # Clerics of Underfoot
		quest::faction(274, 10);                 # Kazon Stormhammer
		quest::faction(293, 7);                 # Miners Guild 249
		}

	if ($faction <= 4 && plugin::takeItems(13332 => 1))
		{
		quest::say("Many thanks, my friend. Now my brother can rest in peace. Please take this spell. May it serve you well.");
		#:: Give a random reward: 15203 - Spell: Cure Poison, 15201 - Spell: Flash of Light, 15200 - Spell: Minor Healing, 15209 - Spell: Spook the Dead, 15205 - Spell: True North, 15210 - Spell: Yaulp, 15213 - Spell: Cure Disease, 15223 - Spell: Hammer of Wrath, 15011 - Spell: Holy Armor
		quest::summonitem(quest::ChooseRandom(15203,15201,15200,15209,15205,15210,15214,15223,15011));
		quest::ding();
		quest::exp(10000);
		my %cash = plugin::RandomCash(150,200);
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		quest::faction(227,20);		#:: + Clerics of Underfoot
		quest::faction(274,20);		#:: + Kazon Stormhammer
		quest::faction(293,15);		#:: + Miners Guild 249
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}
