sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Huh? Oh hi $name. Youse want to buy sumthin?  Or maybe youz a [baker]?"); 
		}
	if($text=~/baker/i)
		{
		quest::say("Gud, you help me restock. You helps me out by restocking my [muffinz]. Or you go findz da guy wid da gud bread loaves and bring mez a [shipment of bread]."); 
		}
	if($text=~/muffin/i)
		{
		quest::say("You take dis crate and fill it with muffinz, den seal it up and bring da full crate bak to me. Don't you tink you can go buy dat store stuff either, I wants fresh baked muffinz.  Da store ones too old and will gets moldy too fast, den I have to toss out.  Da make me very unhappy wid you!"); 
		quest::summonitem(17881);
		}
	if($text=~/shipment of bread/i)
		{
		quest::say("You go to da south plains and find da Meadowgreen guy.  He is very gud baker and we wantz his bag of bread loaves.  You go tell him dat, get movin!"); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Mmm, dez look like gud muffinz. Here's sum money. Tanks. Now meez all stocked again.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::MerchantSetItem(47144, 13014, 20);
		quest::faction(228,1); #Clurg
		quest::faction(338,2); #Merchants of Ogguk
		quest::faction(337,1); #Ogguk Guards
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("You take some money. Weeze happy now dat weeze got more bread for sale. You maybe check back later if weeze run out of bread again.");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		quest::faction(228,1); #Clurg
		quest::faction(338,4); #Merchants of Ogguk
		quest::faction(337,1); #Ogguk Guards
		}
	}

#END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub 

