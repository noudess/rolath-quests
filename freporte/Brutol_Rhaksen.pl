# ZONE: East Freeport (freporte)

sub EVENT_SAY
	{ 

	if($text=~/Hail/i)
		{
		quest::say("Oh. hello down there. puny one. I'm Brutol Rhaksen. Commmander of warriors who [serve] the Dismal Rage. and that's really all you need to know..for now.");
		}

	if($text=~/serve/i)
		{
		quest::say("You must become strong to survive amongst the ranks of the Dismal Rage. Take this note to Rolfic Gohar and he will help you get a suit of armor to protect your scrawny hide from the weapons of our enemies. Once you have been properly outfitted return to me and will give you your [next orders].");
		quest::summonitem(19843);
		}

	if($text=~/next orders/i)
		{
		quest::say("Ready to make yourself useful $name? Beneath West Freeport are sewer tunnels leading to North Freeport being used by the Freeport Militia and Dismal Rage. We believe a sympathizer of the Sentries of Marr, Tarsa Yovar, is hiding somewhere in the western tunnel system. The sympathizer is a Steel Warrior, faithful to Erollisi and although she is only a minor nuisance, she must be dealt with. Find her and bring me her head.");
		}
	}

sub EVENT_ITEM
	{ 
	# A tattered note ID-18857
	if (plugin::check_handin(\%itemcount, 18857 => 1))
		{
		quest::ding();
		quest::say("Hahaha...  I sure hope you prove more valuable than you look, little one. Once you are ready to begin your training please let me know and I will get you started. I will be able to further instruct you on how to progress through your early ranks.");
		# Fixed faction while working Faqtion!
		quest::faction(271,100); # Dismal Rage
		quest::faction(296,20); # Opal Dark Briar
		quest::faction(281,-15); # Knights of Truth
		# Faded Crimson Tunic ID-13561
		quest::summonitem("13561");
		quest::exp("100");
		quest::ding();
		}
	# Tarsa Yovar's Head ID-19932
	elsif (plugin::check_handin(\%itemcount, 19932 => 1))
		{
		quest::say("You must be stronger than you appear $name. Get used to violence and bloodshed, there are many who oppose the Dismal Rage. Take this and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process.  Bring it back to me with a Giant Rattlesnake Skin and you will have proven yourself as a member of Dismal Rage!");
		quest::ding();
		# Dull Axe ID-55623
		quest::summonitem("55623");
		quest::exp("100");
		#Factions verified on ZAM
        quest::faction(271,10); # Dismal Rage
        quest::faction(296,2); # Opal Dark Briar
        quest::faction(281,-1); # Knights of Truth
		}
	# Sharpened Axe ID-59953 - Giant Rattlesnake Skin ID-19852
	elsif (plugin::check_handin(\%itemcount, 59953 => 1, 19852 => 1))
		{
		quest::say("You have proven your faith $name. Take this to vanquish any and all whom question the absolute power of Innoruuk!");
		quest::ding();
		quest::summonitem(1266); #Rolath Shard of Battle
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}
#END of FILE Zone:freporte  ID:10118 -- Brutol_Rhaksen


