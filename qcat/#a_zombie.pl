sub EVENT_SAY
	{
	if($faction <= 5)
        {
		quest::say("H...el...p me...");
        }
	else 
		{ 
		plugin::reject_say(); 
		}
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18804 => 1)) {
    quest::say("Rele.. ase.. me.. from.. this.. tor.. ment.. ARGH! You will die for entering the domain of the Bloodsabers!! Karana.. help.. me?");
	quest::attack("$name");
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
