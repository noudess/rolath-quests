sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 3)
		{
		quest::say("When is Lomarc getting back from Odus? He was supposed to be back three nights ago. Have you heard anything?");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(2074, 3, 1);
			}
		}
	if ($wp == 4)
		{
		quest::say("Hanns, you are not going to want to hear this, but one of our boys in Donovan's gang swears he saw Stanos in the Karanas a week ago. And we still haven't cornered Malka Rale.");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(2074, 4, 1);
			}
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
		quest::say("Ok, I'll send someone out to meet [Lomarc] behind the [Mermaid's Lure] tonight.");
		}
	if ($signal == 2)
		{
		quest::say("Very well, Father is as good as dead. Did I ever mention that I really hate family reunions? <chuckle>. I am gone!");
		}
	}


sub EVENT_SAY
	{
	my $circlef = $client->GetModCharacterFactionLevel(223);

	# She won't even answer the hail nicely below indifferent
	if ($faction > 6)
		{
		quest::say("Heh... With all you've done, I'm surprised you're still alive.");
		}
	# She will answer hails politely at Apprehensive and better
	elsif ($text =~ /Hail/i)
		{
		quest::say("You need something. or are you just browsing?");
		}
	# She will still reject	harshly anything else at Apprehensive
	elsif ($faction > 5)
		{
		quest::say("Heh... With all you've done, I'm surprised you're still alive.");
		}
	# She warms up to questions between 1 and 49
	elsif ($circlef < 50)
		{
		quest::say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		}
	elsif ($text =~ /Lomarc/i)
		{
		quest::say("Lomarc? He's a small time smuggler who runs from here to Odus. He got sloppy this last run, and now the guards are onto him. We need to have someone [meet him] behind the Mermaid's Lure tonight to pick up a package.");
		}
	elsif ($text =~ /meet/i)
		{
		quest::say("Hmm, you think you can handle it? Eh, Lomarc is nothing but a two-bit smuggler anyways. Take this payment to him for the package, and don't let him give you any grief. Got it?");
		quest::summonitem(18793);    #Lomarc's payment
		}
	}

sub EVENT_ITEM
	{
	my $circlef = $client->GetModCharacterFactionLevel(223);

	if ($circlef > 49 && plugin::check_handin(\%itemcount, 13716 => 1))
		{
		quest::say("Yes, I see you aim to please. I hope you gave Lomarc the payment that he deserved? Heh, that punk had no idea of the value of this shipment. The emerald inside this doll will fetch a pretty penny from those greedy merchants");

		# Faction vefrified to Zam
		quest::faction(223, 30);    #Circle of Unseen Hands
		quest::faction(291, -4);    #Merchants of Qeynos
		quest::faction(230, 4);     #Corrupt Qeynos Guards
		quest::faction(262, -4);    #Quards of Qeynos
		quest::faction(273, 4);     #Kane Bayle
		quest::exp("1000");
		quest::ding();
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:qeynos2  ID:2020 -- Renux_Herkanor
