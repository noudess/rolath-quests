sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say( "Step forth, young $name! I heard that you have come of age! The spirit of adventure has entered your body. That is good. Go and speak with the others. They shall help you. I am afraid I have no time to spend conversing. There is much I have to [ponder].");
		}
	elsif ($faction > 5)
		{
		quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	elsif ($text =~ /doran vargnus/i)
		{
		quest::say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live.");
		}
	elsif ($faction > 4)
		{
		quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
		}
	elsif ($text =~ /ponder/i)
		{
		quest::say("Must you know everyone's business? Hmm.. Maybe you can be of assistance. You see, I have been instructed by Furtog to tend to a matter of extreme urgency, which is keeping me from clearing the mines of rats. Will you assist and [exterminate the rats]?");
		}
	elsif ($text =~ /exterminate the rats/i)
		{
		quest::say("Very good! I shall reward you for every four giant rat pelts returned to me. And be on the lookout for a [metal rats]!");
		}
	elsif ($text =~ /metal rat/i)
		{
		quest::say("I cannot tell you how many reports I have heard of metal rats in Kaladim. I first thought it was a vision obtained from having too many Tumpy Tonics, but Furtog himself is said to have seen them. If you ever catch sight of the little metal beast, give chase!! Return its metal carcass to me and I shall reward you.");
		}
	elsif ($text =~ /important stormguard matter/i)
		{
		quest::say("I am apprehensive about sending one who is so young out into the world, but I have a good feeling about you, $name. Someone has stolen the [Eye of Stormhammer]. You must journey to Antonica and go to a place called Highpass Hold. The rogue who has it is locked up in the prison. We have arranged for his extradition to Kaladim. Please give the jail clerk this note of release.");

		#:: Give a 18935 - Sealed Note
		quest::summonitem(18935);
		}
	elsif ($text =~ /eye of stormhammer/i)
		{
		quest::say("The great statue of Kazon Stormhammer was once encrusted with two great gems from the mines of Butcherblock. So big were they that it took the magic of the high elves to assist us in lifting them to the statue's face. In the year 2995, somehow, someone stole one of the eyes. We decided to keep the remaining eye in the vault. Now, even that has been stolen from us! Only the most trusted warriors may be involved in this [important Stormguard matter].");
		}
	elsif ($text =~ /jendl mizebrite/i)
		{
		quest::say("Long ago, before King Kazon Stormhammer declared this to be Kaladim, these caverns were the lair of a great dragon. It was Jendl Mizebrite who happened upon his lair and fought him to the death. Jendl smashed the great dragon's skull with his trusty warhammer, but not before losing an arm. Thanks to his heroic deed, we now call these caves Kaladim.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match four 13054 - Giant Rat Pelt
	if ($faction <5 && plugin::takeItems(13054 => 4))
		{
		quest::say("Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that [metal rat]. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator.");

		quest::ding();
		# Factions correct per ZAM
		quest::faction(312, 10);    #:: + Storm Guard
		quest::faction(274, 1);     #:: + Kazon Stormhammer
		quest::faction(293, 1);     #:: + Miner's Guild 249
		quest::faction(290, 2);     #:: + Merchants of Kaladim
		quest::faction(232, -2);    #:: - Craknek Warriors
		quest::exp(500);

		my %cash = plugin::RandomCash(25, 35);

		quest::givecash($cash{copper}, $cash{silver}, $cash{gold}, $cash{platinum});
		quest::summonitem(quest::ChooseRandom(10015, 13036, 1051, 13003, 13002));
		}

	#:: Match a 13282 - Scrap Metal
	elsif ($faction < 5 && plugin::takeItems(13282 => 1))
		{
		quest::say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh yes.. And take this card to a man named [Doran Vargnus]. He is a fine blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist in an [important Stormguard matter].");

		#:: Give a 13995 - Knight
		quest::summonitem(13995);
		quest::ding();
		# factions verified on ZAM
		quest::faction(312, 20);    #:: + Storm Guard
		quest::faction(274, 3);     #:: + Kazon Stormhammer
		quest::faction(293, 3);     #:: + Miner's Guild 249
		quest::faction(290, 5);     #:: + Merchants of Kaladim
		quest::faction(232, -5);    #:: - Craknek Warriors
		quest::exp(500);

		my %cash = plugin::RandomCash(1, 10);
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});
		}

	#:: Match a 13321 - Eye of Stormhammer
	elsif ($faction < 5 && plugin::takeItems(13321 => 1))
		{
		quest::say("You have returned the Eye of Stormhammer!! We almost gave up on your return. You do not look like the young pint you once were. You have grown. For your great deed the Stormguard would like to offer you this as a reward. It was designed by the ancient Stormguard hero, [Jendl Mizebrite]. It is a warriors true weapon. May it help you on your way to becoming a great warrior.");

		#:: Give a 5415 - Avenger Battle Axe
		quest::summonitem(5415);
		quest::ding();
		# factions verified on ZAM
		quest::faction(312, 100);  #:: + Storm Guard
		quest::faction(274, 15);   #:: + Kazon Stormhammer
		quest::faction(293, 15);   #:: + Miner's Guild 249
		quest::faction(290, 25);   #:: + Merchants of Kaladim
		quest::faction(232, -25);  #:: - Craknek Warriors
		quest::exp(5000);
		my %cash = plugin::RandomCash(3000, 4000);
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});
		}

	#:: plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	#:: Return unused items
	plugin::returnUnusedItems();
	}
