sub EVENT_SAY 
	{ 
	if($text=~/hail/i)
		{
		quest::say("Greetings, $name!  I am Deputy Lowmot.  In addition to my duties as a deputy, I am also in charge of organizing all of our meals here at the Guardian Stronghold.");
		}
	if($text=~/nice hat/i)
		{
		quest::say("Thank you, It is worn with pride and is the symbol of the Rivervale Militia");
		}
	}

sub EVENT_ITEM 
	{ 
	if(plugin::check_handin(\%itemcount,13959=> 1))
		{
		quest::say("Oh good!  Hey.  You are not Jillin..  Helping out Blinza huh?  She is quite a woman..  Yes indeed.  Quite a woman..  ah..  Oh sorry.  Here you go.  Thanks again.  Mayor Gubbin will be pleased.");
		quest::givecash(7,0,0,0);
		#faction verified on Live.
		quest::faction(263, 1);	#Guardians of the Vale
		quest::faction(286, 1);	#Mayor Gubbin
		quest::faction(355, 1); #Storm Reapers
		quest::faction(292, 1);	#Merchants of Rivervale
		quest::faction(334, -1);	#Dreadguard Outer
		quest::exp(5); 
		quest::ding();
		}
	plugin::return_items(\%itemcount); # return unused items
	}
#END of FILE Zone:rivervale  ID:19110 -- Deputy_Lowmot 

