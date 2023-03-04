sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hullo? Buy sum of my stuffs.  I gots [problem] wid short suppliez."); 
		}
	if($text=~/problem/i)
		{
		quest::say("Da problem is dat weeze running low on fresh [muffins] and weeze also low on [loaves of bread]. Tink you can help us?"); 
		}
	if($text=~/muffins/i)
		{
		quest::say("You take dis crate and fill it with muffinz, den seal it up and bring da full crate bak to me. Don't you tink you can go buy dat store stuff either, I wants fresh baked muffinz.  Da store ones too old and will gets moldy too fast, den I have to toss out.  Da make me very unhappy wid you!"); 
		quest::summonitem(17881);
		}
	if($text=~/loaves of bread/i)
		{
		quest::say("You go to plains of Karana and luk for da Meadowgreen dat is baker. You tells him dat you there to get Bread Loaves for us. Weeze pay you when you get back. Tanks."); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Nice muffins, very stinky. Weeze tank you. Here some money. Weeze need more muffins later. You check back again sum time.");
		quest::givecash(0,8,0,0);
		$client->AddLevelBasedExp(4, 14);
		quest::faction(338,2); #Merchants of Ogguk
		quest::faction(228,1); #Clurg
		quest::faction(337,1); #Ogguk Guards
		quest::MerchantSetItem(49063, 13014, 20);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("You nice for getting bread loaves for us. You take some money. Weeze happy now dat weeze got more bread for sale. You maybe check back later if weeze run out of bread again");
		quest::givecash(0,0,3,1);
		$client->AddLevelBasedExp(4, 14);
		quest::ding();
		#Factions per ZAM (assumed to be same as muffins), quest not active on live
		quest::faction(338,4); #Merchants of Ogguk
		quest::faction(228,1); #Clurg
		quest::faction(337,1); #Ogguk Guards
		}
	}

