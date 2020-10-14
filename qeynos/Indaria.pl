#Indaria.pl
#Indaria's Doll

sub EVENT_SAY 
	{
	if($text=~/Hail/i)   
		{
		quest::say("Hello, have you seen my [daughter]?");#Verified on live
		}
	elsif ($text=~/daughter/i)	
		{
		quest::say("Yes, my daughter.  She went to play near the aqueducts with her doll, and how she is gone.  If only there was some sign of her..."); #Verified on live
		}
	}

sub EVENT_ITEM 
{	
	if (plugin::check_handin(\%itemcount, 13712 => 1)) #doll
	{
		quest::emote("tries to keep her composure.  She hands you a silver locket with great effort, and then bursts into tears."); #Verified on live
		quest::summonitem(1316);#Velvet Choker
		#Turn in and faction verified on live, exp not verified.
		quest::faction(291, 1);#Merchants of Qeynos
		quest::faction(223, -1);#Circle Of Unseen Hands
		quest::faction(219, 1);#Antonius Bayle
		quest::faction(230, -1);#Corrupt Qeynos Guards
		quest::faction(262, 2);#Guards of Qeynos
		quest::exp(27440);#1% level 15 xp
		quest::ding();#1% level 15 xp
	}
		
	else 
	{
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos ID: 1082 -- Indaria.pl
