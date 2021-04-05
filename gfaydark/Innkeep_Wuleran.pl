sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("This food shortage has finally started affecting even us, all the way over here in Faydwer. We are finding ourselves in [short supply] of certain goods. This is really hurting our business.");
		}
	if($text=~/short supply/i)
		{
		quest::say("It would really be a big help if you could find a way to assist us in restocking our suppy of baked goods. If you [can bake] or if you are [willing to travel] to help us out, that would be truly grand."); 
		}
	if($text=~/can bake/i)
		{
		quest::say("You are a baker?  I could use a new supply of [muffins]."); 
		}
	if($text=~/muffins/i)
		{
		quest::say("Take this crate and fill it with fresh baked muffins."); 
		quest::summonitem(17881);
		}
	if($text=~/willing to travel/i)
		{
		quest::say("If you happen to travel to the continent of Antonica, look up a centaur by the name of Jarlen Meadowgreen. He is an excellent baker and his bread loaves are beyond compare. Tell him you are there to get a shipment of bread loaves and return his product to me. I'll make sure you are compensated for your efforts."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Oh, these look delicious! No doubt they were made with fresh fruit grown locally; I can tell by the aroma. You have quite a talent! Thank you so much. Here is your payment. This should be enough to last me for a little while.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::MerchantSetItem(54146, 13014, 20);
		quest::faction(276,2); #Kelethin Merchants
		quest::faction(246,1); #Faydark Champions
		quest::faction(326,1); #Emerald Warriors
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Excellent, I see you made it back safely. Thank you so much, here is your payment as promised. Now I can get back to business as usual.");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::faction(276,4); #Kelethin Merchants
		quest::faction(246,1); #Faydark Champions
		quest::faction(326,1); #Emerald Warriors
		}
	}

#END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub 
