sub EVENT_SAY 
	{ 
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Hello, I am Syllina, follower of Solusek Ro and keeper of the [Shadow Lore].");
		}
	elsif($text=~/shadow lore/i)
		{
		quest::say("I hold the secrets to the Shadow Lore so highly prized by Necromancers. If you are interested, I can tell you about [ShadowBound Boots], [ShadowBound Gloves], the [Robe of Enshroudment] or the secrets to the making of [Shadow Silk].");
		}
	elsif($text=~/shadowbound boots/i)
		{
		quest::say("ShadowBound Boots are boots woven from purest shadow. If you are interested, I will weave you a pair - but I will need [boot components].");
		}
	elsif($text=~/boot components/i)
		{
		quest::say("I will need the following items to make you a pair of ShadowBound Boots: Shadow Silk, The Scepter of Sorrow from Castle Mistmoore, an Eye of Shadow from our mortal enemies the Shadowed Men and a Skeletal toe from a Rathe Giant Skeleton.");
		}
	elsif($text=~/shadowbound gloves/i)
		{
		quest::say("ShadowBound Gloves are gloves woven from the purest shadow. If you are interested, I will weave you a pair - but I will need [glove components].");
		}
	elsif($text=~/glove components/i)
		{
		quest::say("I will need the following items to make you a pair of ShadowBound Gloves: Inky Shadow Silk, The Scepter of Tears from the circle-stair-waterfall of Guk, a Hand of Shadow from our mortal enemies the Shadowed Men and a Skeletal finger from a Rathe Giant Skeleton.");
		}
	elsif($text=~/robe of enshroudment/i)
		{
		quest::say("The Robe of Enshroudment is a robe woven from the purest of shadow. If you are interested, I will weave you a robe - but I will need the following [robe components].");
		}
	elsif($text=~/robe components/i)
		{
		quest::say("I will need the following items to make you a Robe of Enshroudment: Large Shadow Silk, A Werebat Wing from the Estate of Unrest, A Mask of Shadow from our mortal enemies the Shadowed Men and a Globe of Shadow from a Nokta Shaman in Guk.");
		}
	elsif($text=~/shadow silk/i)
		{
		quest::say("If you are interested, I will tell you the secrets of making Shadow Silk for a mere 50 pieces of gold.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		# Shadow Silk info
		if($gold >= 50) 
			{
			quest::say("You will need to give the following components to a tailor: a Shadow Wolf Pelt, a Silk Swatch and a Scroll of Gather Shadows. Have the tailor weave them together and she will make you Shadow Silk. To make large shadow silk add an extra shadow wolf pelt. To make inky shadow silk, add an extra scroll.");
			}

		# Robe of Enshroudment
		if(($itemcount{16484} == 1) && ($itemcount{13239} == 1) && ($itemcount{2309} == 1) && ($itemcount{10535} == 1)) 
			{
			quest::say("Silk, wing, mask, globe... all of the components necessary for the making of a robe of Enshroudment. Well done. Here is your reward.");
			quest::summonitem(1355);
			# Faction by ZAM
			quest::faction(415,"5");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		# Shadowbound Gloves
		if(($itemcount{14363} == 1) && ($itemcount{13234} == 1) && ($itemcount{10534} == 1) && ($itemcount{16485} == 1)) 
			{
			quest::say("So you have gathered all of the components for me to weave Shadowbound Gloves... Well done. You will be wanting these.");
			quest::summonitem(3318);
			# Faction verified by ZAM
			quest::faction(415,"5");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		# Shadowbound Boots
		if(($itemcount{14364} == 1) && ($itemcount{13180} == 1) && ($itemcount{10533} == 1) && ($itemcount{16483} == 1)) 
			{
			quest::say("I see that you have gathered all of the necessary components... Well done. Here are your Shadowbound Boots.");
			quest::summonitem(3317);
			# Faction verified on ZAM
			quest::faction(415,"5");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}
		}
	}
