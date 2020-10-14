sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i) 
		{
		quest::say("I am Vilissia, chosen of Solusek Ro.  I am a practitioner in the Wizardly arts, and keeper of lore for the [Runescale Cloak], [Tishans Kilt] and the [Acumen Mask].");
		}
	elsif($text=~/runescale cloak/i) 
		{
		quest::say("The Runescale cloak is a wonderful item of defense for any Wizard.  Are you [interested in the cloak]?");
		}
	elsif($text=~/interested in the cloak/i) 
		{
		quest::say("I can assemble for you a Runescale Cloak � but you will need to bring me the necessary components.  I will need a Lizardscale Cloak from the Feerrott and the three Runes of Scale.  All three can be found on Crocodiles � Saltwater Crocodiles in the Caverns of Guk, Deepwater Crocodiles in the Oasis of Marr and Firescale Crocodiles in the mountains of Lavastorm.  Bring me these items, and I will make for you a Runescale Cloak.");
		}
	elsif($text=~/tishans kilt/i) 
		{
		quest::say("Tishan was once counted among the mightiest of wiards � and his items are items of power.  If you are interested in acquiring Tishans Kilt, you must take a Shadowed Ball from our mortal enemies the Shadowed Men and bring it to Trankia in the Everfrost Mountains.");
		}
	elsif($text=~/acumen mask/i) 
		{
		quest::say("The Acumen Mask, as its name suggests, confers to its wearer certain powers of insight and knowledge. I can make an Acumen Mask for you, but you will need to bring me the proper components. I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Greater Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears. Bring me these four items, and I will make for you an Acumen Mask.");
		}
	elsif($text=~/interested in the mask/i) 
		{
		quest::say("I can make for you an Acumen Mask, but you will need to bring me the proper components.  I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears.  Bring me these four items, and I will make for you an Acumen Mask.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		#mask
		if(($itemcount{2352} == 1) && ($itemcount{2368} == 1) && ($itemcount{10558} == 1) && ($itemcount{2367} == 1)) 
			{
			quest::say("Mask, patch, skull and mask. All of the items necessary for me to make an acumen mask. Excellent. All praise Solusek Ro!");
			quest::summonitem(2366);
			# Faction verified per Zam
			quest::faction(415,"10");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		#cloak
		if(($itemcount{2332} == 1) && ($itemcount{10553} == 1) && ($itemcount{10554} == 1) && ($itemcount{10555} == 1)) 
			{
			quest::say("You impress me, adventurer! I had not expected you to return with all of the runes. Very well, I shall keep my half of the bargain. Here is your runescale cloak.");
			quest::summonitem(2364);
			quest::faction(415,"1");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		#lambent stone
		if(($itemcount{10035} == 2) && ($itemcount{10000} == 1)) 
			{
			quest::say("Here is your prize - a lambent ruby.");
			quest::summonitem(10118);
			# Factions per Zam
			quest::faction(415,"1");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		#vulcanized platinum
		if($itemcount{16507} == 1) 
			{
			quest::say("I see that Gavel has sent you to me.  Very well, I have vulcanized your platinum bar - take it.");
			# No faction per zam
			quest::summonitem(19048);
			quest::ding();
			}
		}
	}

# Quest by mystic414

