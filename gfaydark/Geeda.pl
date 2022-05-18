sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Are not the woods of the Faydarks a lovely sight? Tunare has truly blessed us. It is unfortunate that the orcs of [Crushbone Citadel] have chosen to invade our lands.");
		}
	elsif ($text =~ /crushbone citadel/i)
		{
		quest::say("Within the Greater Faydarks can be found the entrance to Crushbone Citadel, home of the orcs. They have increased their raids on our lands. We do not know why. The High Elder of Kelethin has instructed us to keep tabs on the orcs' movements. Hmmm.. How would you like to [assist the scouts]?");
		}
	elsif ($faction > 4)
		{
		quest::say("The Scouts of Tunare have no quarrel with you,  but perhaps a few less Crushbone Orcs would prove your worth.  Then we shall speak.");
		}	
	elsif ($text =~ /will assist the scouts/i)
		{
		quest::say("We trust this operation to high standing rogues of the Scouts of Tunare. Easy it may be, but the reward is a scout cape. The scout cape is meant for Scouts of Tunare only. Have you [contributed to the Scouts' cause]?");
		}
	elsif ($text =~ /i have contributed to the scouts' cause/i)
		{
		quest::say("So we have heard. Here, then. Take this coin. Venture into Crushbone and find our scout, Kelynn. He is posing as a slave to gain information. He tries to work very close to an opening in a cave near the moats. Find this point and wait for him to appear. Give him the coin and he shall give you the information you are to return to me.");
		quest::summonitem(12184);
		}
	}

sub EVENT_ITEM
	{
	#do all other handins first, then let it do disciplines
	if ($faction < 5 && $itemcount{67702} == 1)
		{
		quest::say("Fine work. We are very grateful. Take this Scout Cape. May you use it to serve Kelethin.");
		quest::summonitem(2914);
		quest::faction(316, 20);
		quest::givecash(0,3,1,0);
		$client->AddLevelBasedExp(14,10);
		quest::ding();
		}
	else
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
		}
	}
