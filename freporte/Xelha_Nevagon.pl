sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("A new recruit to our cause.  Just what I have been waiting for!  How would you like to serve the great Xelha Nevagon?  I need an apprentice necromancer to [assist the great Xelha].");
		}
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($faction < 6 && $text=~/assist the great xelha/i) 
		{
		quest::say("Fantastic.  Stick with me and you shall ascend in our ranks quickly.  I am in need of some components for new spells.  Will you collect them for me?  I shall need four each of the following - fire beetle eyes. bone chips and spiderling silk.  Fetch these items for me at once. Well..? Did not you hear the great Xelha? Begone!");
		}
	}

sub EVENT_ITEM 
	{
	if($itemcount{13099} == 4)
		{ # Spiderling Silk
		if ($faction > 5)
			{
			quest::say("I cannot reward you for this until you have proven your loyalty further.");
			quest::summonitem(13099, 4);
			}
		else
			{
			quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
			quest::ding();
			quest::exp("200");
			quest::givecash("0","4","0","0");
			quest::summonitem(12247); # Xelha's Sparkler
			# Factions Verified
			quest::faction(271,10); # Dismal Rage
			quest::faction(296,2); # Opal Dark Briar
			quest::faction(281,-1); # Knights of Truth
			}
		}

	if ($itemcount{13927} > 0) 
		{
		if ($faction > 3)
			{
			quest::say("I cannot reward you for this until you have proven your loyalty further.");
			quest::summonitem(13927, $itemcount{13927});
			}
		else
			{
			plugin::mass_handin(13927, 1, \&EYE_REWARD);
			}
		}

	if($itemcount{10307} == 4) 
		{ # Fire Beetle Eye
		if ($faction > 5)
			{
			quest::say("I cannot reward you for this until you have proven your loyalty further.");
			quest::summonitem(10307, 4);
			}
		else
			{
			quest::say("This is a good sight. I needed these to complete the current mixture.  Bah!! I shall reward you for this small, very small, deed!! I pass on to you the knowledge of summoning. The more you serve, the more your faith in Innoruuk grows");
			quest::ding();
			quest::exp("200");
			quest::summonitem(quest::ChooseRandom(15331,15338));
			quest::givecash("0","5","0","0");
			# Faction Verified
			quest::faction(271,10); # Dismal Rage
			quest::faction(296,2); # Opal Dark Briar
			quest::faction(281,-1); # Knights of Truth
			}
		}

	if($itemcount{13073} == 4) 
		{ # Bone Chips
		quest::say("Excellent work! You are quite the little helper. Here you go, then. A little something for your little work. Your service to me has caused Innoruuk to look upon you favorably. Your faith in our group has grown. Continue the work.");
		quest::ding();
		quest::exp("200");
		quest::givecash("0","0","1","0");
		# Faction Verified
		quest::faction(271,5); # Dismal Rage
		quest::faction(296,1); # Opal Dark Briar
		quest::faction(281,-1); # Knights of Truth
		}
	}

sub EYE_REWARD
	{
	quest::say("A cyclops eye!! You are stronger than I believed. You will rise in the ranks of the Dismal Rage quickly with acts such as this!! I am most appreciative! Here, take this. It was lying around my shelves, just gettingg all dusty. I hope you can use it. And watch yourself in your journeys, the aura of your faith in Innoruuk surrounds you like a shroud. Our enemies will surely see you for what you are.");
	quest::ding();
	quest::exp("1000");
	quest::summonitem(quest::ChooseRandom(15331,15036,15491,7643));
	# Faction Verified
	quest::faction(271,25); # Dismal Rage
	quest::faction(296,5); # Opal Dark Briar
	quest::faction(281,-3); # Knights of Truth
	}

#END of FILE Zone:freporte  ID:10093 -- Xelha_Nevagon.pl


