#Noxhil_V-Sek.pl

sub EVENT_SAY 
	{ 
	if($faction < 6 && $text=~/Hail/i)
		{
		quest::say("Greetings, $name!  We of the Dead are proud to have you among us.  Your lineage is well known.  Still, you must learn to claw your way to the upper echelon.  There are many [menial tasks] to be performed before you can truly be inducted as a member.");
		}

	elsif($faction < 6 && $text=~/menial tasks/i)
		{
		quest::say("You cannot avoid the toil of peons. We have all spent our time in the lower ranks. There are duties such as [collecting beetle eyes].  If that is too much for you, then your only usefulneed might be as a [courier]!");
		}

	elsif($faction < 6 && $text=~/courier/i)
		{
		quest::say("Seek out our agents in Highpass and Commonlands and ask them if they have [any messages for Neriak].  Go now before I decide you would be more useful dead!");
		}

	elsif ($text=~/Innoruuk/)
		{
		quest::say("He is the Prince of Hate. We are His vessels of destruction. There are no greater servants of Innoruuk than the Dead. His word is law. Once the Teir'Dal obtain the second half of the [scroll of G'han], all Norrath shall be enveloped by His glorious hate.");
		}

	elsif ($text=~/scroll of G'han/)
		{
		quest::say("The scroll of G'han was scribed long ago by the great necromancer G'han. With it, we can commune directly with Innoruuk. Unfortunately, one portion of the scroll was taken from us by a rogue who was hired by the Koada'Dal. In Felwithe, it doth lie. The Indigo Brotherhood now attempts to reclaim it.");
		}

	elsif ($faction > 5)
		{
		quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}

	elsif ($faction == 5)
		{
		quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}

	elsif($text=~/collecting beetle eyes/i)
		{
		quest::say("Take this chest.  It has been fitted with a mold designed to hold ten beetle eyes.  We require them for further experiments.  Do not return until you fill the chest.");
		quest::summonitem(17930);#Empty Box
		}

	elsif($text=~/other components/i)
		{
		quest::say("Take this chest. This one must be filled with [Kerra Isle beetle] eyes. When you finish filling the chest, be sure to return to me with a [wooly mammoth] tusk also. Be quick about it and I just may reward you with something special.");
		quest::summonitem(17932);#Kerra Isle Beetle Box
		}

	elsif ($text=~/wooly mammoth/i)
		{
		quest::say("I hear that wooly mammoths can be found in the peaks of Everfrost. They are fierce beasts. I would hate to annoy one.");
		}

	elsif ($text=~/Kerra Isle/)
		{
		quest::say("The shipping route between Qeynos and Erudin includes a stop on an island filled with friendly catpeople. Also on this isle is the Kerra Isle beetle. It is indigenous to Kerra Isle and the catpeople are very protective of them.");
		}

	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13389 => 1))
		{#Box of Beetle Eyes
		quest::say("Fantastic work, my child! We shall store these for further experiments. Take this as extra payment for a fine job. You have done so well I believe you can assist in obtaining two [other components].");
		quest::faction(239, 10); #The Dead
		quest::faction(303, 1); #Queen Cristanos Thex
		quest::faction(278,-1); #King Naythox Thex
		quest::faction(275,-1); #Keepers of Art
		quest::faction(245,-1); #Eldritch Collective
		quest::faction(1522,-20); #Primordial Malice
		quest::exp(17150);
		quest::ding();
		quest::givecash(0,16,0,0);#16 silver
		quest::summonitem(quest::ChooseRandom(13021, 13022));#Neriak Necter or Rotgrub Rye
		}
	elsif(plugin::check_handin(\%itemcount, 10124 => 1, 13395 => 1))
		{#Mammoth Tusks & combined box
		quest::say("Excellent work, young one! You are sure to be an asset to our faction. Let us see if we can help you on your journey to power. I believe this can be of assistance to a young necromancer of the Dead.");
		quest::faction(239, 20); #The Dead
		quest::faction(303, 3); #Queen Cristanos Thex
		quest::faction(278,-3); #King Naythox Thex
		quest::faction(275,-3); #Keepers of Art
		quest::faction(245,-3); #Eldritch Collective
		quest::faction(1522,-40); #Primordial Malice
		quest::exp(17150);
		quest::ding();
		if ($class eq "shadowknight")
			{
			quest::summonitem(quest::ChooseRandom(59972, 7671));
			}
		else
			{
			quest::summonitem(7641);
			}
		}
	else 
		{
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:neriakc  ID:42042 -- Noxhil_V`Sek 
