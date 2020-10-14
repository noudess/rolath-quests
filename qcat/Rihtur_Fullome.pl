sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Hail, $name! I hope the trek into our shrine has not scarred you in any way. Our defenses have been increased lately. Many of the citizens have heard rumors about our shrine. I say it is all due to that [soldier].");
		}
	if($text=~/soldier/i) 
		{
		quest::say("The soldier I refer to is Commander Kane Bayle. The supreme officer himself. Don't get me wrong. I trust Kane. He has quite a black heart. I just don't trust that girl, [Nerissa].");
		}
	if($text=~/nerissa/i) 
		{
		quest::say("Nerissa Clothspinner. Her sister was a good friend of Kane's. When she left Qeynos to venture into the world, she asked Kane to watch over the girl. Now Kane tries to hide from this child the fact that he is allied with our church. I do not think he has hidden it well. I have told the others. but they do not believe me. I do not care. I have my own [plans].");
		}
	if($text=~/plans/i) 
		{
		if ($faction < 5)
			{
			quest::say("Nerissa is well protected by Kane. She will no doubt attempt to inform someone of her suspicions, most likely her sister, Milea. You must find Milea Clothspinner and kill her. No word of our operations must leak out. Return with proof of Milea's death and we shall see to a reward.");
			}
		elsif ($faction < 6)
			{
			quest::say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
			}
		else
			{
			quest::say("The lair of the Bloodsabers is no place for you...  be gone, or be dead!");
			}
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 13302 => 1))
		{
		quest::say("You have done a truly wicked deed.  Good work!  Milea was a prestigious member of the Hall of Steel and a friend to the Knights of Truth.  It is better that she now fertilizes the flowers of the Plains of Karana.  Here.  A fitting reward for such a deed.");
		# Verified Live
		quest::faction(221,10);	#Bloodsabers
		quest::faction(262,-1);	#Guards of Qeynos
		quest::faction(230,1);	#Corrupt Guards of Qeynos
		quest::faction(341,-2);	#Priests of Life
		quest::faction(296,1);	#Opal Dark Briar
		quest::summonitem(quest::ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5023,5024,5025,5076,6011,6012,6013,6014,6015,6016,6017,6018,7007,7008,7009,7010,26800,30980));
		quest::ding();
		quest::exp(400);
		}
	}

#END of FILE Zone:qcat  ID:45088 -- Rihtur_Fullome
