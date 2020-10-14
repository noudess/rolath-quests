sub EVENT_SAY 
	{
	if ($faction >= 6) # Verified
		{
		plugin::reject_say();
		}
	else
		{
		if($text=~/hail/i) 
			{
			quest::say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor [Miragul]. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
			}

		if($text=~/miragul/i) 
			{
			quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
			}
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18018 => 1)) { #Dark Truth Guild Note
    quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Shwara Volerno, she can assist you in developing your hunting and gathering skills.");
    quest::summonitem(13551); #Dirt Soiled Robe*
    quest::faction(265,100);  # Heretics
    quest::faction(231,-100);  # Craftkeepers
    quest::faction(233,-100);  # Crimson Hands
    quest::faction(242,-100);  # Deepwater Knights
    quest::faction(254,-100); # Gate Callers
	quest::exp(100);
	quest::ding();
  }
  elsif(plugin::check_handin(\%itemcount, 13068 => 2, 13067 => 2)) { #Bat Wing x 2, Snake Fang x 2
    quest::say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
    quest::summonitem(quest::ChooseRandom(15221,15235,15331, 15338, 15339, 15340, 15342, 15343)); #Spell: Cavorting Bones
	# Faction  and exp verified on live
    quest::faction(265,2);  # Heretics
    quest::faction(231,-2);  # Craftkeepers
    quest::faction(233,-2);  # Crimson Hands
    quest::faction(242,-2);  # Deepwater Knights
    quest::faction(254,-2); # Gate Callers
	quest::exp(40);
	quest::ding();
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75091 -- Coriante_Verisue
