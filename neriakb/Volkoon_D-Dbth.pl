sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Yes yes what is it, I don't have time to chat with the likes of you!  Unless you are a [baker] then I suppose you can [help] out.");
		}
	if($text=~/baker/i)
		{
		quest::say("You look a bit dim, so I'll be clear.  Take dis crate and fill it with muffins, then seal it up and bring the full crate bak to me. Don't try buying some, I want fresh baked muffins."); 
		quest::summonitem(17881);
		}
	if($text=~/help/i)
		{
		quest::say("An adventurous sort, good.  Travel to the Southern Plains of Karana and locate the centaur baker there. Tell him you are there to secure of shipment of bread loaves for the people of Neriak, and he better help out. You will be compensated upon your return, assuming you manage to return in a timely mannor."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("'Very good work. I can see you are a talented baker and these muffins look suitable. You do Neriak a great service. Here is your payment. I look forward to conducting future business with you.");
		quest::givecash(0,8,0,0);
		quest::MerchantSetItem(41059, 13014, 20);
		quest::faction(236,2); #Dark Bargainers
		quest::faction(334,1); #Dreadguard Outer
		quest::faction(370,1); #Dreadguard Inner
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("You have returned and none too soon! I will put this bread on sale immediately. Here is your reward as promised. The citizens of Neriak thank you, I can't waste the time.");
		quest::givecash(0,0,3,1);
		quest::faction(236,4); #Dark Bargainers
		quest::faction(334,1); #Dreadguard Outer
		quest::faction(370,1); #Dreadguard Inner
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		}
	}
