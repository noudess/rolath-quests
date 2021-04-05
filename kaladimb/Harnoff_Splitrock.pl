#kaladimb\Harnoff_Splitrock.pl
#
#Quest: Restock High Quality Ore (North Kaladim)
#
#To Do:
#Allow NPC to "run out" of ore
#Restock NPC with ore

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Greetins to ya friend Dwarf! I've got some of the finest quality steel ores in all the lands! It's a bit troublesome ta keep a large enough supply of it though, it bein sought after by every smith ya know. If you're needin some cash or ore how bout you [run an errand] fer me?");
		}
	if ($text =~ /run an errand/i)
		{
		quest::say("I was hopin you'd be up fer the job! Take this here crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore and I'll pay ya when ye return.");
		quest::summonitem(17814);    #Empty Ore Crate
		}
	}

sub EVENT_ITEM
	{

	if (plugin::check_handin(\%itemcount, 10952 => 1))
		{                            #Small Shipment of High Quality Ore
		quest::exp(2000);
		quest::ding();
		# Factions assumed to be same as large
		quest::faction(274, 1);         #Kazon Stormhammer
		quest::faction(290, 4);         #Merchants of Kaladim
		quest::faction(322, -1);        #Miners Guild 628
		quest::faction(293, 1);         #Miners Guild 249
		quest::faction(312, 15);         #Storm Guard

		if (quest::MerchantCountItem(67057, 10468) < 50)
			{
			quest::MerchantSetItem(67057, 10468, 50);
			}
		if (quest::MerchantCountItem(67057, 10469) < 100)
			{
			quest::MerchantSetItem(67057, 10469, 100);
			}
		if (quest::MerchantCountItem(67057, 10480) < 200)
			{
			quest::MerchantSetItem(67057, 10480, 200);
			}

		quest::givecash(0, 0, 0, 14);
		}
	elsif (plugin::check_handin(\%itemcount, 10953 => 1))
		{                               #Large Shipment of High Quality Ore
		quest::exp(3500);
		quest::ding();
		# Factions verified on live
		quest::faction(274, 1);          #Kazon Stormhammer
		quest::faction(290, 4);          #Merchants of Kaladim
		quest::faction(322, -1);         #Miners Guild 628
		quest::faction(293, 1);          #Miners Guild 249
		quest::faction(312, 1);          #Storm Guard

		if (quest::MerchantCountItem(67057, 10468) < 75)
			{
			quest::MerchantSetItem(67057, 10468, 75);
			}
		if (quest::MerchantCountItem(67057, 10469) < 150)
			{
			quest::MerchantSetItem(67057, 10469, 150);
			}
		if (quest::MerchantCountItem(67057, 10480) < 300)
			{
			quest::MerchantSetItem(67057, 10480, 300);
			}

		quest::givecash(0, 0, 0, 44);
		}
	else
		{
		quest::say("I don't need this, $name.");
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:kaladimb  ID: -- Harnoff_Splitrock
