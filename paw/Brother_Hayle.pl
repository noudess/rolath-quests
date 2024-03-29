sub EVENT_SAY 
	{
	my $pol = $client->GetModCharacterFactionLevel(341);

	if($text=~/hail/i) 
		{
		quest::say("This is no place for you. These Splitpaws are very fierce. Only the power of Rodcet Nife will guide them to the light. By the way, I might warn you that the cells here lock behind you.");
		}
	elsif ($faction > 5)
		{
		quest::say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		}
	elsif($text=~/xicotl/i) 
		{
		quest::say("Xicotl is the evil troll who attempted to steal Soulfire from the vaults of the Temple of Life. The hilt of Soulfire broke off during the battle and now rests in the hands of this troll shadowknight. From what I have heard, he is frequently an invited guest at the castle called Mistmoore. Woe to any paladin who dares set foot upon the land of Mistmoore, but should you attempt it you might search the guest rooms for the troll. May Rodcet Nife walk with you.");
		}
	elsif($pol > 399) # was no good at 333, good at 408 - best I could do.
		{
		quest::say("The Temple of Life smiles upon you, friend...  but such a delicate matter can only be entrusted to our most loyal members.");
		}
	elsif($text=~/proof of nobility/i) 
		{
		quest::say("I require the returned note I gave you, a Testimony of Truth, a Sword of Faith and finally the hilt of Soulfire. The Testimony and Sword of Faith are earned in the Hall of Truth, but for the hilt of Soulfire you shall have to battle [Xicotl].");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 18927 => 1)) 
		{
		quest::say("I am needed!! What am I doing here? I must return to the Temple of Life to commune with the Prime Healer. Rodcet Nife will give me more strength to finish this job. Thank you, young one! Take this key as a reward. Turn it into Tyokan in the temple shop. Safe journey to you!");
		#Factions verified on live
		quest::faction(341,20); #Priest of Life
		quest::faction(280,6); #Knights of Thunder
		quest::faction(262,10); #Guards of Qeynos
		quest::faction(221,-5); #BloodSabers
		quest::faction(219,3); #Antonious Bayle
		quest::summonitem(13306);
		quest::exp(200);
		quest::ding();
		}

	elsif(plugin::check_handin(\%itemcount, 18936 => 1))  #A Sealed Note
		{
		quest::say("Finally!! I see that Ariska has found a noble knight to retrieve Soulfire. Per Ariska's orders I am not to give Soulfire to you until you can show me [proof of nobility]. You must honor both the Temple of Life as well as the Hall of Truth and to a high degree. Only then shall you hold Soulfire.");
		#Factions verified on ZAM
		quest::faction(341,10); #Priest of Life
		quest::faction(280,3); #Knights of Thunder
		quest::faction(262,5); #Guards of Qeynos
		quest::faction(221,-2); #BloodSabers
		quest::faction(219,1); #Antonious Bayle
		quest::exp(200);
		quest::ding();
		quest::summonitem(18937); #a note
		}

	elsif(plugin::check_handin(\%itemcount, 18937 => 1, 13947 => 1, 18828 => 1, 12197 => 1)) 
		{
		# Not tested - Zam says PoL needs warmly, but later says kindly)
		# Based on 400 requirement for text in EVENT_SAY and the later kills
		# kindly is all but guaraneteed.  Warmly would need MORE work.
		# Going to assume based on quest text KoT needs to be the same.
		# So, going to require kindly for both.

		my $kot = $client->GetModCharacterFactionLevel(281);
		if($faction <= 3 && $kot > 499)
			{
			quest::say("You have proven yourself worthy to hold Soulfire. Do not let her slip into the hands of evil. There are many who wish to free the many trapped souls of shadowknights and necromancers trapped inside the blade. The power of the blade can be called upon to heal you if need be. May Rodcet Nife and the twins of Marr hold you in their glory.");
			#Factions verified on ZAM
			quest::faction(341,100); #Priest of Life
			quest::faction(280,30); #Knights of Thunder
			quest::faction(262,50); #Guards of Qeynos
			quest::faction(221,-25); #BloodSabers
			quest::faction(219,15); #Antonious Bayle
			quest::exp(20000);
			quest::summonitem(5504);
			}
		else 
			{
			quest::say("You have not yet proven yourself.");
			quest::summonitem(18937);
			quest::summonitem(13947);
			quest::summonitem(18828);
			quest::summonitem(12197);
			}
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}
#END of File Zone:paw ID:18071 -- Brother_Hayle
