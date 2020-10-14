#Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Pleased to meet you! If you are a newcomer to Freeport then you can clearly see we are having quite the rat problem. If you are interested, the militia has granted me some coin to reward those that bring me four rat whiskers.");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13071 => 4)) #Rat Whiskers x 4
		{
		quest::say("This is good work $name! I know this isn't much, but it is all I can offer you. Thanks for your help!");
		#Factions verified on ZAM
		quest::faction(336,1);   # +Coalition of Tradefolk Underground
		quest::faction(330,1);  # +Freeport Militia
		quest::faction(281,1); # -Knights of Truth
		quest::faction(362,1); # -Priests of Marr
		quest::exp(145);
		quest::ding();
		quest::givecash(1,1,1,0);
		}
	else 
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	}
#End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
