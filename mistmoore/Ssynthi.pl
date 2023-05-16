sub EVENT_SAY
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif ($text =~ /hail/i)
		{
		quest::say("I am Ssynthi, [Warder of Ro]. Would you do a simple [service] for me?");
		}
	elsif ($text =~ /warder of ro/i)
		{
		quest::say("I have renounced my ties to the Shadowed Men and become a follower of the one True Flame, Solusek Ro. I have hopes that one day my brethren will see the errors of their ways and cease their mindless war.");
		}
	elsif ($text =~ /service/i)
		{
		quest::say("The body of my true love lies within this tomb. I see a token to remember her by the flower which lies atop her coffin. I would get it myself, but the tomb is warded against my kind. Since I can not enter, I ask you to fetch it for me.");
		}
	elsif ($text =~ /deathspeakers/i)
		{
		quest::say("Ah, so the deathspeakers have decided to reveal themselves again. They are beings who claim they are closer to the realms of the dead than any other known race, and they have been known to rally the shadowed men in times when they deem other races to be dabbling too much in the powers of death and rebirth. Just as shadowed men as a whole despise those of us who follow Solusek Ro because they deem all of magic to have sprung from themselves.");
		}
	elsif ($text =~ /marnek/i)
		{
		quest::say("Marnek, you say?! I admit that rumors have come to me concerning an alliance between the Temple of Ro and the Burning Dead, and perhaps this is the goal of that union. I must therefore act, for who knows the shadowed men better than I? But I cannot leave this place right now. Will you help me in this task?");
		}
	elsif ($text =~ /will help/i)
		{
		quest::say("Then take this and collect within the drops of shadow that spill when a deathspeaker is killed. There will be a deathspeaker wherever shadowed men can be found, but even more important is the location of Ytyrs the Reborn. His shadow must be collected as well. And have care not to mix this shadow stuff with drink lest you unleash a dangerous magic.");
		#:: Give a 14364 - Cauldron of Shadow Essense
		quest::summonitem(17191);
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 14362 - Flower
	if ($faction < 6 && plugin::takeItems(14362 => 1))
		{
		quest::say("Thank you. Since you have done me a service with no thought of reward, I offer you this small token of my favor.");

		#:: Give a 14364 - Scepter
		quest::summonitem(14364);

		#:: Ding!
		quest::ding();

		#:: Set factions
		#:: per ZAM
		quest::faction(415, 1);    #:: + Temple of Solusek Ro
		quest::faction(416, -1);    #:: - Shadowed Men
									#:: Grant a moderate amount of experience
		quest::exp(1000);
		}
	elsif ($faction < 6 && plugin::takeItems(32030 => 1))
		{
		# Add dialogue, faction and xp
		#:: Give a 32038 - Rod
		quest::exp(30000);
		quest::summonitem(32038);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
