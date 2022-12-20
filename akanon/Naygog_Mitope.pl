sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_ENTER
	{
	#:: Match a 18759 - Stained Parchment
	if (plugin::check_hasitem($client, 18759))
		{
		$client->Message(15, "A diminutive, but powerful looking gnome stands before you.  'I am Naygog Mitope.  The Dark Reflection has called you.  Read the note in your inventory and hand it to me to begin your training.  Your destiny awaits!'");
		}
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name. I train those young gnomes who wish to [serve as a warrior] in the service of the Dark Reflection and our patron. Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
		}
	if ($text =~ /trades/i)
		{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");

		#:: GIve a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
		}
	if ($text =~ /second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");

		#:: GIve a 51122 - Tradeskill Basics : Volume I
		quest::summonitem(51122);
		}
	if ($text =~ /serve as a warrior/i)
		{
		quest::say("Ours is the duty of a martyr. to be the hated and feared hand of destruction and catalyst of change. All roads are paved with destruction and in turn are eventually destroyed. All machines are built from the rubble of broken mountains and in turn become rust and bits of metal. You must outfit yourself with the tools of a warrior. crafted from the destruction of archaic clockworks that have long since finished serving the purpose for which they were built. Take this parchment to Windlebeck Tobokog. he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for [further instruction].");
		quest::summonitem(10986);
		}
	if ($text =~ /further instruction/i)
		{
		quest::say("It is one thing to destroy the artificial life of a clockwork. It is another thing entirely to claim the life of another gnome. There is a member of the Dark Reflection. Yulcabis. who has been assigned to a task in the Steamfont Mountains. He has failed repeatedly in the tasks assigned to him in the past and has become a burden to the Dark Reflection. Find Yulcabis and slay him. Return to me with the weapon he carries.");
		}
	if ($text =~ /armor/i)
		{
		quest::say("Armor? For a warrior? Oh yes. You'll need to speak with Windlebeck for that.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 10990 => 1))
		{    #Yulcabis's axe
		quest::say("Well done $name. Take this Dull Dark Reflection Axe and sharpen it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once the axe has been sharpened take it to Clockwork SmithXIII with a Coyote Pelt and he will put the finishing touches on the weapon.");
		quest::summonitem(10995);    #Dull dark reflection axe
		quest::exp(100);
		quest::ding();
		# Factions verified per zam
		quest::faction(238, 10);     #dark reflection
		quest::faction(245, -1);     #eldritch collective
		quest::faction(255, -1);     #gem choppers
		quest::faction(240, -1);     #Deep Muses
		}
	if (plugin::check_handin(\%itemcount, 18775 => 1))
        {
        quest::say("This is fabulous news!! You have done well, young one. When you have become more experienced in our art, I will be able to further train you, both in our art as well as in some of the various [trades] you will have available to you.");
        quest::summonitem(13518);    #Tin Patched Tunic
        #Factions verified on live
        quest::faction(238, 100);   #Dark Reflection
        quest::faction(245, -10);   #Eldritch Collective
        quest::faction(255, -10);   #Gem Choppers
        quest::faction(240, -10);   #Deepmuses
        $client->AddLevelBasedExp(2.5, 1);
        quest::ding();
        }

	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:akanon  ID:55157 -- Naygog_Mitope
