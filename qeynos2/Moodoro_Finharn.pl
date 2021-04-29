#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################
sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 6)
		{
		quest::say("<urp>.. I don't feel so well.");
		quest::signalwith(2091, 1, 1);
		}
	if ($wp == 14)
		{
		$npc->SetAppearance(1);
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
		quest::say("Ooooh.. Bllaughhh.. Ooh.. I need some tonic.");
		}
	if ($signal == 2)
		{
		quest::say("HA! HA1 HA! Oh.. <burp> HA! HA! HA!  How pitiful!  HA! HA!");
		}
	}

sub EVENT_SAY
	{
	if ($faction > 6)
		{
		plugin::reject_say();
		}
	elsif ($text =~ /Hail/i)
		{
		quest::say("Greetings, fellow traveler! I gotta tell ya. I love this town. Especially Crow's. Although the crowd seems a bit shadier than other places of the sort.");
		}
	elsif ($text =~ /testament of vanear/i)
		{
		quest::say("So you have heard that good old Moodoro has knowledge of the Testament of Vanear. I care little for that book. Of course I have it!! If you want it, I will sell it to you for two gold pieces.");
		}
	elsif ($text =~ /who is ran?/i)
		{
		quest::say("Ran Flamespinner is a librarian in Highpass Hold.");
		}
	elsif ($text =~ /I want page 34/i)
		{
		quest::say("So, you know I have page 34. Pretty smart of me to tear the most important page out before someone else tried, eh? If you really want it, then sit down and deal in. Ante is 4 gold. I will give you one card. If it is a jester, then I will give you the page. Let's do it.");
		}
	elsif ($text =~ /Erud's Tonic/i)
		{
		quest::say("I need some of Erud's tonic water. There is a merchant in Erudin who sells it.");
		}
	}

sub EVENT_ITEM
	{
	if ($faction > 6)
		{
		plugin::reject_say();
		}
	elsif ($gold == 2)
		{
		quest::say(
			"HA!! I hope you enjoy the book. It is missing pages 30 and 34. It is nothing more than garbage without them. A rogue ripped them from their bindings and sold them to [Ran]."
			);
		quest::summonitem(17918);
		}
	elsif ($gold == 4)
		{
		quest::say("Well, what do you have?!!");
		my $roll = int(rand(100));
		if ($roll < 52)
			{
			$a = 13996; #Beggar
			}
		elsif ($roll < 70)
			{
			$a = 13992; #Beggar
			}
		elsif ($roll < 86)
			{
			$a = 13993; #Queen
			}
		else
			{
			$a = 13994; #Jester
			}
		quest::summonitem($a);
		}
	elsif (plugin::check_handin(\%itemcount, 13994 => 1))
		{
		quest::say("Lucky you. We were hoping to really clean you out. Here you go. Take the page. Even together, the book is nothing more than fiction.");
		quest::summonitem(13836);
		}
	elsif (plugin::check_handin(\%itemcount, 13118 => 1))
		{
		quest::say("Oh thank the maker you have returned. Here is a little something in return");

		# Faction verified on live
		quest::faction(233, 20);    # Crimson Hands
		quest::faction(266, 2);     # High Council
		quest::faction(265, -3);    # Heretics
		quest::faction(267, 3);     # High Guard
		quest::exp(100);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}

sub EVENT_DEATH
	{
	quest::say("I'll get you back $name!");
	quest::summonitem(13836);
	}
