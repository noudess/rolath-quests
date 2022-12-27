sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Eh!!? What do I see before me? A young upstart? Some child pretending to be a great mind? If you wish to test your mettle then you will assist Tergon. Will you [Help Tergon] or are you far [too superior] to deal with such things?");
		}
	elsif ($text =~ /too superior/i)
		{
		quest::say("Well excuse me!! your majesty. Please forgive my arrogance. Now get out of here, before you stink this place up with that rotting grape you call a brain!");
		}
	elsif ($text=~/Pirates of Gunthak/i) 
		{
		quest::say("From what I know, the Pirates of Gunthak are from the southern Gulf of Gunthak. It seems as though a small band of them has been operating within the Ocean of Tears, leagues from their own territory.");
		}
	elsif ($faction > 5)
		{
		quest::say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		}
	elsif ($text=~/Elemental Grimoire/i) 
		{
		quest::say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook.");
		}
	elsif ($faction > 4)
		{
		quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		}
	elsif ($text =~ /personal spellbook/i)
		{
		quest::say("My spellbook is very important to me. It is impossible for anyone to open it. I have magically locked it. Only my brother Retlon knows the words to release its secrets.");
		}
	elsif ($text =~ /Help Tergon/i)
		{
		quest::say("No!! You will help yourself. Your task shall find your skills tested. Succeed and knowledge is yours. Fail and death shall embrace you. Go to the Steamfont Mountains and seek out a troll named Bugglegupp. As a youngster I once tried to attack the beast with a device of mine. It sent an Iron Pellet deep into the beasts head. Kill Bugglegupp and return the Iron Pellet. I hope the Pellet does not get lost in the battle.");
		}
	elsif ($text =~ /further tasks/i)
		{
		quest::say("Not all experience is gained upon the battlefield. We magicians must heighten our minds to become formidable opponents. I see much promise in you, $name. I will require you to [travel abroad] toward Freeport.");
		}
	elsif ($text =~ /travel abroad/i)
		{
		quest::say("You will go to Freeport and seek out the Academy of Arcane Science. There you shall find my brother Retlon. He has scribed some new spells in my personal spellbook. Hand him this note as proof of your alliance. He works closely with Master Dooly Jonkers.");

		#:: Give a 18887 - Sealed Letter (Note to Retlon Brenclog)
		quest::summonitem(18887);
		}
	elsif ($text=~/defector/i) 
		{
		quest::say("It seems a gnome magician by the name of Toko Binlittle has gone and left the guild. He joined forces with the [Pirates of Gunthak]. Find him. He must be destroyed. Our secrets cannot be known. Return his head to me and I shall give you the [Elemental Grimoire]");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 13333 - Iron Pellet (Bugglegupp Quest)
	if ($faction < 5 && plugin::takeItems(13333 => 1))
		{
		quest::say("So, you have survived. There is no doubt in my mind that you achieved this solely with your own powers. Only a dim one requires the assistance of others. Take this. May it help you in your pursuit of greatness. [Further tasks] may bring you to that point.");

		#:: Give a random reward: 15400 - Spell: Elementaling: Air, 15397 - Spell: Elementaling: Earth, 15399 - Spell: Elementaling: Fire, 15398 - Spell: Elementaling: Water, 15317 - Spell: Elementalkin: Air, 15058 - Spell: Elementalkin: Earth
		quest::summonitem(quest::ChooseRandom(15400, 15397, 15399, 15398, 15317, 15058));
		quest::ding();
		#Faction per ZAM
		quest::faction(245, 15);     #:: + Eldritch Collective
		quest::faction(238, -2);    #:: - Dark Reflection
		quest::faction(239, -1);    #:: - The Dead
		quest::faction(255, 2);     #:: + Gem Choppers
		quest::faction(333, 2);     #:: + King Ak'Anon
									#:: Grant a small amount of experience
		quest::exp(150);
		}

	#:: Match a 13387 - Tergon's Spellbook
	elsif ($faction < 5 && plugin::takeItems(13387 => 1))
		{
		quest::say("You have done well. I did not expect you for weeks. It is good to have my spellbook returned. It was a simple task. Now I have news of a larger matter. It has to do with a [defector].")
		 #:: Give a random reward: 15400 - Spell: Elementaling: Air, 15397 - Spell: Elementaling: Earth, 15399 - Spell: Elementaling: Fire, 15398 - Spell: Elementaling: Water, 15317 - Spell: Elementalkin: Air, 15058 - Spell: Elementalkin: Earth
		quest::summonitem(quest::ChooseRandom(15400, 15397, 15399, 15398, 15317, 15058));
		quest::ding();
		#Factions per ZAM
		quest::faction(245, 10);     #:: + Eldritch Collective
		quest::faction(238, -1);    #:: - Dark Reflection
		quest::faction(239, -1);    #:: - The Dead
		quest::faction(255, 1);     #:: + Gem Choppers
		quest::faction(333, 1);     #:: + King Ak'Anon
									#:: Grant a small amount of experience
		quest::exp(1000);
		}

	#:: Match a  13388 - Teir`Dal Head (Toko's Head Quest)
	elsif ($faction < 5 && plugin::takeItems(13388 => 1))
		{
		quest::say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook.");

		#:: Give item 17502 - Elemental Grimoire
		quest::summonitem(17502);
		quest::ding();
		#:: Set factions
		# Verified on zam
		quest::faction(245, 20);     #:: + Eldritch Collective
		quest::faction(238, -3);    #:: - Dark Reflection
		quest::faction(239, -1);    #:: - The Dead
		quest::faction(255, 3);     #:: + Gem Choppers
		quest::faction(333, 3);     #:: + King Ak'Anon
									#:: Grant a small amount of experience
		quest::exp(50000);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
