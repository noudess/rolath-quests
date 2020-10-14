sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome. I am Raine Beteria.");
  }
}

sub EVENT_ITEM 
	{
	if(($itemcount{6339} == 1) && ($gold >= 50)) 
		{
		quest::say("Your silver wand has been fully enchanted. Take it and the pouch of silver dust back to the temple of Ro.");
		quest::summonitem(6340);
		#Faction Per Zam
		quest::faction(128, 5);
		quest::exp(1000);
		quest::ding();
		}

	if($itemcount{10792} == 1) 
		{
		quest::say("Thank you very much. I have always wanted one of these! Hehehe? Just kidding. I see that you have enchanted this coin. I have placed the final enchantment on it - take it back to Romar.");
		quest::summonitem(10793);
		quest::exp(2067182);
		quest::ding();
		}

	} 
