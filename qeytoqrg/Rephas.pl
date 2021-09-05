######################################################
# NPC:  Rephas
# Zone:  qeytoqrg
# Quest:  Rat Ear Pie
# Author:  Andrew80k
######################################################

sub EVENT_SAY {

    if ($text=~/hail/i) {
        quest::say("Aagggh..  Get away from here..  Go, run..  Far away..  Or I shall call [Karana's] wrath upon you!");  
    }

    if ($text=~/karana's/i) {
        quest::say("Heh!..  Ignorant one!  Begone, and take your stupidity with you!");
    }

}

sub EVENT_ITEM 
	{
	if ($faction < 7)	 # Zam says need apprehensive
		{
		if (defined($itemcount{13072}) && $itemcount{13072} >= 1)
			{
			quest::say("Ahh yes..  These are a little small, but still some good eating, if you know how to cook 'em of course..   Here ya go, enjoy and may Karana keep your fields lush and green.");
			plugin::mass_handin(13072, 1, \&RAT_EARS);	
			} 

		if (defined($itemcount{13719}) && $itemcount{13719} >= 1)
			{
			quest::say("Wha?..   Ah, I guess it's a bit of an acquired taste..  Oh well, your loss..  Here, take this..  They ain't no ears, but it's the least I could do..   And if ya find any more rat ears, good ol' Rephas here will be glad to take 'em off your hands for ya!");
			plugin::mass_handin(13719, 1, \&GRILLED);	
			} 

		if (plugin::check_handin(\%itemcount,13050=>3)) 
			{
			quest::say("Wow!..  How big was the dang varmint that these come off of?!  Bigger'n a ol' grizzly, I bet!  You've earned this, my friend!  It's my own secret recipe for rat ear pie..  sure is tasty, easy to make, and keeps your belly full while you're running about in the hills and such.  Take care, and may Karana keep your path clear and our lakes full.");
			# Faction verified on live
			quest::faction(220,5);  # Arcane Scientists
			quest::faction(281,1); # Knights of Truth
			quest::faction(330,-1); # Freeport Militia
			quest::faction(296,-1); # Opal Dark Briar
			quest::exp(300);
			quest::ding();
			quest::summonitem(18103);
			} 

		# New quest added
		if (plugin::check_handin(\%itemcount,13050=>1)) 
			{
			quest::say("Hey..  wow..  Now THESE are some good, meaty ears..  These will make one great rat ear pie..  Tell ya what, kid..  bring me a few more o' these beauties, and I'll give you my secret recipe for cooking 'em.");
			quest::faction(220,2);  # Arcane Scientists
			quest::faction(281,2); # Knights of Truth
			quest::faction(330,-1); # Freeport Militia
			quest::faction(296,-1); # Opal Dark Briar
			quest::exp(100);
			quest::ding();
			$npc->CastSpell(40,$userid); #Strenghten
			}

		if (plugin::check_handin(\%itemcount, 27428 => 1, 27429 => 1, 27430 => 1)) 
			{
			quest::say("Ah! You've found them! I hope those gnolls payed dearly for stealing them from me. Did they beg for mercy? I sure hope so. Well, here is the completed research book for Juegile.");
			quest::summonitem(27431);    
			}
		}
	}

sub RAT_EARS
	{
	# Faction verified on live
	quest::faction(220,5);  # Arcane Scientists
	quest::faction(281,1); # Knights of Truth
	quest::faction(330,-1); # Freeport Militia
	quest::faction(296,-1); # Opal Dark Briar
	quest::exp(100);
	quest::ding();
	quest::summonitem(13719);    
	}

sub GRILLED
	{
	# Faction verified on live
	quest::faction(220,5);  # Arcane Scientists
	quest::faction(281,1); # Knights of Truth
	quest::faction(330,-1); # Freeport Militia
	quest::faction(296,-1); # Opal Dark Briar
	quest::exp(100);
	quest::ding();

	my $item;
	my $chance=plugin::RandomRange(1,100);
	if ($chance < 21)
		{
		$item=quest::ChooseRandom(15205,15289,15208,15040,15041);
		}
	elsif ($chance > 20 && $chance < 41)
		{
		$item=1038;
		}
	else 
		{
		$item=13076;    
		}

	quest::summonitem($item);    
	}
