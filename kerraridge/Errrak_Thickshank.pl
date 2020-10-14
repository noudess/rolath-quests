sub EVENT_SAY 
	{ 
	if ($faction < 8)
		{
		plugin::reject_say();
		}
	elsif($text=~/Hail/i)
		{
		quest::say("What?  What do you want. furless?  My tseq. Graalf. lies sick and you waste time with talk when you [cannot help].");
		}
	elsif($text=~/why cannot i help/i)
		{
		quest::say("The shamans. they have said I need [talismans] to ward the sickness from Graalf.");
		}
	elsif($text=~/what talismans/i)
		{
		quest::say("Errr?  You wish to help?  We will see.  I need a tiger's skin. from a tigerrr not of ourrr village. for its brave spirit. an aviaks charm. and a giant snake fang for the poison that can be made into an antidote.  If you truly intend to help. then good speed and hurry!"); 
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 8 && plugin::check_handin(\%itemcount, 7005 => 1, 13737 =>1, 13762 =>1)) 
		{
		quest::say("I cannot believe.  Thank you.  Please, take this talisman.  I bought from wandering shaman but it no help Graalf, maybe it help you.  Now please go, Errak must see if this will help Graalf.");
		quest::faction(382,5);    # Kerra Isle
		quest::ding();
		quest::exp(10000);
		quest::summonitem(10139);
		}
	}

#END of FILE Zone:kerraridge  ID:74080 -- Errrak_Thickshank 

