# ZONE: West Freeport (freportw)

sub EVENT_SAY
	{ 

	if($text=~/Hail/i)
		{
		quest::say("Pleased to meet you. $name. Have you seen how clear the water is underneath the Academy? All sorts of life could flourish there. What a shame there are no [Marr Minnows] there.");
		}

	if($text=~/What Marr Minnows?/i)
		{
		quest::say("The Marr Minnow swims in the pond near the Temple of Marr. I wish I had one. Not a dead one. A live one. I need someone to [get the minnow].");
		}

	if($text=~/get the minnow/i)
		{
		quest::say("'Please try. Here you are. Take this jar. Offer the jar to the minnows. Maybe they will swim into it.");
		quest::summonitem(13861);
		}

	}
sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13862 =>1 )) 
		{
		quest::say("Oh! A beautiful Marr Minnow. This shall look grand in my aquarium! How lucky that you are a friend to the Academy of Arcane Science. Take your reward.");
		#facitons verified on Live
        quest::faction(220,5);  # Arcane Scientists
        quest::faction(281,1); # Knights of Truth
        quest::faction(330,-1); # Freeport Militia
        quest::faction(296,-1); # Opal Dark Briar
        quest::exp(100);
        quest::givecash ("7","4","1","0");
        quest::ding();
		quest::ChooseRandom(13002,13003,13004,13005,13006,13007);
		}
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freportw  ID:9072 -- Palon_Deskeb
