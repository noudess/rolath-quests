sub EVENT_SAY {
  if($text =~ /Hail/i) {
    quest::say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 12351 => 1, 12352 => 1, 12350 => 1)) 
		{
		quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		quest::ding();
		# Faction verified on ZAM
		quest::faction(336,25);
		quest::faction(229,25);
		quest::faction(329,2);
		quest::faction(230,1);
		quest::faction(330,3);
		quest::summonitem(12349);
		quest::exp(15000);
		quest::ding();
		}
	}
   
#EOF -- ZONE: ecommons -- NAME: Bubar -- ID: 22033

