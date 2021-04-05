sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings to you. It seems we have a bit of a food shortage. I'm afraid I may be out of certain supplies. However, King Thex in his benevolent wisdom has authorized us merchants to look to the Teir`Dal and those friendly to our causes for assistance with this matter. Would you be [willing to assist] us?"); }
		}
	if($text=~/assist/i)
		{
		quest::say("Very well. There are two ways you may help us to keep our supplies stocked. If you are a [baker] you may use your skills to personally keep our supplies maintained at acceptable levels. If you are willing to travel then you can help us keep the supply lines open by personally delivering [food shipments]. You will be compensated in either case."); 
		}
	if($text=~/baker/i)
		{
		quest::say("We could use a baker to resupply us with [muffins]."); 
		}
	if($text=~/muffins/i)
		{
		quest::say("You look a bit dim, so I'll be clear.  Take dis crate and fill it with muffins, then seal it up and bring the full crate bak to me. Don't try buying some, I want fresh baked muffins."); 
		quest::summonitem(17881);
		}
	if($text=~/food shipments/i)
		{
		quest::say("An adventurous sort, very good. Then travel to the Southern Plains of Karana and locate the centaur baker there. He has a large supply of grain and we have been authorized to secure shipments of bread loaves from this individual. Tell him you are there to secure of shipment of bread loaves for the people of Neriak. You shall be compensated upon your return."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("'Very good work. I can see you are a talented baker and these muffins look suitable. You do Neriak a great service. Here is your payment. I look forward to conducting future business with you.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::MerchantSetItem(47144, 13014, 20);
		quest::faction(236,1); #Dark Bargainers
		quest::faction(334,2); #Dreadguard Outer
		quest::faction(370,1); #Dreadguard Inner
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("You have returned and none too soon! Thank you very much, I will put this bread on sale immediately. Here is your reward as promised. Thank you very much.");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::faction(236,1); #Dark Bargainers
		quest::faction(334,2); #Dreadguard Outer
		quest::faction(370,1); #Dreadguard Inner
		}
	}

#END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub 

 
