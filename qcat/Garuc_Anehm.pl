sub EVENT_SAY 
	{
	if($text=~/Hail/i){
	quest::say("Welcome to the Shrine of Bertoxxulous! You appear to be [new to the shrine]. I do not remember seeing you around.");
	}
	if($text=~/new to the shrine/i){
	quest::say("New blood to spread Bertoxxulous' disease? We presently need the help of a [young shadowknight]. There are certain deeds which must be carried out.");
	}
	if($text=~/young shadowknight/i){
	quest::say("Then let your supreme task be the extermination of the Priests of Life. Know that they threaten the will of our Lord Bertoxxulous. For every fallen paladin and cleric of the Temple of Life. you shall rise within our ranks.  So... do you [loathe paladins]?");
	}
	if($text=~/loathe paladins/i){
	quest::say("As do we all. The paladins of Qeynos come from either the Hall of Thunder or the Temple of Life. We have put a bounty upon their heads. Destroy these knights and return either the Order of Thunder or the prayer beads of these inferior men. There has even been a report from [Commander Kane].");
	}
	if($text=~/commander kane/i){
	quest::say("Kane Bayle is the Commander of the Qeynos Guard. He has found it advantageous to befriend the Bloodsabers. We share a [common goal]. He assists us in many ways. He has some new information to reveal.  Go and tell him you are a Bloodsaber. Do not speak with him while he is on duty!!");
	}
	if($text=~/common goal/i){
	quest::say("Kane Bayle and the leaders of this shrine all wish to overthrow the rule of Antonius Bayle. He, for power, and we for the glory of Bertoxxulous. From this city, our diseased lord shall appear and tread across the land spitting death from his mouth and deforming the land. His glory shall be eternal!");
	}
	}

sub EVENT_ITEM 
	{
	# Faction required and XP all verified painstakingly on live.
	if ($faction < 6)
		{
		my $garuc_reward = quest::ChooseRandom(5013, 5022, 2104, 2106, 2108, 2111, 2112, 13301, 59972, 15221, 15342, 15235, 15340, 1050, 1053); #Updated to issue random patchwork armor, level 1-5 spell or a rat-shaped ring, rat fur cap, rat's foot necklace
		if(plugin::check_handin(\%itemcount, 13134 => 1)) 
			{
			quest::say("Hahaha.. I see you actually killed a respected, well-known citizen of Qeynos. No loss for them, but you are certainly a gain for our shrine. Maybe this shall do you some good. If not now, then surely later. You may need it when the Qeynos Guards hunt you down."); 
			quest::summonitem($garuc_reward);
			# Factions and exp verified on live. 
			quest::faction(262,-1); #Guards of Qeynos
			quest::faction(341,-2); #Priests of Life
			quest::faction(221,10);   #Bloodsabers
			quest::faction(296,1);   #Opal
			quest::faction(230,1);   #Corrupt
			quest::exp(100);
			quest::ding();
			}

		if(plugin::check_handin(\%itemcount, 13287 => 1)) 
			{
			quest::say("Ha! You must have slain a member of the Knights of Thunder.  These pitiful knights have been a thorn in our side for far too long.  Take this reward and continue the work for Bertoxxulous."); 
			quest::summonitem($garuc_reward);
			# Factions and exp verified on live. 
			quest::faction(262,-1); #Guards of Qeynos
			quest::faction(341,-2); #Priests of Life
			quest::faction(221,10);   #Bloodsabers
			quest::faction(296,1);   #Opal
			quest::faction(230,1);   #Corrupt
			quest::exp(250);
			quest::ding();
			}
		if(plugin::check_handin(\%itemcount, 13296 => 1)) 
			{
			quest::say("Fine work! One less threat to our shrine.  Take this.  It shall halp you become a greater asset to our shrine. Go forth and spread the disease."); 
			quest::summonitem($garuc_reward);
			# Factions and exp verified on live. 
			quest::faction(262,-1); #Guards of Qeynos
			quest::faction(341,-2); #Priests of Life
			quest::faction(221,10);   #Bloodsabers
			quest::faction(296,1);   #Opal
			quest::faction(230,1);   #Corrupt
			quest::exp(250);
			quest::ding();
			}
		if(plugin::check_handin(\%itemcount, 13908 => 1)) 
			{
			quest::say("You fool! Brother Trintle was our mole within the Priests of Life. Now you have killed him. For this you shall die!"); 
			# Factions verified on live. 
			quest::faction(262,7); #Guards of Qeynos
			quest::faction(341,12); #Priests of Life
			quest::faction(221,-50);   #Bloodsabers
			quest::faction(296,-5);   #Opal
			quest::faction(230,-2);   #Corrupt
			quest::attack($name);
			}
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:qcat  ID:45070 -- Garuc_Anehm
