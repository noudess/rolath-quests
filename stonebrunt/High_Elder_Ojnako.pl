my $departedwp;
my $justpopped;
my $running;
my $grand_prize_ticket;

sub EVENT_SPAWN
	{
	$departedwp=0;
	$justpopped=1;
	$running=0;
	$grand_prize_ticket=plugin::RandomRange(232509, 232618);
	}

sub EVENT_SAY
	{
	if ($name =~ /Helena/i && $text =~ /started/i)
		{
		quest::say("Hail $name");
		quest::say("Very well, let the celebration begin.");
		quest::stop();
		quest::moveto(-617, 1291, 1028, 94, 1);
		quest::settimer("celebration", 120);
		}

	if ($name =~ /Helena/i && $text =~ /complete/i)
		{
		quest::shout("Thank you all for participating, and enjoy your prizes.");
		quest::depop_withtimer();
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "celebration")
		{
		quest::stoptimer("celebration");
		quest::shout("Welcome my new frrriends to Mount Klaw, the home of the Kejeken people.");
		quest::shout("I have not come to know each of your perrrssonally, but many here have spoken to me about your worrrds and deeds.");
		quest::shout("Now that each of you has picked up your tickets from Nipper, I'd like to begin by saying thank you to you, the great herrroes that have helped to make today possible.");
		quest::shout("It could neverr have happened without the help of each and every one of you.");
		quest::shout("I would now like to ask Ruhyk, High Scholar of Erudin, to come forward and hand in her tickets.  Once she has done so, I ask that she call forward each of her comrades in turn, to see what they have done.");
		quest::shout("While tickets can be turned in 4 at a time, we would all prefer it if you would all do this one ticket at a time so we can all celebrate your rewards as they are bestowed!");
		$running = 1;
		}
	}

sub EVENT_ITEM
	{
	if ($running)
		{
		if (($item1 > 232508 && $item1 < 232621)
			or ($item2 > 232508 && $item2 < 232621)
			or ($item3 > 232508 && $item3 < 232621)
			or ($item4 > 232508 && $item4 < 232621))
			{
			# A valid lottery ticket.
			if ($item1 == $grand_prize_ticket ||
				$item2 == $grand_prize_ticket ||
				$item3 == $grand_prize_ticket ||
				$item4 == $grand_prize_ticket)
				{
				# Summon the grand prize - anouncement and fireworks
				quest::shout("$name is our GRAND PRIZE WINNER!!!");
				quest::shout("Congratulations on being the only one to win the Bridle of the Kejek Leopard!");
				}
			
			if ($item1 > 0 and $item1 != $grand_prize_ticket)
				{
				RandomPrize();
				}

			if ($item2 > 0 and $item2 != $grand_prize_ticket)
				{
				RandomPrize();
				}

			if ($item3 > 0 and $item3 != $grand_prize_ticket)
				{
				RandomPrize();
				}

			if ($item4 > 0 and $item4 != $grand_prize_ticket)
				{
				RandomPrize();
				}
			}
		else
			{
			plugin::return_items(\%itemcount);
			}
		}
	else
		{
		quest::say("The Kejeken celabration is not yet underway.  Please hold onto this");
		plugin::return_items(\%itemcount);
		}
	}

sub RandomPrize
	{
	my $roll = plugin::RandomRange(1, 100);
	if ($roll == 1)
		{
		if (plugin::check_hasitem($client, 51872))
			{
			RandomPrize();
			}
		else
			{
			quest::shout("$name wins the Bridle of the Kejek Snow Tiger!");
			quest::summonitem(51872);
			}
		}	
	elsif ($roll == 2)
		{
		if (plugin::check_hasitem($client, 60438))
			{
			RandomPrize();
			}
		else
			{
			quest::shout("$name wins the Bridle of the Kejek Tiger");
			quest::summonitem(60438);
			}
		}
	elsif ($roll == 3)
		{
		if (plugin::check_hasitem($client, 6953))
			{
			RandomPrize();
			}
		else
			{
			quest::shout("$name wins a Swiftclaw Belt!");
			quest::summonitem(6953, 1);
			}
		}
	elsif ($roll == 4)
		{
		quest::shout("$name wins a Wakizashi of the Frozen Skies!");
		quest::summonitem(6952);
		}
	else
		{
		if ($roll < 50)
			{
			if (plugin::check_hasitem($client, 13748))
				{
				quest::shout("$name wins 4 pouches of Kejek Catnip!");
				quest::summonitem(20115, 4);
				}
			else
				{
				quest::shout("$name wins a Kerran Toy!");
				quest::summonitem(13748);
				}
			}
		else
			{
			my $plat = plugin::RandomRange(50,350);
			quest::shout("$name wins $plat platinum pieces!");
			quest::givecash(0, 0, 0, $plat);
			}
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == $departedwp)
		{
		if ($wp != 0 && $wp != 5)
			{
			quest::say("It is good to spend time with you. I think I will stay awhile");
			}
		}
	elsif ($wp == 0)
		{
		quest::emote("stands in the mystical fire, gathering energy from it.  His eyes close slowly and he begins to chant");
		}
	elsif ($wp == 1)
		{
		quest::say("My respect, Shazda.  How goes the hunt to expel the dogs and their heretic leaders?");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signal(100150, 1000);
			}
		}
	elsif ($wp == 2)
		{
		quest::say("Khonza, my old smithing friend.  Do you still craft the mystical blade of our elders?");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signal(100149, 1000);
			}
		}
	elsif ($wp == 3)
		{
		quest::say("These looks to be fine animals, Nipper.  How comes the prrrrogress of opening shop?");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signalwith(100236, 2, 1000);
			}
		}
	elsif ($wp == 4)
		{
		quest::say("Ah my frrrriends.  Many a night have I sat awake wishing for the company of the Wirrrewhiskers!  Perrhaps we might sample some fish ale this eve?");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signal(100135, 1000);
			}
		}
	elsif ($wp == 5)
		{
		quest::emote("stops to take in the grandeur that is Kejek Mountain.");
		}
	}

sub EVENT_WAYPOINT_DEPART
	{
	if ($wp != 0 && $wp != 5 && $justpopped != 1 && $wp != $departedwp)
		{
		my $random = int(rand(4));

		if ($random == 0) 
			{
			quest::say("Until I have more time to chat, I must say goodbye.");
			}
		elsif ($random == 1) 
			{
			quest::say("Take carrre my friend.");
			}
		elsif ($random == 2) 
			{
			quest::say("If was good to see you, brrave one.");
			}
		elsif ($random == 3) 
			{
			quest::say("I look forrrward to our next encounter");
			}
		}
	if ($justpopped)
		{
		$justpopped = 0;
		$departedwp = 0;
		}
	else
		{
		$departedwp = $wp;
		}
	}
