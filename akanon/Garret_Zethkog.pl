sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name! I am Garret Zethkog, first Shadowknight of the Dark Reflection. Long ago I made the journey far to the west to the human city of Qeynos. In the catacombs of the Bloodsabres, human disciples of the Plague Lord, Bertoxxulous. I studied the ways of the Shadowknight. I have returned to Ak'Anon with this knowledge and now tutor young gnomes that have [heard the calling] of the Dark Reflection in the ways of a Dark Knight of Bertoxxulous.");
		}
	if ($text =~ /heard the calling/i)
		{
		quest::say("Bertoxxulous has gifted his faithful with the sight of the Dark Reflection, the ability to recognize the power of disease and decay and its importance as a catalyst of change and progress. We Shadowknights of the Dark Reflection are the champions of the Plague Bringer. It is our duty to embrace our gifts and use them to act as the agents of Bertoxxulous, doing his bidding unquestioningly. There are many however who oppose the Plague Lord and his servants. They do not understand the importance of our existence and we must [defend ourselves] against these foes lest they would have us destroyed.");
		}
	if ($text =~ /defend ourselves/i)
		{
		quest::say("Every young Knight of the Dark Reflection must first learn the basics of combat and acquire a suit of armor to help turn aside the weapons of our enemies. Take this parchment to my sister Mimtia Zethkog and she will assist you in acquiring a set of suitable armor for a young shadowknight. Once you have been suitably outfitted return to me and I will instruct you on your [next task].");
		quest::summonitem(10987);
		}
	if ($text =~ /next task/i)
		{
		quest::say("There are many through out Norrath who oppose the Dark Reflection. Even here in our home, Ak'Anon, the Eldrich Collective and the Deep Muses oppose us and wish to see us exiled or eradicated. A Paladin of the Deep Muses, Donlix Bonkle, has been leading a group of zealots that is hunting young members of the Dark Reflection in the Steamfont Mountains. Seek Donlix Bonkle and eliminate him. When you have accomplished this task return to me with Donlix's Short Sword.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 10991 => 1))
		{
		quest::say("Well done $name. I am pleased that this threat to our young disciples of the Plague Bringer has been eliminated. Take this Dull Dark Reflection Short Sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once the sword has been sharpened take it to Clockwork SmithXIII with an Ebon Drake Scales and he will put the finishing touches on your new weapon.");
		quest::summonitem(10996);
		quest::ding();
		#Factions per ZAM
		quest::faction(238, 10);    # Dark Reflection
		quest::faction(245, -1);    # Eldritch Collective
		quest::faction(255, -1);    # Gem Choppers
		quest::faction(240, -1);    # Deepmuses
		}
	else
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:akanon  ID:55186 -- Garret_Zethkog
