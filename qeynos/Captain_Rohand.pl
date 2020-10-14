#Captain_Rohand.pl
#Rohand's Brandy

sub EVENT_SAY 
	{
	if($text=~/Hail/i)   
		{
		quest::say("Greetings, friend, and welcome to the Mermaid's Lure. Here, we sell fishing supplies and some imported goods from far-off lands. And, if you've got a few minutes, I could even tell you a [story] or two.");
		}
   
	elsif($text=~/story/i)   
		{
		quest::say("Stories? Stories? I saw more adventure before I was ten years tall than you'll see in your whole miserable existence. I've been everywhere, [Antonica], [Odus], [Faydwer], [Kunark]. . . You name it, and I can [tell] ya a little something 'bout it. . . If you buy me a sip of brandy, of course!");
		}
	elsif($text =~ /taxes/i)
		{
		quest::say("Argh! You curvy sea goblin! Taxes, you say?! Peh! I got your taxes right here! I sure don't get the services those taxes are supposed to provide! You can tell them ol' Captain Rohand said so!");
		quest::summonitem(13177);
        quest::faction(291,-1);
		}
	
	$qmerchantsofqeynos=$client->GetModCharacterFactionLevel(291);

	if ($text=~/tell/i)
		{
		if ($faction >5) # worse than indiff
			{
			plugin::reject_say();
			}
		elsif ($qmerchantsofqeynos < 65)
			{
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			}
		elsif($text=~/Odus/i)   
			{
			quest::say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin. The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
			}
		elsif($text=~/Faydwer/i)   
			{
			quest::say("I call Faydwer the home of the little people. They say the continent was named by the high elves when they landed on its shores long ago. I've even heard tales of an ancient elven vampire who lives there. . . Just another Felwithe legend, I'll bet!");
			}
		elsif($text=~/Kunark/i)   
			{
			quest::say("Even I can't tell you much about that continent. Kunark is a tough place, populated by even tougher creatures. I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores.");
			}
		elsif($text=~/Antonica/i)   
			{
			quest::say("Antonica?  You're standing on it!  This is the largest continent on all of Norrath, as well as the most populated.  We humans rule over most of Antonica, from this beautiful city to Everfrost, to Highpass and all the way to Freeport.");
			}
		else
			{
			quest::say("Which land do you want me to [tell] you about?");
			}
		}
	}

sub EVENT_ITEM 
#Verified the turn in works at dubious even thos he calls you a lump of refuse!
	{	
	if (plugin::check_handin(\%itemcount, 13034 => 1)) 
		{#Brandy - Factions verified on live
			quest::say("Yeah, this is just what I've been craving!");
			quest::faction(291, 25);#Merchants of Qeynos
			quest::faction(223, -5);#Circle Of Unseen Hands
			quest::faction(219, 3);#Antonius Bayle
			quest::faction(336, 2);#Coalition of Tradefolk III
			quest::faction(262, 5);#Guards of Qeynos
			quest::exp(8000);
			quest::ding();
		}
		
	else 
		{
		plugin::return_items(\%itemcount);
		}
}

#End of File zone:qeynos ID: 1101 -- Captain_Rohand.pl
