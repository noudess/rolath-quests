
sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("What do you want? Leave me be! Can't a man drown his [sorrows] in peace!?");
		}

	if($text=~/sorrows/i) 
		{
		quest::say("I can buy my own drinks, thank you. Now, leave me alone.");
		}

	if($text=~/Yiz/i) 
		{
		quest::say("My brother Yiz?! That worthless hunk of orc dung... Last I heard, he was still searching for those [blasted eyes].");
		}

	if($text=~/blasted eyes/i) 
		{
		quest::say("That is none of your business, bub!");
		}

	if($text=~/Lynuga/i)
		{
		quest::say("As if I care what you are going to do");
		quest::faction(346, -25);
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 18010 => 1)) #Torn Parchment
		{
		quest::say("Peh! He thinks this old skull he found is a legendary skull of Wun Toque. It is said, a wizard who possesses one is granted power and intelligence far beyond those of his peers. Yiz was searching for the skulls missing ruby eyes. It seems he found the location of the first eye. Hmm.. Lynuga.. Lynuga.. I think I have heard that name before.. Yeah! Now I remember. I met her in the Foreign Quarter of Neria.. um.. Highpass Hold. She was trying to hawk some stolen gems! I think she mumbled something about going home to Grobb. I sure don't have time to track her down.");
		quest::exp(1000);
		quest::ding();
		#Factions verified on ZAM
		quest::faction(346,10);  #Commons Residents
		quest::faction(330,2); #Freeport Militia
		quest::faction(281,2); #Knights of Truth
		quest::faction(362,1); #Priests of Marr
		}

	elsif(plugin::check_handin(\%itemcount, 13987 => 1)) #Jeweled Skull made via tradeskill recipe
		{
		quest::say("You found it!? My sap of a brother was right after all! I sure don't want that thing. It sends shivers down my spine just holding it. Here. Take it!");
		quest::exp(10000);
		quest::ding();
		quest::summonitem(13988);
		#Factions verified on ZAM
		quest::faction(346,100);  #Commons Residents
		quest::faction(330,25); #Freeport Militia
		quest::faction(281,25); #Knights of Truth
		quest::faction(362,15); #Priests of Marr
		}

	elsif(plugin::check_handin(\%itemcount, 13988 => 1)) #Jeweled Skull from previous turnin
		{
		quest::say("Hmmm. On second thought, I might be able to get a good price for this in Neria... um... Highpass Hold. See ya, chum!");
		#Factions verified on ZAM
		quest::faction(346,25);  #Commons Residents
		quest::faction(330,6); #Freeport Militia
		quest::faction(281,6); #Knights of Truth
		quest::faction(362,3); #Priests of Marr
		}
	else 
		{
		quest::say("I am sorry. But you have no business giving me this junk.");
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:freportw  ID:9060 -- Hyrill_Pon.pl
