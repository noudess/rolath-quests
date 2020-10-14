sub EVENT_SAY 
	{
	if ($faction > 7)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i)
		{
		quest::say("Hrrump?! Who you? $name? What you want with Lynuga? Me am out [collecting]. Leave me be!");
		}
	if($text=~/collecting/i)
		{
		#Lynuga's Gem Collection (START)
		quest::say("I collect all sort's of thing's. Gem's be my favorite. Me really like rubies. If you have ruby, give to me! Why you want to know? You want to steal my collection?!? I squish you if you do!!");
		}
	if($text=~/happy love bracers/i)
		{
		quest::say("'Happy love bracers! Dem ugly tings! Me gave dem to old flame in Neriak. Him old news now. Me let him keep dem ugly green tings.");
		}
	}

sub EVENT_ITEM 
	{
	if($faction < 8 && plugin::check_handin(\%itemcount, 10035 => 1))
		{
		quest::say("Mmm. Ruby!! Me thank's you! Here take this, me got it off dead someone who try take my collection. Me think's this valuable thing..");

		my $reward;
		my $fac = $client->GetModCharacterFactionLevel(222);
		my $cha = $client->GetCHA();

		# Create a bonus of up to 11 or so
		my $bonuses = ($fac + $cha) / 200.0;

		my $roll =  plugin::RandomRange(1,100);

		if ($bonuses > 0)
			{
			$roll = $roll - $bonuses;
			}

		if ($roll < 11)
			{
			$reward = 10082;
			}
		elsif ($roll < 31)
			{
			$reward = 10081;
			}
		else
			{
			$reward = 10080;
			}	

		quest::summonitem($reward); 

		quest::faction(222,1);   # + Broken Skull Clan
		quest::faction(308,-1); # - Shadowknights of Night Keep
		quest::faction(235,-1);  # - Da Bashers
		quest::exp(145);  
		quest::ding();
		}
	else 
		{
		quest::say("I have no need for this item $name, you can have it back.");
		plugin::return_items(\%itemcount);
		}
	}
