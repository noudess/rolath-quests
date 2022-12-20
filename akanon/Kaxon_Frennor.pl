sub EVENT_SPAWN
	{
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50,0);
	}

sub EVENT_ENTER
	{
	#:: Check for 18705 - Old Folded Letter
	if (plugin::check_hasitem($client, 18705))
		{
		$client->Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Kaxon Frennor. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
		}
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name. I am Kaxon Frennor, master assassin of the Dark Reflection. I train talented gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to [serve as a rogue] of the Dark Reflection. Disease and decay are powerful forces in Norrath that crumble kingdoms and silently kill even the mightiest of heros. It is the calling of the Dark Reflection to sow the seeds of destruction as a catalyst to change. What progress would there be if rulers did not die and clockworks did not malfunction, giving way to greater rulers and better clockworks.");
		}
	if ($text =~ /trades/i)
		{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");

		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
		}
	if ($text =~ /second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");

		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
		}
	if ($text =~ /serve as a rogue/i)
		{
		quest::say("We are the spreaders of disease, the masters of poison, the death that comes silently from the shadows. You must outfit yourself with the tools of a rogue, crafted from the disassembled remains of clockworks that are finished serving the purpose for which they were built. Take this parchment to Rebbie Romblerum, he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for your [next task].");
		quest::summonitem(10988);
		}
	if ($text =~ /next task/i)
		{
		quest::say("There are many of our kind that do not understand the necessity of the Dark Reflection. The Eldrich Collective and The Deep Muses seek to root us out and have us put to death or exiled from Ak'Anon. In the Steamfont Mountains a Rogue of the Deep Muses, Jibble Blexnik, has been hunting and killing young members of the Dark Reflection that venture from Ak'Anon. Find this self-righteous rogue and eliminate him. When you have accomplished this task bring me Jibble's Stiletto.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 10992 => 1))
		{
		quest::say("At last that haughty rogue has met his end. Take this Dull Dark Reflection Stiletto and sharpen it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once the blade has been sharpened take the sharpened stiletto to Clockwork Smith XIII with a Giant Rat Pelt and he will put the finishing touches on your new weapon.");
		quest::summonitem(11079);

		# Verified on zam
		quest::faction(238, 10);    # Dark Reflection
		quest::faction(245, -1);    # Eldritch Collective
		quest::faction(255, -1);    # Gem Choppers
		quest::faction(240, -1);    # Deep Muses

		quest::exp(100);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 18705 => 1))
		{
		quest::say("A new rogue eh? Well put this tunic on and get to it! Once you are ready to begin your training please make sure that you see Morlan. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");

		#:: Give a 13518 - Tin Patched Tunic*
		quest::summonitem(13518);

		#:: Ding!
		quest::ding();

		#:: Set factions
		quest::faction(240, -10);    # Deep Muses
		quest::faction(245, -10);    # Eldrich Collective
		quest::faction(238, 100);    # Dark Reflection
		quest::faction(255, -10);    # Gem Choppers
									 #:: Grant a small amount of experience
		$client->AddLevelBasedExp(2.5, 1);
		}

	#Do all other handins first With plugin, then let it Do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}

#End of file
