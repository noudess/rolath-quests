sub EVENT_SAY
	{
	if ($text =~ /coffin/i)
		{
		quest::say("You're looking for a craftsman, are you? Well look no further! For I, Ping Fizzlecutter, am the best in all the lands! Or at lest this side of Freeport. So you're the one that Valeron was talking about, eh? Well, while you were off traipsing around the lands he and I discussed the details of the coffin. I require nothing less than these  [components]. Get me them and I will gladly make you a coffin any king would be proud to be buried in!");
		}
	elsif ($text =~ /components/i)
		{
		quest::say("I require a diamond, a star ruby, a pearl, a [special fire emerald], a sapphire, a fire opal, and two enchanted platinum bars. Take this bag and combine the items once you have them all and bring it back to me.");

		#:: Give item 17512 - Empty Gem Bag
		quest::summonitem(17512);
		}
	elsif ($text =~ /special fire emerald/i)
		{
		quest::say("Now the fire emerald I want is not the normal one you receive from most jewelers. There is one jeweler I know who has the special one I want. Last time I heard, she had traveled to the elven outpost. Just ask her about special fire emeralds.");
		}
	elsif ($text =~ /repair the toupee/i)
		{
		quest::say("Ah!! You have a toupee to repair. It must be the [Mane Attraction]. I gave a one out and it seems to always fall to pieces. Seeing as it has a 100 season warranty and I only created it 5 seasons ago, I suppose I can do it. Do you want me to [make the Mane] Attraction.");
		}
	elsif ($text =~ /mane attraction/i)
		{
		quest::say("The Mane Attraction is a special toupee I created for a Gnome junker. He wasn't getting much attention at the taverns till I created the eye catching toupee. He became one Charismatic Gnome after that. Unfortunately, it seems to fall to pieces to easy and since it has a warranty, I have to fix it for him every time at no charge!! I will never make another.");
		}
	elsif ($text =~ /make the mane/i)
		{
		quest::say("If you have the original tattered toupee then I can do it. Before you give it to me I will also need three other items. I require two clumps of hair from a Hulking Gorilla and a strand of hair from a [certain mermaid].");
		}
	elsif ($text =~ /certain mermaid/i)
		{
		quest::say("I encountered a particular mermaid with beautiful hair!! She had beautiful golden tresses. I used a lock of her hair to create the Mane Attraction. That was a while back when I was in Faydwer.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 6710 - Full Gem Bag
	if (plugin::takeItems(6710 => 1))
		{
		quest::emote("smiles broadly as he rifles through the bag, then looks up at you and says, 'Bout time! Here is the coffin as promised.'");

		#:: Give item 17080 - Gem Encrusted Casket
		quest::summonitem(17080);
		}

	#:: Match two 12335 - Clump of Gorilla Hair, a 12338 - Lock of Hair, and a 12337 - Tattered Toupee
	elsif (plugin::takeItems(12335 => 2, 12338 => 1, 12337 => 1))
		{
		quest::say("You are a good helper. Here you go. One genuine, charismatic, lady magnet, zero to hero making Mane Attraction!! Guaranteed to lower prices world wide. Guaranteed to last forever.. Err.. Well,.. It has a 1000 year warranty at least.");

		#:: Give item 12254 - Mane Attraction
		quest::summonitem(12254);

		#:: Ding!
		quest::ding();

		#:: Set factions verified per ZAM
		quest::faction(229, 5);    #:: + Coalition of Trade Folk
		quest::faction(281, 5);    #:: + Knights of Truth
		quest::faction(291, 3);    #:: + Merchants of Qeynos
		quest::faction(336, 5);    #:: + Coalition of Tradefolk Underground
								   #:: Grant a small amount of experience
		quest::exp(500);
		}

	#:: Match two 12335 - Clump of Gorilla Hair
	elsif (plugin::takeItems(12335 => 2))
		{
		quest::say("You want a Mane Attraction? Not until I get the two clumps of gorilla hair, the tattered toupee and a lock of hair from a certain mermaid.");

		#:: Give two 12335 - Clump of Gorilla Hair
		quest::summonitem(12335);
		quest::summonitem(12335);
		}

	#:: Match a 12335 - Clump of Gorilla Hair
	elsif (plugin::takeItems(12335 => 1))
		{
		quest::say("You want a Mane Attraction? Not until I get the two clumps of gorilla hair, the tattered toupee and a lock of hair from a certain mermaid.");

		#:: Give a 12335 - Clump of Gorilla Hair
		quest::summonitem(12335);
		}

	#:: Match a 12337 - Tattered Toupee
	elsif (plugin::takeItems(12337 => 1))
		{
		quest::say("You want a Mane Attraction? Not until I get the two clumps of gorilla hair, the tattered toupee and a lock of hair from a certain mermaid.");

		#:: Give a 12337 - Tattered Toupee
		quest::summonitem(12337);
		}

	#:: Match a 12338 - Lock of Hair
	elsif (plugin::takeItems(12338 => 1))
		{
		quest::say("You want a Mane Attraction? Not until I get the two clumps of gorilla hair, the tattered toupee and a lock of hair from a certain mermaid.");

		#:: Give a 12338 - Lock of Hair
		quest::summonitem(12338);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
