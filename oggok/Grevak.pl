# Must be Indifferent or better

sub EVENT_SAY 
	{
	if ($text=~/Hail/i) 
		{
		quest::say("Need new members we do not. Powerful enough are we with Grevak. Still. peons needed. Are you a [new peon] or are you an [outsider]? Speak up!! Fool!! No time Grevak has!!");
		}
	if ($faction > 5)
		{
		quest::say("Foe of Greenbloods you are.  In two I will rip you.  Best if run.");
		}
	elsif ($text=~/new peon/i) 
		{
		quest::say("So you think you can be greater than Grevak!! Touch you not and still I can smash you. I am a Greenblood shadowknight!! Peon are you. Peons go to swamps and slay lizardmen. You return with four lizardmen tails and a reward is yours. You return with two lizardman shaman dolls and a great reward is yours.");
		}
	elsif ($text=~/outsider/i) 
		{
		quest::say("Go away or soon your pain will find you.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction > 5)
		{
		quest::say("Help Greenbloods you will. Give lizard tails to Grevak. Den maybe we trust.");
		}
	elsif  (plugin::check_handin(\%itemcount, 13367 => 2)) 
		{
		quest::say("A shaman doll! A great knight you some day become. A gift I give to help you on your way. The fight you will continue. All hail the Greenbloods!");
		quest::summonitem(quest::ChooseRandom(15235,17005,2128,2130,2132,2135,2136));
		quest::exp("500");
		quest::faction(228,"5");  # Increase faction -- Clurg
		quest::faction(261,"10");# Increase faction -- Greenblood Knights
		quest::faction(308,"-1");# Decrease faction -- Shadowknights of Night
		quest::faction(312,"-1");# Decrease faction -- Storm Guard
		quest::ding();
		} 
	elsif  (plugin::check_handin(\%itemcount, 13354 => 4)) 
		{
		quest::say("Now I shall take the lizard tails to shamans I will. Healing spells will this help create. You continue to slay. Continue to be the peon. Continue to live.");
		quest::summonitem(quest::ChooseRandom(13453,2125, 2126, 2127, 2128, 2129,,2130,2131,2132,2133, 2134, 2135,2136, 9016));
		quest::exp("500");
		quest::ding();
		quest::faction(228,"5");  # Increase faction -- Clurg
		quest::faction(261,"10");# Increase faction -- Greenblood Knights
		quest::faction(308,"-1");# Decrease faction -- Shadowknights of Night
		quest::faction(312,"-1");# Decrease faction -- Storm Guard
		} 

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:oggok  ID:49034 -- Grevak
