sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("May the fires of Solusek Ro warm your innards! I am Gavel the Temperant. I work with Sister Blaize to forge the most elegant finery for clerics known to man or beast. Because we have no need for material wealth here in the temple, we ask that you retrieve [ingots and icons] from the lost or fallen brothers and sisters of our order. When mixed with some enchanted, [galvanized], [vulcanized], or [magnetized] platinum into an alloy, the items I can forge are splendid indeed!");
		}
	elsif ($text =~ /ingots and icons/i)
		{
		quest::say("The ingots and icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [reverent], the [constant], and the [devout].");
		}
	elsif ($text =~ /reverent/i)
		{
		quest::say("Regis the Reverent fell in love with a gypsy girl named Lianna Ferasa who lives in the Rathe Mountains. Ask her what has become of him. Bring me the ingot of the Reverent, the icon of the Reverent, and two enchanted platinum bars and I will forge them into a reward for you.");
		}
	elsif ($text =~ /constant/i)
		{
		quest::say("Althuryn the Constant was brutally slain by two aqua goblins. The one called Sludge fled to Runnyeye. The one called Dwigus lives in Dagnor's Cauldron. Bring me the ingot of the Constant, the icon of the Constant, and two galvanized platinum bars and I will forge them into a reward for you.");
		}
	elsif ($text =~ /devout/i)
		{
		quest::say("Nebbletob the Devout was once a slave in the mines of Meldrath. The Minotaur Sentry there was particularly cruel to him. He was in the expedition to Everfrost when Brother Theo drowned. When trying to rescue Theo, he came upon some caves under the river. He also narrowly escaped death when a great white beast attacked him. He never saw what the beast was, but it shredded his pack where he kept his icon. Bring me the ingot of the Devout, the icon of the Devout, and two vulcanized platinum bars and I will forge them into a reward for you.");
		}
	elsif ($text =~ /galvanized/i)
		{
		quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
		}
	elsif ($text =~ /vulcanized/i)
		{
		quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
		}
	elsif ($text =~ /magnetized/i)
		{
		quest::say("Enchanted platinum bars can be galvanized by Genni, vulcanized by Vilissia, and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
		}
	elsif ($text =~ /underfoot/i)
		{
		quest::say("What do you know of Underfoot?  I have not been to Kaladim in years.  I can't even say those I know there still live.  I once had the glory of owning quite a weapon which was under their blessing.  A mighty [polearm] of magnificent craftsmanship.");
		}
	elsif ($text =~ /polearm/i)
		{
		quest::say("Called the Holy Partisan it was.  It was my most treasured belonging.  Very few were said to ever have been forged.  I myself spent years polishing and honing the blade's edges, and I perfected a way to increase the weapon's power two-fold by using the metal from another [mighty blade] to strengthen it.");
		}
	elsif ($text =~ /mighty blade/i)
		{
		quest::say("Yes, a blade from the depths of runnyeye.  A two handed weapon.  If I had one of each, I could perform the merge again.  I would enjoy the short view into the past such an activity would provide me.  Alas, the Partisan is no longer in my possession, destroyed in a battle years ago. So I will never get such an opportunity again.");
		}
	elsif ($text =~ /recharge/i)
		{
		my $item_id = 232631;
		my $item_link = quest::varlink($item_id);
		my $recharge_link = quest::saylink("recharge", 1);
		my $slot_id = $client->GetInventory()->HasItem($item_id);

		if ($slot_id == -1) 
			{
			quest::whisper("You do not have the $item_link.");
			}
		else
			{
			my $item = $client->GetItemAt($slot_id);
			my $charges = $item->GetCharges();
			my $max_charges = quest::getitemstat($item_id, "maxcharges");
			if ($charges == $max_charges) 
				{
				quest::whisper("Your $item_link is already fully charged.");
				}
			else
				{
				my $is_attuned = $item->IsAttuned() ? 1 : 0;

				my @augment_item_ids = $client->GetAugmentIDsBySlotID($slot_id);
				my %item_data = (
				"item_id"       => $item_id,
				"charges"       => $max_charges,
				"augment_one"   => $augment_item_ids[0],
				"augment_two"   => $augment_item_ids[1],
				"augment_three" => $augment_item_ids[2],
				"augment_four"  => $augment_item_ids[3],
				"augment_five"  => $augment_item_ids[4],
				"augment_six"   => $augment_item_ids[5],
				"attuned"       => $is_attuned,
				"slot_id"       => $slot_id
				);

				$client->DeleteItemInInventory($slot_id);

				$client->AddItem(\%item_data);

				quest::whisper("Your $item_link is now recharged.");
				}
			}
		}
	}

sub EVENT_ITEM
	{
	#:: Match two 16507 - Enchanted Platinum Bar, a 19010 - Icon of the Reverent, and a 19009 - Ingot of the Reverent
	if (plugin::takeItems(16507 => 2, 19010 => 1, 19009 => 1))
		{
		quest::say("Wear this with pride!");

		#:: Give a 4925 - Bracers of the Reverent
		quest::summonitem(4925);
		quest::ding();
		}

	#:: Match two 16507 - Enchanted Platinum Bar, a 19016 - Icon of Sacrament, and a 19015 - Ingot of Sacrament
	elsif (plugin::takeItems(16507 => 2, 19016 => 1, 19015 => 1))
		{
		quest::say("It is an honor to forge such a weapon. Wield it with pride!");
		#:: Give a 6407 - Caduceus of Sacrament
		quest::summonitem(6407);
		quest::ding();
		}

	#:: Match two 19047 - Galvanized Platinum Bar, a 19011 - Ingot of the Constant, and a 19012 - Icon of the Constant
	elsif (plugin::takeItems(19047 => 2, 19011 => 1, 19012 => 1))
		{
		quest::say("Wear this with pride!");

		#:: Give a 4926 - Chestplate of the Constant
		quest::summonitem(4926);
		quest::ding();
		}

	#:: Match two 19048 - Vulcanized Platinum Bar, a 19013 - Ingot of the Devout, and a 19014 - Icon of the Devout
	elsif (plugin::takeItems(19048 => 2, 19013 => 1, 19014 => 1))
		{
		quest::say("Wear this with pride!");

		#:: Give a 9427 - Shield of the Devout
		quest::summonitem(9427);
		quest::ding();
		}

	#:: Match a partisan of the underfoot and a blacked alloy bastard sword
	elsif (plugin::takeItems(5376 => 1, 3616 => 1))
		{
		quest::say("The holy partisan!!!!  I cannot believe you found one!  And you brought the blade from the goblin lair...");
		quest::emote("stands quietly in shock and wonder");
		quest::say("Yes.  I can recall the process.  I will merge these two and create for you a weapon noone but myself has ever wielded.");

		quest::summonitem(232631);

		quest::say("Take this before I decide to keep it.  If you ever require it to be recharged, return it to me with an acceptable form of payment and I will return it to it's full strength.");

		quest::ding();
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
