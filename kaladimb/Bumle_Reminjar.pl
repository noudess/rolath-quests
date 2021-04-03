sub EVENT_SAY
	{
	$couf=$client->GetModCharacterFactionLevel(227);
	if ($text =~ /hail/i)
		{
		quest::say("Welcome, $name. The Cathedral of Underfoot welcomes all good persons. May you find peace from the dangers of Butcherblock within these walls. The paladins of this holy place are very much aware of the evils outside Kaladim. The threat of goblins and [birdmen] has increased.");
		}
	elsif ($text =~ /birdmen/i)
		{
		quest::say("The birdmen I speak of are the aviak krags. These vile creatures have desecrated our land. They have dared to perch upon our great statue. The king has instructed all noble paladins in this order to [destroy the krag chicks].");
		}
	elsif ($faction > 5)
		{
		quest::say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!");
		}
	elsif ($faction > 4)
		{
		quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		}
	elsif ($text =~ /destroy the krag chicks/i)
		{
		quest::say("Yes. You are known to have aided our cause. You shall continue by returning any aviak chick talons to me. I will reward you for the return of no fewer than four at a time. Go, and serve the will of the king!");
		}
	elsif ($couf < 300)
		{
		quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		}
	elsif ($text =~ /elders/i)
		{
		quest::say("The krag elders are the strongest of the aviaks. Their might has been well-documented by our order. Our high ranking paladins are ordered to slay the eagles. If you are with us, return four aviak talons to me and a fine reward shall be yours. Perhaps even our cathedral tailors and scribes may donate to your quest.");
		}
	}

sub EVENT_ITEM
	{
	$couf=$client->GetModCharacterFactionLevel(227);

	#:: Match if faction is Amiable or better and four 12157 - Aviak Chick Talon
	if ($faction <= 4 && plugin::takeItems(12157 => 4))
		{
		quest::say("You have done well. Your deeds shall be recorded within our journals. Here, then, is your reward. May you strive to serve us to the full extent of your powers. The [elders] must also die.");

		#:: Give a random reward: 2116 - Small Patchwork Tunic, 2118 - Small Patchwork Cloak, 2120 - Small Patchwork Sleeves, 2123 - Small Patchwork Pants, 2124 - Small Patchwork Boots
		quest::summonitem(quest::ChooseRandom(2116, 2118, 2120, 2123, 2124));
		quest::ding();
		$client->AddLevelBasedExp(20,5);
		# Faction verified on live.
		quest::faction(227, 5);    #:: + Clerics Of Underfoot
		quest::faction(274, 5);    #:: + Kazon Stormhammer
		quest::faction(293, 3);    #:: + Miner's Guild 249
		}

	#:: Match if faction is Amiable or better and four 12158 - Aviak Talon
	elsif ($couf > 299 && plugin::takeItems(12158 => 4))
		{
		quest::say("Fine work! You shall be known for your great deeds. Take this and may it aid you in your defense of Kaladim. Hail King Kazon!");

		quest::ding();
		$client->AddLevelBasedExp(20,10);
		my %cash = plugin::RandomCash(2500, 2600);
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});
		quest::summonitem(quest::ChooseRandom(2114, 6041));
		quest::faction(227, 10);    #:: + Clerics Of Underfoot
		quest::faction(274, 10);    #:: + Kazon Stormhammer
		quest::faction(293, 7);    #:: + Miner's Guild 249
		}

	#:: plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	#:: Return unused items
	plugin::returnUnusedItems();
	}
