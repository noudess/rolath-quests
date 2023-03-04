sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome! Why don't you browse through my selection of fine goods and pick out some things you like $name?  You wouldn't happen to be a [baker] would you?"); 
		}
	if ($text =~ /baker/i)
		{
		quest::say("Maybe you can help me restock, I am running low on fresh baked goods. You could help me out by restocking my [muffin supply]. Or if you don't mind a little travel, you can pick up a [shipment of bread] for me.");
		}
	if ($text =~ /muffin supply/i)
		{
		quest::say("Take this crate and fill it with muffins, then seal it up and bring the Full Muffin Crate back to me. Don't go trying to pass off that store bought stuff on me either, I need fresh baked muffins. The ones in the stores are already too old and will get moldy too fast, so I don't want those.");
		quest::summonitem(17881);
		}
	if ($text =~ /shipment of bread/i)
		{
		quest::say("Somewhere in the plains to the south is one heck of a baker who makes some quality bread. Go look him up and tell him you want a bag of bread loaves. He's one of those fellas that goes by the name of Meadowgreen.");
		}
	}

sub EVENT_ITEM
	{

	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		# Factions from ZAM
		quest::say("Oh, these look delicious! No doubt they were made with fresh fruit grown locally; I can tell by the aroma. You have quite a talent! Thank you so much. Here is your payment. This should be enough to last me for a little while.");
		quest::faction(276, 2);	#Kelethin Merchants
		quest::faction(246, 1);	#Faydarks Champions
		quest::faction(326, 1);	#Emerald Warriors
		quest::givecash(0, 4, 2, 0);
		$client->AddLevelBasedExp(4, 14);
		quest::MerchantSetItem(54145, 13014, 20);
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Ahhh fresh bread! Here is your payment.");

		# Factions from ZAM
		quest::faction(276, 4);	#Kelethin Merchants
		quest::faction(246, 1);	#Faydarks Champions
		quest::faction(326, 1);	#Emerald Warriors
		quest::givecash(0, 0, 6, 1);
		$client->AddLevelBasedExp(4, 14);
		}
	}

