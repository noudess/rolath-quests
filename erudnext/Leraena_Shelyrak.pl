sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome. my child.  I am Leraena Shelyrak. overseer of the Temple of Divine Light. Inside this temple. you may find the path to inner peace.  Introduce yourself to each of the priests and priestesses of the temple as well as the paladins. Together we shall put an end to such disruptive influences as the [kobold shamans]."); 
		}
	elsif ($client->GetModCharacterFactionLevel(298) >= 100)
		{
		if($text=~/slay/i)
			{
			quest::say("You are so young...  Go to Toxxulia and find these kobold shamans.  Cut off their paws and return them to me.  I require three paws as proof of your worth to our temple."); 
			}
		elsif($text=~/kobold shaman/i)
			{
			quest::say("The primitive kobold race has begun to show signs of healing ability.  No doubt this was granted by some evil deity.  Since they are of little power compared to a much more superior race such as ours. we only require the talents of young priests to [slay the kobold shaman].");  
			}
		elsif ($text=~/i need a guild coin/i) 
			{
			quest::say("Yes, of course. Here it is. Remember that it is not a form of currency.");
			quest::summonitem(13989);
			}

		elsif ($text=~/more powerful kobold shamen/i) #need correct text
			{
			quest::say("There are obviously other shaman with greater healing ability than those we have yet seen.  Take this pouch and collect some of their odd necklaces so that we may study them.");
			quest::summonitem(17090);
			}

		elsif ($text=~/greater kobold shamen/i) 
			{
			quest::say("Return to the Warrens, or the adjacent mountains and obtain eight of the bronze symbols worn by the kobolds greater shaman. Place them in this sack that has been blessed by the powers of Quellious to protect you from the evil influence of the evil symbols. Return the full sack with your initiate symbol of Quellious.");
			quest::summonitem(17090);
			}

		elsif ($text=~/I am ready to advance/i) 
			{
			quest::say("You are ready to strike at the body of the kobold shamans power. There is no reasoning with the Kobolds thus there shall be no peace in our beloved lands until their devotion to their wicked deity ceases. Return once again to the Warrens and bring me the unholy symbol worn by the High Shaman.");
			}
		}
	elsif ($faction > 6)
		{
		quest::say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
		}
	else 
		{
		quest::say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18723 => 1)) #tattered note
		{
		quest::say("Greetings. and welcome to the Temple of Divine Light! Here is your guild tunic. Serve Quellious well. Please see Lumi Stergnon - he has a task for you.");
		quest::summonitem("13546");
		quest::faction(298, 100); #Peace Keepers
		quest::faction(266, 25); #High Council of Erudin
		quest::faction(265, -25); #Heretics
		quest::exp(15); 
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 2049 => 1)) # rolled up strip of cloth
		{
		# New stage of Aderius capture.
		quest::say("Yes, $name.  We are aware of the plight of Aderius.  For now, he can serve the alliance best by remaining where he is.  Please give this letter to Aderius.  We have not forgotten him."); 
		quest::summonitem(132504);

		# Faction verified on ZAM
		quest::faction(298,2); # Peace Keepers.
		quest::faction(266,1); # High Council of Erudin.
		quest::faction(265,-1); # Heretics.
		quest::exp(1000);
		quest::ding();
		quest::givecash(8,2,0,0);# Per ZAM
		}

	if ($client->GetModCharacterFactionLevel(298) >= 100)
		{
		if (plugin::check_handin(\%itemcount, 13883 => 3)) 
			{
			  quest::say("Fine work. They shall never lay hands upon another kobold again. I mean paws. Here is a small reward for a fine job. Unfortunatly we have recently learned that the shamen in the forest are merely underlings to [more powerful kobold shamen] that reside in the kobold warrens. Continue the work of Quellious.");
			  # verified on live
			  quest::summonitem(quest::ChooseRandom(15011,15013,15014,15017,15036,15200,15201,15202,15203,15207,15208,15209,15210,15211,15212,15213,15215,15216,15218,15501,15560));
			  quest::exp(500);
			  quest::ding();
			  quest::faction(298, 20);
			  quest::faction(266, 5);
			  quest::faction(265, -5);
			  quest::givecash(0,7,1,0);
			}

		if (plugin::check_handin(\%itemcount, 14582 => 1))
			{
			  quest::say("I am unfamiliar with the markings that adorn these necklaces. You have done well thus far in hindering the kobolds worship of their evil deity. I award you the Initiate Symbol of Quellious. Return to me when you feel you are ready to deal with the [greater kobold shamen].");
			  # verified on live
			  quest::summonitem(1564);
			  quest::exp(100);
			  quest::ding();
			  quest::faction(298, 25);
			  quest::faction(266, 6);
			  quest::faction(265, -6);
			}

		if (plugin::check_handin(\%itemcount, 14583 => 1, 1564 => 1)) 
			{
			  quest::say("Your service to this temple is commendable. I award you the rank of Disciple for your devotions to The Tranquil. When you are [ready to advance] return to me and I will set you upon another task.");
			  quest::summonitem(1565);
				quest::exp(500);
				quest::ding();
				# Faction verified on live
				quest::faction(298, 30);
				quest::faction(266, 7);
				quest::faction(265, -7);
			}

		if (plugin::check_handin(\%itemcount, 14585 => 1)) 
			{
			  quest::say("It is imperative that we discern the nature of these symbols and the source of the kobolds shamanistic powers. There is a citizen of Erudin residing in Freeport named Glyssa Sonshaw. She is quite possibly the most knowledgeable individual in the field of heraldic and hieroglyphic studies. Take the high shamans necklace and this note to her. When you have discovered the nature of the symbols return to me with the documentation and your Disciple Symbol of Quellious.");
			  quest::summonitem(1772);
			  quest::summonitem(14585);
			  quest::ding();
			}

		if (plugin::check_handin(\%itemcount, 1780 => 1, 1781 => 1, 1565 => 1)) 
			{
			  quest::say("You have done well yet again, young disciple. I award you the rank of Regent of the Peacekeepers. With this information we can hopefully gain some insight into the workings of the kobolds' religion.");
			  quest::summonitem(1566);
			  quest::exp(1000);
			  quest::ding();
			  # Faction verified on live
			  quest::faction(298, 70);
			  quest::faction(266, 17);
			  quest::faction(265, -17);
			}
		}

	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:erudnext  ID:98079 -- Leraena_Shelyrak 
