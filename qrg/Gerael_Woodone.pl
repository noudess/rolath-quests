####################################
# NPC: Gerael Woodone
# Zone:  Qrg
# Quest:  Nitrates and the Assassin
# Author: Andrew80k
####################################
sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("It is good to meet you, $name. You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to [deliver a flask]");

		}

	if ($text =~ /deliver a flask/i)
		{
		if ($faction <= 6)
			{
			quest::say("You are an enemy of the Jaggedpine Treefolk, this forest, and the residents of it. Begone, before I am forced to take drastic measures!");
			}
		elsif ($faction <= 5)
			{
			quest::say("We, the Jaggedpine Treefolk, appreciate the help you've given us in the past. But, we must trust you more before allowing you to handle such important matters.");
			}
		else
			{
			quest::say("That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell.");
			quest::summonitem("13945", "1");
			}
		}

	if ($text =~ /Jale Phlintoes/i)
		{
		quest::say("Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
		}

	if ($text =~ /Unkempt Druids/i)
		{
		quest::say("The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid [Jale Phlintoes]. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it.");
		}
	}

sub EVENT_ITEM
	{
	# Sealed Letter also?  Zam says same hits...
	if (plugin::check_handin(\%itemcount, 18911 => 1))
		{
		quest::say("Oh my!! Our Qeynos Ambassador, Gash, is in danger from the [Unkempt Druids]. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him [they are trying to kill him]. Go!!");

		# Factions verified on ZAM
		quest::faction(272, 15);
		quest::faction(302, 3);
		quest::faction(343, 2);
		quest::faction(324, -3);
		quest::faction(262, 2);
		quest::givecash(int(rand(10)), int(rand(10)), 0, 0);
		quest::ding();
		$client->AddLevelBasedExp(1, 46);
		quest::summonitem(18912);
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 18864 => 1))
		{
		quest::say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");

		# Factions verified on ZAM
		quest::faction(272, 15);
		quest::faction(302, 3);
		quest::faction(343, 2);
		quest::faction(324, -3);
		quest::faction(262, 2);
		quest::givecash(int(rand(10)), int(rand(10)), 0, 0);
		quest::ding();
		$client->AddLevelBasedExp(1, 46);
		quest::summonitem(quest::ChooseRandom(6018, 2006, 2147, 9002, 9006, 15237, 15239, 15252, 15240, 15248));
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 12141 => 1))
		{
		quest::say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");

		# Factions verified on ZAM
		quest::faction(272, 20);
		quest::faction(302, 5);
		quest::faction(343, 3);
		quest::faction(324, -5);
		quest::faction(262, 3);
		quest::givecash(0, int(rand(10)), int(rand(10)), 0);
		quest::ding();
		$client->AddLevelBasedExp(1, 46);
		quest::summonitem(quest::ChooseRandom( 6018, 2006, 2147, 9002, 9006, 15237, 15239, 15252, 15240, 15248));
		}
	}

#END of FILE Zone:qrg  ID:1666 -- Gerael_Woodone
