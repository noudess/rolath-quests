sub EVENT_SAY
	{
	if ($faction > 8)
		{
		plugin::reject_say();
		}
	elsif ($text =~ /hail/i)
		{
		quest::say("Please be very quiet. I am tracking a notorious poacher.");
		}
	elsif ($text =~ /call of flames/i)
		{
		quest::say("I suppose you would like to call the flame? I must know you are a dedicated forester before I would even consider teaching such a thing.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 20876 => 1))
		{
		quest::say("Ah, what do we have here? A letter? Hmm? Scented with a familiar fragrance too. You must have gotten this from Lily. I do wish I had more time to spend with her, for she is a very sweet girl. If she trusts you to deliver such a letter, I must ask you to do me a favor for me. Please take these eggs. They are a very rare species of albino rattlesnakes which were thought to have been extinct due to poachers who eat them as a delicacy and griffins which prey on them. If these eggs hatch there is hope for the species. I need you to deliver them to my master, Kithicor.");
		#Faction verified on live
		quest::faction(246, 5);     #Faydarks Champions
		quest::faction(279, 1);     #King Tearis Thex
		quest::faction(226, 1);     #Clerics of Tunare
		quest::faction(310, 1);     #Soldiers of Tunare
		quest::faction(234, -1);    #Crushbone Orcs
		quest::summonitem(20877);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 20878 => 1))
		{
		quest::say("This does speak highly of you, my friend, an award from Kithicor does not come easy. But I must see more of your skills before I can consider teaching you. Lily's brother Devin is my current pupil - I need you to gather some equipment for me so I can properly train him. I require the following items of you - a smoldering sash, an adamantine ring and a blade forged of electrum. I also need a favor. Take this credit slip to Aanina Rockfinder. She is a merchant from whom I purchased a gift for Lily; it should be ready by now.");
		quest::summonitem(20879);
		}
	if (plugin::check_handin(\%itemcount, 20881 => 1, 20880 => 1, 10151 => 1, 5408 => 1))
		{
		quest::say("You have done well. I sense the one I have been hunting in the distance. As your final test, you must track him down and destroy him.");
		quest::spawn2(15183, 139, 0, -800, -2712, 15.6, 276);
		quest::faction(246, 100);
		quest::faction(279, 25);
		quest::faction(226, 25);
		quest::faction(310, 25);
		quest::faction(234, -25);
		quest::exp(1204093);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 20882 => 1))
		{
		quest::say("You, $name, are a worthy forester. It brings me great pride to present you this scroll that I have only passed to the finest in all of Norrath. Now you, too, may call the flames.");
		quest::faction(246, 100);
		quest::faction(279, 25);
		quest::faction(226, 25);
		quest::faction(310, 25);
		quest::faction(234, -25);
		quest::summonitem(15691);
		quest::exp(1204093);
		quest::ding();
		}
	}
