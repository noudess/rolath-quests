sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings and blessings to you, $name. Karana offers you his protection and guidance. All who accept the offer shall find safe haven within our Temple of Thunder, If you are a cleric of Karana, you must have a [desire to serve Karana]'s flock.");
		}
	elsif ($faction >= 6) # tested at apprehensive
		{
		quest::say("You have proven yoirself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat.");
		}
	elsif ($faction >= 5) # Tested at indiff on live
		{
		quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us,  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		}
	elsif($text=~/desire to serve karana/i)
		{
		quest::say("If you are a young acolyte, you may [deliver blessings to the flock] and if you are a skilled cleric, we need you to [hunt bandit binders].");
		}
	elsif($text=~/deliver blessings to the flock/i)
		{
		quest::say("Then go to the Plains of Karana. It is there that the blessings are needed. Ask every resident of the plains if they are followers of Karana. If they are, then ask them if they [require Karana's blessings]. Let them drink from this temple chalice. Return the empty chalice to me and you shall never go thirsty again.");
		quest::summonitem("12103"); 
		}
	elsif($text=~/hunt bandit binders/i)
		{
		quest::say("Go to the Plains of Karana and seek out the [Karana Bandits]. Among them can be found their bandit binders. They are healers of sorts. Which evil deity granted them this power is unknown to us. Each carries a binder spectacle. I shall reward clerics for  every two returned spectacles.  Perhaps a new power may even be bestowed.");
		}
	elsif($text=~/Karana Bandits/i)
		{
		quest::say("The bandits of the Plains of Karana have had the audacity to intentionally adopt the name Karana bandits! They plague our followers in the plains. Among their ranks are healers called bandit binders. I call to all skilled clerics of this temple to [hunt bandit binders]. Chesgard has a reward for paladins.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 12104 =>1 )) 
		{
		quest::say("You have done a good service for the flock of Karana. Study the words upon this scroll and soon Karana shall keep you from thirst.");
		quest::exp(150);
		quest::ding();
		# Factions verified on live
		quest::faction(280,10 ); # Knights of Thunder
		quest::faction(341,7 ); # Priests of Life
		quest::faction(262,7 ); # Guard of Qeynos
		quest::faction(221,-10 );# Bloodsabers
		quest::givecash(1,0,1,0);
		}

	if ($faction <= 4 && plugin::check_handin(\%itemcount, 12101 =>2 ))
		{
		quest::say("Excellent work. These foul men have no right to be proficient in the ways of healing. Here then is your bounty. Use it in your continued war against the Karana bandits.");
		quest::exp(257);
		quest::ding();
		# Factions verified on live
		quest::faction(280,20); # Knights of Thunder
		quest::faction(221,-20);# Bloodsabers
		quest::faction(341,15); # Priests of Life
		quest::faction(262,15); # Guard of Qeynos
		quest::givecash(0,0,6,1);
		quest::summonitem(quest::ChooseRandom(15036, 15501, 15560, 15226, 15229, 7601, 15219, 15223, 15230, 15224, 15050));
		}

	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:qeynos  ID:1085 -- Gehna_Solbenya 

