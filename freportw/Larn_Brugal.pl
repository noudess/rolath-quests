sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Good day to you $name! I hope you yearn to become a Steel Warrior as we all are here in the Bunker. We are in need of more recruits to continue the [war].");
		}
	elsif($text=~/war/i) 
		{
		if ($faction > 5)
			{
			quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!");
			}
		elsif ($faction == 5)
			{
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			}
		else
			{
			quest::say("The war I speak of is the one we Steel Warriors have sworn to wage agianst [Clan Deathfist] in the Commonlands. We are doing a fine job but we require more weapons. We are expecting a shipment of blades from Groflahs Forge. We require a warrior of the bunker to [get our shipment]. Maybe you.");
			}
		}
	elsif($text=~/clan deathfist/i) 
		{
		quest::say("If you do not know of Clan Deathfist go ask Cain who they are. He will not only tell you he will sign you up to help fight our war!");
		}
	if($faction < 5 && $text=~/shipment/i) 
		{
		quest::say("We would be most thankful for your service. Please take this voucher over to Groflah at Groflahs Forge in North Freeport. He will give you the shipment of weapons.");
		quest::summonitem(18820);
		}
	}

sub EVENT_ITEM 
	{
	if($faction < 5 && plugin::check_handin(\%itemcount, 12241 => 1, 12242 => 1, 12243 => 1, 12244 => 1)) #Raw Short Sword 1-4
		{
		quest::say("Good work, $name. The bunker shall be well stocked. Here you are, my friend. Take this raw blade. You can take it to Groflah - he will sharpen and polish it for you. It should be a formidable weapon.");
		quest::ding();
		quest::exp(500);
		quest::givecash(0,6,0,0);
		# Factions Verified
		quest::faction(311,20);
		quest::faction(262,4);
		quest::faction(230,-3);
		quest::faction(330,-3);
		quest::faction(281,4);
		quest::summonitem(13918); #Raw Short Sword
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:freportw  ID:9113 -- Larn_Brugal
