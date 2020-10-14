sub EVENT_SAY{
   if($text=~/hail/i){
      quest::say("Greetings. I am in the middle of some important research so regrettably do not have the time to converse.");
   }
}

sub EVENT_SIGNAL{
	$npc->Depop(1);
}

sub EVENT_ITEM{
   if(plugin::check_handin(\%itemcount, 7373 => 1, 7374 => 3)){
      quest::say("Hopefully these robes still contain enough of a magical imprint from the shades to be useful in successfully warding the Magus Conlegium
      from their kind. Thank you for you assistance. Keep this token as a symbol of your allegiance to the Magus Conlegium.");
      quest::faction(1504,10);
      quest::faction(1502,10);
      quest::faction(1503,10);
      quest::faction(1483,-30);
      quest::faction(1484,-30);
      quest::faction(1485,-30);
      quest::faction(1541,-30);
      quest::summonitem(7394); #Magus Conlegium Token
   }
   else {
		quest::say("I have no need for this item, $name. You can have it back");
		plugin::return_items(\%itemcount);
	}
}

