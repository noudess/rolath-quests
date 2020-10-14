sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("It is always a pleasure to meet a new face. We have many who travel far and wide to visit our great academy. Many who brave the long trip by boat. Many who dare to cross the territory of the [Deathfist orcs].");
		}
	if($text=~/deathfist orcs/i) 
		{
		quest::say("The Deathfist are a clan of orcs. They are not very powerful, yet I hear they dabble in the circles of magic. Their skills in the ways of magic are limited. It is my duty to study them. I shall pay for your services. Will you [assist with the research]?");
		}
	if($text=~/assist with the research/i) 
		{
		quest::say("Yes. You will do. Go into the lands which surround Freeport. There you shall encounter Deathfist apprentices. They are as young as yourself and each should carry an orc cantrip. Return one for further studies. Do so and you will earn your pay as well as our respect.");
		}
	if($text=~/test the might of the orc oracles/i) 
		{
		if ($faction > 5)
			{
			quest::say("You had best leave my sight. I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
			}
		else
			{
			my $acf=$client->GetModCharacterFactionLevel(220);
			if ($acf < 175)
				{
				quest::say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us.  Perform a tasks for the great Tara Neklene.");
				}
			else
				{
				quest::say("You have heightened your knowledge to the appropriate rank. You are ready to challenge the Deathfist oracles. Do so and return one oracle scroll which any of them may have. If I am in a good mood when you return, you shall soon be summoning elementals.");
				}
			}
		}
	}

sub EVENT_ITEM 
	{
	my $acf=$client->GetModCharacterFactionLevel(220);
	my $uselevel = $ulevel;
	my $xpgained;

	if ($ulevel > 6)
		{
		$uselevel = 6;
		}

	my $xpthislevel = (($uselevel**3) * 1000) - ((($uselevel-1)**3) * 1000);

	if($itemcount{13845} > 0) # Cantrip
		{
        my $perc=9.0/125.0;

        $xpgained = $itemcount{13845} * $xpthislevel * $perc;
        plugin::mass_handin(13845, 1, \&CantripReward);

		quest::say("Very fine work, my young apprentice. This shall be very useful in understanding their ways. I have heard rumors of a scribe who can decipher these scrolls. He is said to frequent the local taverns. Bah!! If I cannot decipher them, no one can!! Continue with your work. Soon you shall advance enough to [test the might of the orc oracles].");
		quest::exp($xpgained);
		quest::ding();
		}
	elsif($acf > 174 && $itemcount{13225} > 0)
		{
        my $perc=7.0/125.0;

        $xpgained = $itemcount{13225} * $xpthislevel * $perc;
        plugin::mass_handin(13225, 1, \&ScrollReward);

		quest::say("Wonderful! You have survived the might of an oracle. With this we can now continue our experiments. Now you may continue your teaching and study the power to summon those of earth, air, water and fire.");
		quest::exp($xpgained);
		quest::ding();
		}
	else 
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	} 

sub CantripReward
	{
	quest::givecash (3,12,0,0);
	#Factions verified on ZAM.
	quest::faction(220,10);   #Arcane Scientists
	quest::faction(281,2);  #Knights of Truth
	quest::faction(296,-1); #Opal Dark Briar
	quest::faction(330,-1); #Freeport Militia
	quest::summonitem(quest::ChooseRandom(13005, 13002, 13006));
	}

sub ScrollReward
	{
	quest::givecash (3,12,3,0);
	#Factions verified on ZAM.
	quest::faction(220,15);   #Arcane Scientists
	quest::faction(281,3);  #Knights of Truth
	quest::faction(296,-2); #Opal Dark Briar
	quest::faction(330,-2); #Freeport Militia
	quest::summonitem(quest::ChooseRandom(15317, 15058, 15316, 15315, 23516));
	}

#END of FILE Zone:freportw  ID:9077 -- Tara_Neklene
