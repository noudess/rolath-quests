sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_ENTER
	{
	#:: Match a 18434 - Gnome Shadowknight Note
	if (plugin::check_hasitem($client, 18434))
		{
		$client->Message(15, "A diminutive, but powerful looking gnome stands before you. 'I am Garret Zethog. The Dark Reflection has called you. Read the note in your inventory and hand it to me to start your training. Your destiny awaits!");
		}
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hail $name! I am Garret Zethkog, first Shadowknight of the Dark Reflection. Long ago I made the journey far to the west to the human city of Qeynos. In the catacombs of the Bloodsabres, human disciples of the Plague Lord, Bertoxxulous. I studied the ways of the Shadowknight. I have returned to Ak'Anon with this knowledge and now tutor young gnomes that have [heard the calling] of the Dark Reflection in the ways of a Dark Knight of Bertoxxulous.");
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
		quest::exp(29127); #collected at level 22
		}
	if  (plugin::check_handin(\%itemcount, 18434 => 1))
		{
		quest::say("Welcome to the Dark Reflection, $name! Take this tunic as a gift for your desire to serve the will of Bertoxxulous, The Plague Lord. Beware of the followers of Brell Serilis, they would see us members of the Dark Reflection exiled from Ak'Anon.  Return to me when you have become more experienced in our art, I will be able to further train you, both in our art as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13518);    #Tin Patched Tunic
		#Factions verified on live
		quest::faction(238, 100);   #Dark Reflection
		quest::faction(245, -10);   #Eldritch Collective
		quest::faction(255, -10);   #Gem Choppers
		quest::faction(240, -10);   #Deepmuses
		$client->AddLevelBasedExp(2.5, 1);
		quest::ding();	
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:akanon  ID:55186 -- Garret_Zethkog
