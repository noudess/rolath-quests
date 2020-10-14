sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 16) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 43) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
  if($wp == 70) {
    quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
}


sub EVENT_SAY 
	{
	# Factions correct as per live.
	if ($faction >=7)
		{
		quest::say("Wha?  Another talking rat?  Your reputation with the merchants in this town has put a price on your head....begone, before I decide to collect!");
		}
	elsif ($text=~/hail/i) 
		{
		quest::say("Oh, hey there.. How ya doing? My name's Den. I work for ol' [Rohand] here, unloading the [shipments] that come in from overseas.");
		}
	elsif ($text=~/Rohand/i) 
		{
		quest::say("Ol' Captain Rohand is the owner of the Mermaid's Lure. He trades goods with sailors and sea [merchants]. I think that old man was even born at sea.. And he's got more stories than fish have scales.");
		}
	elsif ($text=~/shipments/i) 
		{
		quest::say("Yeah.. We get merchants and traders with goods from here to [Odus].");
		}
	elsif ($text=~/merchants/i) 
		{
		quest::say("Yeah.. We get merchants and traders with goods from here to [Odus].");
		}
	elsif ($text=~/Odus/i) 
		{
		quest::say("Odus? I've never been there, but I hear it's a long journey.");
		}
	elsif ($text=~/black scroll sheets/i) 
		{
		quest::say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
		}
	}

sub EVENT_ITEM 
	{
	if($gold >= 2)
		{
		quest::say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		quest::summonitem(18006);
		# Validated
		quest::faction(223,1);
		quest::faction(291,-1);
		quest::faction(230,1);
		quest::faction(262,-1);
		quest::faction(273,1);
		quest::exp(200);
		quest::ding();
		}
	elsif ($faction <= 4 && plugin::check_handin(\%itemcount, 13784 => 1)) 
		{
		# Need somewhere mid-amiable - just went with amiable for our purposes
		quest::say("All right, I'll make sure this gets put on the next boat to Erudin. But now, I need a favor of you. Since I'm stuck here working the docks all day, I need someone to run out to Qeynos Hills and bring me back various pelts and skins. I got a customer in Odus who is trying to get a new shop started, and he needs some samples. Bring me back some snake scales, a high quality bear skin, a high quality wolf skin, and some bat fur. Make sure the quality is good, I can't send him rags.");
		# Faction verified on live
		quest::ding();
		quest::faction(291,-1);
		quest::faction(223,10);
		quest::faction(230,1);
		quest::faction(273,1);
		quest::faction(262,-1);
		quest::exp(200);
		}
	elsif ( plugin::check_handin(\%itemcount, 13070 => 1) &&
		plugin::check_handin(\%itemcount, 13752 => 1) &&
		plugin::check_handin(\%itemcount, 13755 => 1) &&
		plugin::check_handin(\%itemcount, 13069 => 1)
	  ) 
		{
		quest::say("Great... Hopefully he will like these samples, and order a lot more from me. Here's some gold for your efforts. Also, could you pass this note on to Ghil next time you talk to him? Thanks again.");
		quest::ding();
		# verified on live
		quest::faction(291,-3);
		quest::faction(223,20);
		quest::faction(230,3);
		quest::faction(273,2);
		quest::faction(262,-3);
		quest::summonitem(18796);
		quest::exp(200);
		}
	else
	{
	plugin::return_items(\%itemcount);
	}
	}
