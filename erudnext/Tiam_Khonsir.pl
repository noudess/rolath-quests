sub EVENT_SAY 
	{
	$knightsfaction=$client->GetModCharacterFactionLevel(242);

	if($text=~/hail/i) 
		{
		quest::say("Greetings, $name. Are you a follower of our order, the Deepwater Knights, servants of the Ocean Lord, Prexus?");
		}
	elsif($text=~/yes/i) 
		{
		quest::say("That is good, $name. Our followers are few but our faith is strong. With the efforts of those few, our destiny may be reached in time. We must walk with perseverence and devotion, much like the tides that, over time, can destroy a mighty stone cliff. Have you [come to serve our Lord], $name?");
		}
	# somewhere in dubious range, took a guess
	elsif ($knightsfaction > -200)
		{
		if($text=~/come to serve/i) 
			{
			quest::say("Then I shall send you on a quest to prove your devotion. No doubt you have seen the vermin kobolds scuttling about the land as fleas upon a mangy dog. The kobolds have a lair on our continent from which they launch their wantonly destructive raids. You are to enter that lair and destroy as many of these dogs as you can. For each molar you bring me, you will receive praise, admiration, and perhaps some coin.");
			}

		if($text=~/quest of greater importance/i)
			{
			quest::say("Very well then, $name, you may be able to help us. Go to Breya and tell her I sent you. She will brief you.")
			}
		}
	else
		{
		plugin::reject_say();
		}
	}

sub EVENT_ITEM 
	{
	$knightsfaction=$client->GetModCharacterFactionLevel(242);

	if($knightsfaction > -200 && $itemcount{1761} > 0)
		{
		plugin::mass_handin(1761, 1, \&MolarReward);
		quest::say("Wonderful work, friend $name. One less land dwelling, flea ridden, primitive for our wondrous lord to sweep aside when the apocalypse is upon us. Here is your reward. Perhaps if you gather enough molars, we can offer you a [quest of greater importance].");
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}

sub MolarReward
	{
	my $random_result = int(rand(7));

	if($random_result == 1) 
		{
		quest::summonitem(plugin::RandomRange(3101, 3112));
		}

	# Factions and XP verified on live
	quest::faction(266,1); # High Council of Erudin
	quest::faction(265,-1);# Heretics
	quest::faction(242,7);  # Deepwater Knights
	quest::ding();
	quest::exp(200);
	quest::givecash(2,7,6,0);
	}

#END of FILE Zone:erudnext  ID:98051 -- Tiam_Khonsir
