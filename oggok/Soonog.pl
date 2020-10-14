sub EVENT_SPAWN 
	{
	  $x = $npc->GetX();
	  $y = $npc->GetY();
	  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}

sub EVENT_ENTER 
	{
	if(plugin::check_hasitem($client, 18789)) 
		{ 
		$client->Message(15,"You have entered what appears to be the guild hall of the Greenbloods. A large, brutish Ogre seems to be annoyed by your appearance. 'Wut? Where you come from? Oh, you here to trane? Read note in inventory and then hand to me to start. Me make you strong Greenblood sum day!'");
		}
	}

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("You [Greenblood]?");
		}
	if ($faction > 4)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif ($text=~/greenblood/i) 
		{
		quest::say("Good, you mine.  We tuffest, bestest, scariest warriors in da Norrath.  Not like dem wimpy Craknek hoomie wannabees.  You Greenblood, you my toy.  You lives or dies at my will.  Go, brings me many lizard meats cause I Greenblood leader and I berry hungry lots.  So hungry dat I eats four lizards.  Go bring meat or I eats you.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18789 => 1)) 
		{
		quest::say("Soonog own you now.. fight for Soonog.. Soonog make you strong.. When you ready for task you tell Soonog.  Soonog army rule all!! You return to me when you stronger, I teach you many things I know.");
		quest::summonitem(13527); #Green Stained Skin Tunic
		#factions verified on live
		quest::faction(261,100);  # Green Blood Knight
		quest::faction(228,50);   # Clurg
		quest::faction(312,-15); # Storm Guard
		quest::faction(308,-15); # Shadowknight of Night Keep
		quest::exp(100);
		quest::ding();
		}
	elsif ($faction <= 4 && plugin::check_handin(\%itemcount, 13410 => 4)) 
		{
		quest::say("Small meats but is good nuff.  You take dis and go kill eberyting.  Make all scared of da Greenblood knights.  You get ready for next inb.. ins.. invat.. you get ready for next war.  You learning stuff, you come bak here and me teach you more Greenblood stuf so we be more tuffest.");
		quest::summonitem(5023);
		# XP verified Faction verified on ZAM
		quest::faction(261,5);  # Green Blood Knight
		quest::faction(228,2);   # Clurg
		quest::faction(312,-1); # Storm Guard
		quest::faction(308,-1); # Shadowknight of Night Keep
		quest::exp(50);
		quest::ding();
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:oggok  ID:49035 -- Soonog
