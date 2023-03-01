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
	if($text=~/broken skull/i)
		{
		quest::say("We Broken Skull be da only survivin founding clan of trolls.  All hail da legendary hero [Nalikor] who crossed da teeth of Trakanon and spoke to da mighty dragon god!");
		}
	if($text=~/nalikor/i)
		{
		quest::say("Nalikor be chosen by da dragon Trakanon to weild da Flaming Sword and leads da troll peoples from da dead lands of Kunark.  In a mighty fleet of trol bone ships, he leds da peoples here, mad good war wid ogres and won da respect of ogre king Gharn who agree to truce.  King Gharn helped da great Nalikor tablish new kingdom and trades her and da legendary hero Nalikor promish military aids in return.  Long has the treat of the [Burning Blade] stood!");
		}
	if($text=~/burning blade/i)
		{
		quest::say("Nalikor gave da Burning Blade dat Trakanon give him to seal da treaty wid da ogres.  It be cased in magik crystal in secret place, deep in temple dat lizards tookis.  Someday we destroy all da lizards and find secret place. Den I red da sacred words etched in magik... 'Here the great alliance was formed between king Gharn the slayer and Trakanon's chosen. May death come to those who seek to disrupt it.'");
		quest::emote("closes her eyes and burps in blissful contemplation.");
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
