sub EVENT_SAY 
	{
	if ($faction > 7)
		{
		quest::say("Is that your BREATH, or did something die in here?  Now go away!");
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Erh?  If you not be here to help Feskr with his [problem] then Feskr want you to leave.");
		}
	elsif($text=~/problem/i)
		{
		quest::say("You wish to help?  Orrderrr of supplies I rrequest not arrive; ship sink.  Now Feskr needs supplies.  Feskr need bottle of Tunare's Finest. thunderhoof mushroom. tea leaf. and handmade backpack.  Rrrr. strange items but Feskr need to sell.  You bring. Feskr give you nice bag."); 
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 8 && plugin::check_handin(\%itemcount, 12360 => 1, 14914 => 1, 14915 => 1, 17969 => 1)) 
		{
		quest::say("Ahhh. This will help. Many Kerrans will like these. Here. Take this old bag. I have too many. Maybe it help you.");
		quest::summonitem(17032);
		#Faction verified on ZAM
        quest::faction(382,5); # Kerra Isle
		quest::exp(500);
		quest::ding();
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:kerraridge  ID:74076 -- Feskr_Drinkmaker 
