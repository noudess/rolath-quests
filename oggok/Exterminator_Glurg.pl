sub EVENT_SAY 
	{
	if ($faction > 7)
		{
		quest::say("Come closer.  Bouncer smash your head!");
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Hello dere. Do you see all dese darn critters running around here? Dere are little armadillos everywhere! We need to git rid of dem. If you bring me four of dere husks, I pay you money. Too many for me to smash alone.");
		}
	}

sub EVENT_ITEM {
  #Handin: 4x Armadillo Husks
  if($faction < 8 && plugin::check_handin(\%itemcount, 19195 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("You smashed dem gud. Take dese coins!");
    quest::faction(337,1); # +Oggok Guards
    quest::faction(228,1); # +Clurg
    quest::exp(500);
	quest::ding();
    quest::givecash(1,1,1,0);
  }
  plugin::return_items(\%itemcount);
}

  
