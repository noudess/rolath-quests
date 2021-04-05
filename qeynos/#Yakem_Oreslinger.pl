#Yakem_Oreslinger.pl
#Restock High Quality Ore (South Qeynos)

sub EVENT_SAY 
	{
	if($text=~/Hail/i)   
		{
		quest::say("Greetings friend $name! I am a provider of the highest quality steel ore known to Norrath! This ore is in such demand that I often run low and find it difficult to restock my supplies. If you're [looking for a job] I will gladly pay you for some of your time.");
		}

	if($text=~/looking for a job/i)   
		{
		quest::say("I need you to take this crate and fill it with either Small Bracks of Unrefined Ore or Large Bricks of Unrefined Ore then return it to me so that I may refine it and sell it. The unrefined ore that I require is often mined by the goblins in the ruins of Permafrost Keep.");
		quest::summonitem(17814);#Empty Ore Crate 
		}
	}

sub EVENT_ITEM 
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	$h = $npc->GetHeading();
	
	if (plugin::check_handin(\%itemcount, 10952 => 1)) 
		{#Small Shipment of High Quality Ore 
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		quest::faction(121, 4);#Some Qeynos Citizen faction.
		#Random amount of money
		my $pp = int(rand(28));
		quest::givecash(0, 0, 0, $pp);
		#Spawn the one with hq ore
		quest::ding();
		quest::exp(2000);
		if (quest::MerchantCountItem(1304, 10468) < 50)
			{
			quest::MerchantSetItem(1304, 10468, 50);
			}
		if (quest::MerchantCountItem(1304, 10469) < 100)
			{
			quest::MerchantSetItem(1304, 10469, 100);
			}
		if (quest::MerchantCountItem(1304, 10480) < 200)
			{
			quest::MerchantSetItem(1304, 10480, 200);
			}
		}
	elsif (plugin::check_handin(\%itemcount, 10953 => 1)) 
		{#Large Shipment of High Quality Ore 
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		quest::faction(121, 4);#Some Qeynos Citizen faction.
		#Random amount of money
		my $pp = int(rand(88));
		quest::givecash(0, 0, 0, $pp);
		#Spawn the one with hq ore
		quest::ding();
		quest::exp(4000);
		if (quest::MerchantCountItem(1304, 10468) < 75)
			{
			quest::MerchantSetItem(1304, 10468, 75);
			}
		if (quest::MerchantCountItem(1304, 10469) < 150)
			{
			quest::MerchantSetItem(1304, 10469, 150);
			}
		if (quest::MerchantCountItem(1304, 10480) < 300)
			{
			quest::MerchantSetItem(1304, 10480, 300);
			}
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
}

#End of File zone:qeynos ID: 1030-- #Yakem_Oreslinger.pl
