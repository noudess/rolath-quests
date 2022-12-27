sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Well met, $name!  What brings you out this way?  Are you interested in becoming an observer?  No, you look like the adventuring type.  The wilds of the Steamfont Mountains is as far as my body goes.  But through my [duties] as an observer, my mind travels the cosmos.");
		}
	elsif ($faction > 5)
		{
		plugin::reject_say(); # Had the more common reject messages
		}
	elsif ($text =~ /duties/i)
		{
		quest::say("Well, I am quite an accomplished enchanter but most of my time now is spent crafting the magical lenses that enable us to see beyond the ceiling of Norrath and into other realms and dimensions.  Say, in your travels have you encountered any [evil eyes]?")
		 }
	elsif ($text =~ /evil eyes/i)
		{
		quest::say("Evil eyes are dangerous creatures of great magical power.  There is a rumor that somewhere on Antonica there lives a powerful evil eye by the name of Borxx. I believe that with the lens from her eye and some expert tinkering, I could create a device that will enable me to observe the gods themselves in their native planes. If you were to bring me this lens, the Eldritch Collective would reward you greatly.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 10170 - Evil Eye Lens
	if ($faction < 6 && plugin::takeItems(10170 => 1))
		{
		quest::say("Not only did you find Borxx but you were able to slay her as well?! You are truly a champion of great skill. This lens of Borxx's will greatly aid our research of other planes of existence. I have been authorized by the Eldritch Collective to offer you this Staff of the Observers. Carry it with pride.");
		#:: Give a 10171 - Staff of the Observers
		quest::summonitem(10171);

		#:: Ding!
		quest::ding();

		#:: Set factions
		# Verified on ZAM
		quest::faction(245, 15);	# Eldrich COllective
		quest::faction(238, -2);	# Dark Reflection
		quest::faction(239, -1);	# The Dead
		quest::faction(255, 2);		# Gem Choppers
		quest::faction(333, 2);		# King Ak'Anon
		quest::exp(100);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
