sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
    	quest::say("Welcome back, $name. Why don't you purchase a few things before you head out into the tundra again?");
		}
	if($text=~/baker/i)
		{
		quest::say("Great, you can help me restock. Help me restock my [muffins]? Or maybe bring us a [shipment of bread]."); 
		}
	if($text=~/muffins/i)
		{
		quest::say("Take dis crate and fill it with hand crafted muffins.  They are much better than store bought."); 
		quest::summonitem(17881);
		}
	if($text=~/shipment of bread/i)
		{
		quest::say("Far away in the Southern Plains of Karana a centaur named Meadowgreen makes the best bread. If you were to get some for us, it sure would help."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Oh, yes, this is exactly what I needed. These muffins look very fresh too, good work! Here is your payment, as promised. It was a pleasure doing business with you.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::MerchantSetItem(29038, 13014, 20);
		#Factions per ZAM, quest not active on live
		quest::faction(328,2); #Merchants of Halas
		quest::faction(320,1); #Wolves of the North
		quest::faction(327,1); #Shamen of Justice
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Fresh Bread!  Thank you!");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::faction(328,4); #Merchants of Halas
		quest::faction(320,1); #Wolves of the North
		quest::faction(327,1); #Shamen of Justice
		}
	}

#END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub 


