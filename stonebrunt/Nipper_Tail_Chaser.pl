my $asked=0;
my %mounts = (
	1 => { "id" => 60438, "name" => "Bridle of the Kejek Tiger", "price" => 13650},
	2 => { "id" => 51872, "name" => "Bridle of the Kejek Snow Tiger", "price" => 27300},
	3 => { "id" => 60437, "name" => "Bridle of the Kejek Jaquar", "price" => 61000},
	4 => { "id" => 40601, "name" => "Bridle of the Kejek Leopard", "price" => 96000}
);


sub EVENT_SPAWN
	{
	#quest::set_proximity($x - 15, $x + 15, $y -15, $y + 15);
	}

sub EVENT_SAY
	{
	my $rebate_mult = .8;
	my $eligible = 0;

	my $kejek = $client->GetModCharacterFactionLevel(473);

	if ($name eq "Helena" or $name eq "Spock" or $name eq "Sarah" or
		$name eq "Wynu" or $name eq "Kadiya" or $name eq "Wynu" or
		$name eq "Zelina")
		{
		$rebate_mult=1;
		}

	$eligible = ($rebate_mult == 1 or $kejek > 299);

	if ($text =~ /hail/i)
		{
		plugin::vtell("greet", "froglok", "male");

		if ($rebate_mult == 1)
			{	
			quest::say("Why hello $name!  How arrre you this fine day.  Always a pleasurrre to cater to one of the honored ones!");
			}

		if ($rebate_mult == 1 or $kejek > 150)
			{
			quest::say("If you looking to return a mount for credit, please feel free to ask for a quote.  If not feel free to browse our inventory of fine mounts and make a purcahse normally.");
			}
		}	
		
	if ($text =~ /quote/i)
		{
		quest::say($kejek);
		if ($rebate_mult != 1 and $kejek < 150)
			{
			quest::say("I am sorry, $name.  I am not ready to discuss that with you until you further prove yourself.");
			}
		elsif ($rebate_mult != 1 and $kejek < 300)
			{
			quest::say("I am happy to give you a quote, $name.  However, to be a customer you must do more to prove your allegience");
			}

		if ($rebate_mult == 1 or $kejek > 150)
			{
			for (my $i=1; $i <= 4; $i++)
				{
				$name=$mounts{$i}{"name"};
				$base_price = $mounts{$i}{"price"};
				$server_sell_mod = quest::get_rule("Merchant:SellCostMod");
				$price_to_buy = int($client->CalcPriceMod($npc,0) * $base_price * $server_sell_mod);
				$trade_in_value = int($rebate_mult * $price_to_buy);
				$client->Message(4,"$name($price_to_buy) Trade Value($trade_in_value)");
				}
			}

		if ($rebate_mult == 1 or $kejek > 299)
			{
			quest::say("To purchase using your trade-in, trade me your current bridle along with enough platinum to cover the difference for your brand new mount from Nipper's!");
			}
		}
	}

sub EVENT_ITEM
	{
	my $traded_in_id=0;
	my $rebate_earned=0;
	my $correct_cash=0;
	my $rebate_mult = .8;
	my @traded_in;

	my $kejek = $client->GetModCharacterFactionLevel(473);

	if ($name eq "Helena" or $name eq "Spock" or $name eq "Sarah" or
		$name eq "Wynu" or $name eq "Kadiya" or $name eq "Wynu" or
		$name eq "Zelina")
		{
		$rebate_mult=1;
		}

	if ($kejek < 299 && $rebate_mult != 1)
		{
		quest::say("Nipper maintains a strict and exclusive clientelle.  Perhaps you can do some work for some of us and check back later.");
		}
	else
		{
		for (my $i=1; $i <= 4; $i++)
			{
			$mountid = $mounts{$i}{"id"};
			if (plugin::check_handin(\%itemcount, $mountid => 1))
				{
				$mountname=$mounts{$i}{"name"};
				$base_price = $mounts{$i}{"price"};
				$server_sell_mod = quest::get_rule("Merchant:SellCostMod");
				$price_to_buy = int($client->CalcPriceMod($npc,0) * $base_price * $server_sell_mod);
				$rebate_earned = $rebate_earned + int($rebate_mult * $price_to_buy);
				quest::say("I accept your trade of $mountname for $rebate_earned");
				push @traded_in, $mountid;
				}
			}

		for (my $i=1; $i <= 4; $i++)
			{
			$mountid = $mounts{$i}{"id"};
			$base_price = $mounts{$i}{"price"};
			$server_sell_mod = quest::get_rule("Merchant:SellCostMod");
			$price_to_buy = int($client->CalcPriceMod($npc,0) * $base_price * $server_sell_mod);
			if ($platinum  == ($price_to_buy - $rebate_earned))
				{
				quest::say("Yes, $platinum does equal payment in full.");
				quest::summonitem($mountid);
				$correct_cash = 1;
				last;
				}
			}
			
		if ($correct_cash == 0 or !@traded_in)
			{
			if (!$correct_cash)
				{
				quest::say("This does not look like the corrrrect amount of platinum!");
				quest::givecash(0, 0, 0, $platinum);
				}

			if (!@traded_in)
				{
				quest::say("I expected a bridle as trade!");
				}
			else
				{
				while (@traded_in)
					{
					quest::say("Here, take this back");
					$entry = pop @traded_in;
					quest::summonitem($entry);
					}
				}
			}

		}

	plugin::return_items(\%itemcount);
	}

sub EVENT_ENTER
	{
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
		quest::say("Many thanks my frrriend.  I shall go feed the lovlies.");
		}
	else
		{
		quest::say("We are progrrrressing well.  We have animals in training and should be able to provide a supply of well trained mounts.  We are in need of supplies, and I am personally working on a plan to recruit volunteers to aid with the gathering.");
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp == 0)
		{
		$asked=0;
		quest::say("I guess it's time to get you some yum yums my friend");
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 5 && $asked == 0)
		{
		quest::say("I'm going to need more of those kobold giblets you prepared for me, Sted.");
		$asked = 1;
		if (plugin::zoneClientCount() > 0)
			{
			quest::signal(100152, 1000);
			}
		}
	}
