sub EVENT_SAY
	{
	quest::say("Welcome to the Lodge of the Dead. I am Nezzka Tolax and with my training you will learn to master the ways of the Shadowknight.");
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18757 => 1))  #A tattered note
		{
		quest::say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		quest::summonitem(13586); #Black Training Tunic
		quest::exp(100);
        # Factions Verified on live
        quest::faction(239, 100);#The Dead
        quest::faction(303, 15);#Queen Cristanos Thex
        quest::faction(278, -15);#King Naythox Thex
        quest::faction(275, -15);#Keepers of the Art
        quest::faction(245, -15);#Eldritch Collective
        quest::faction(1522, -200);#Primordial Malice
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax 
