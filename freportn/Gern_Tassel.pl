sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome! Why don't you browse through my selection of fine goods and pick out some things you like $name?");
		}
	if($text=~/baker/i)
		{
		quest::say("You are a baker?  I could use a new supply of [muffins]. Or maybe you would travel to South Karana for a [shipment of bread]?"); 
		}
	if($text=~/muffins/i)
		{
		quest::say("Take this crate and fill it with fresh baked muffins."); 
		quest::summonitem(17881);
		}
	if($text=~/shipment of bread/i)
		{
		quest::say("Ok, find the centaur named Meadowgreen.  His bread is the best I have tasted."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("These are quality muffins! You are obviously quite a skilled baker. Here is your payment as promised. Now I can get back to business again.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::MerchantSetItem(8014, 13014, 20);
		quest::faction(229,2); #Coalition of Tradefolk
		quest::faction(281,2); #Knights of Truth
		quest::faction(291,1); #Merchants of Qeynos
		quest::faction(336,2); #Coalition of Tradefolk Underground
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Thanks for the bread!!");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::faction(229,4); #Coalition of Tradefolk
		quest::faction(281,4); #Knights of Truth
		quest::faction(291,1); #Merchants of Qeynos
		quest::faction(336,4); #Coalition of Tradefolk Underground
		}
	}

#END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub 
