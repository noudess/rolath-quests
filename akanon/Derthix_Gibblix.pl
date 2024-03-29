sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Greetings $name. It is my duty to train young gnomes that have been called to they ways of Bertoxxulous, the Plague Bringer, and wish to [serve as a cleric] of the Dark Reflection. The faithful of the Plague Bringer are gifted with the sight of the Dark Reflection. The ability to recognize the importance of the powerful forces of disease and decay, and the role they play in the cycles of deterioration and renewal, death and life, destruction and creation.");
		}
	if ($text =~ /serve as a cleric/i)
		{
		quest::say("We have been blessed by Bertoxxulous with the vision of the Dark Reflection. We are the prophet and protectors of all who serve the Plague Bringer and have devoted our lives to spreading disease and decay for the glory of Bertoxxulous and the balances that must be maintained. Take this parchment to Glerbella Gibblix, she will assist you with the construction of a suit of armor to aid in protecting you from the weapons of those who would see us destroyed. When you have been properly outfitted return to me for your [next task].");
		quest::summonitem(10989);
		}
	if ($text =~ /next task/i)
		{
		quest::say("We faithful of Bertoxxulous are misunderstood even by the majority of the gnomes of Ak'Akanon. The Eldrich Collective and the Deep Muses would have us chased from the Mines of Malfunction and exiled from these lands. They are not gifted with the vision of the Dark Reflection and thus are blind to the necessity of our actions. In the Steamfont Mountains you will find a Cleric of the Deep Muses, Vyntok Bonkle. Vyntok has been aiding others of our enemies in their mission to eliminate the Dark Reflection from Ak'Anon. Find Vyntok and slay him. When you have accomplished this task return to me with Vyntok's Mace.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 10993 => 1))
		{
		quest::say("Excellent work, $name! You must be prepared to face many such enemies in the days to come. Take this Rough Dark Reflection Mace and refine it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done take the Polished Dark Reflection Mace to Clockwork SmithXIII with a Mountain Lion Pelt and he will put the finishing touches on your new weapon.");
		quest::summonitem(11080);
		quest::exp(29127); #Matched Garret's xp
		#factions per ZAM
        quest::faction(238, 10);    # Dark Reflection
        quest::faction(245, -1);    # Eldritch Collective
        quest::faction(255, -1);    # Gem Choppers
        quest::faction(240, -1);    # Deepmuses
		quest::ding();
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}
