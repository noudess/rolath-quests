sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it. maybe you shall win and gain my trusty [Pestilence].");
		}
	if($text=~/what pestilence/i)
		{
		quest::say("My beloved scythe. Upon my death, my soul shall live withn her.  Such is the pact."); 
		}
	if($text=~/Arlena/i)
		{
		quest::say("My beloved Arlena is my most perfect creation. A bit of flesh here, a bit of bone there and I created her. She left my arms while I was away. Find her and stop her. Return her bones to me so that I may restore her. She has no doubt returned to where I first met.. most.. of her, [Mistmoore Castle]."); 
		}
	if($text=~/Mistmoore Castle/i)
		{
		quest::say("It stands on the continent of Faydwer.  That is all you need to know."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 12137 => 1))
		{
		quest::say("The head for my commander.  Let us see.  I have a body ready for it.  There.  Hahahaha!! As for your fine work, take this.  Also, I believe you can help me find my beloved [Arlena].");
		quest::faction(221,15);
		quest::faction(262,-2);
		quest::faction(296,1);
		quest::faction(341,-3);
		quest::faction(230,1);
		quest::givecash(0,0,7,0);
		quest::summonitem(plugin::RandomRange(2137,2148));
		}
	}
#END of FILE Zone:southkarana  ID:3312 -- Lord_Grimrot 

