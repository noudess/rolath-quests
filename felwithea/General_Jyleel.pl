sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Stand at attention!!  I am General Jyleel. of the Koada'Vie. defenders of Felwithe.  Do you [follow Tunare]. the Mother of All. or do you still [seek your enlightenment]?");
		}
	elsif ($text =~ /seek my enlightenment/i)
		{
		quest::say("Then seek it within these walls.  We welcome all fine upstanding Koada'Dal.");
		}
	elsif ($faction > 5)
		{
		quest::say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		}
	elsif ($faction > 4)
		{
		quest::say("No.  You have yet to prove yourself a truly faithful defender of the Clerics of Tunare.  I await your return when you complete your service to the temple.");
		}
	elsif ($text =~ /follow Tunare/i)
		{
		quest::say("Then you are wise indeed.  Would you like to [assist the defenders] in our conflicts or have you other business to attend to?");
		}
	elsif ($text =~ /assist the defenders/i)
		{
		quest::say("Seek out the Crushbone orcs of the Faydarks.  We must have their oracle scrolls.  They are illegible to you, but we will study them here in Felwithe.  Only the orc oracles will carry them, so be very careful.  There is also the problem with the [Crushbone runners].");
		}
	elsif ($text =~ /crushbone runners/i)
		{
		quest::say("The Crushbone orcs are sending messages across the Ocean of Tears to Antonica.  Why. we do not know.  The runner is usually spotted on the open pathways of Butcherblock. running toward the docks.  Find him. kill him. and return his note pouch.");
		}
	elsif ($client->GetModCharacterFactionLevel(226) < 200)
		{
		quest::say("No.  You have yet to prove yourself a truly faithful defender of the Clerics of Tunare.  I await your return when you complete your service to the temple.");
		}
	elsif ($text =~ /faithful paladin of this court/i)
		{
		quest::say("I command you to seek out this Ambassor DVinn and rip his heart from his lifeless body. Next, find the supreme caster of the orcs and, finally, find the spot where supplies are dropped by the Teir`Dal for the orcs. There you should find the supply crate. Return all 3 items and you shall wield the falchion.");
		}
	}

sub EVENT_ITEM
	{
	my $facvalue = $client->GetModCharacterFactionLevel(226);

	#:: Turn in for the Illegible Scroll Quest, 13225 Illegible Scroll
	if ($faction < 5 && plugin::takeItems(13225 => 1))
		{
		quest::say("Very fine work. A pity you are not Koada'Vie. Here is a small reward for you. Anytime you come upon an oracle. remember to return its scroll to me. Go and find your fate on the field of battle.");

		#:: Randomly choose Spell: Minor Healing, Spell: Invisibility, Spell: Endure Disease, Rotted Illegible Scroll, Spell: Lesser Shielding, Spell: Serpent Sight
		quest::summonitem(quest::ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276)); 

		#:: Give a little xp
		quest::exp(500);

		#:: Ding!
		quest::ding();

		#:: Create a hash for storing cash - 1100 to 1300cp
		my %cash = plugin::RandomCash(1100, 1300);

		#:: Grant a random cash reward
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});

		#:: Set factions
		# Verified
		quest::faction(226,  5);     #:: + Clerics of Tunare
		quest::faction(279,  5);     #:: + King Tearis Thex
		}

	#:: Turn in for the Orc Runner Quest , 13226 Runner Pouch
	if ($faction < 5 && plugin::takeItems(13226 => 1))
		{
		quest::say("So, you succeeded in stopping a Crushbone runner! That is good. Now take this as reward. Keep up your fine work. The people of Felwithe are grateful.");

		#:: Give a little xp
		quest::exp(500);

		#:: Ding!
		quest::ding();

		#:: Create a hash for storing cash - 1100 to 1300cp
		my %cash = plugin::RandomCash(1100, 1300);

		#:: Grant a random cash reward
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});

		# Iron Rations
		quest::summonitem(13005, 4);

		#:: Set factions
		# Verified
		quest::faction(226,  5);    #:: + Clerics of Tunare
		quest::faction(279,  5);    #:: + King Tearis Thex
		}

	#:: Turn in for the Orc Runner Quest , 18840 A Sealed Letter
	if ($faction < 5 && plugin::takeItems(18840 => 1))
		{
		quest::say("So, the Teir'Dal are behind the recent advances of the orcs?!! Your news has shed light on their union. It is time to step forth and prove yourself a [faithful paladin of this court].");

		#:: Give a little xp
		quest::exp(500);

		#:: Ding!
		quest::ding();

		#:: Set factions
		# Verified
		quest::faction(226,  10);    #:: + Clerics of Tunare
		quest::faction(279,  10);    #:: + King Tearis Thex
		}

	#:: Turn in for the Falchion Quest , 12330 A Large Locked Crate, 12329 Blue Orc Head, 13227 Black Heart
	if ($facvalue > 199 && plugin::takeItems(12330 => 1, 12329 => 1, 13227 => 1))
		{
		quest::say("A noble deed has been done and the alliance of evil has been stalled. I present you with the falchion of the Koada`Vie. You are now an honorable member of our order. Hail Felwithe, and may you defender her with honor.");

		#:: Give item 5379 - Falchion of the KoadaVie*
		quest::summonitem(5379);

		#:: Give a little xp
		quest::exp(500);

		#:: Ding!
		quest::ding();

		#:: Set factions
		# Verified
		quest::faction(226,  50);    #:: + Clerics of Tunare
		quest::faction(279,  50);    #:: + King Tearis Thex
		}

	#:: Return unused items
	plugin::return_items(\%itemcount);
	}
