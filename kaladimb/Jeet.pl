sub EVENT_SAY
	{
	if ($faction > 6)
		{
		quest::say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		}
	elsif ($text =~ /Hail/i)
		{
		quest::say("What business do you have here?!!  This here is the mine and that means if you ain't a [member of Miner's Guild 628], you'd best be moving on!!");
		}
	elsif ($faction > 4)
		{
		quest::say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		}
	elsif ($text =~ /member of miners guild 628/i)
		{
		quest::say("Well, then, get off yer rump and give us a hand!  If you don't have a mining pick, then get down there and use your fingernails!!  If you're new and you want to earn a pick, you can [volunteer to exterminate the rats] that have been infesting the mines!!");
		}
	elsif (($text =~ /volunteer to exterminate the rats/i))
		{
		quest::say("Well, someone has to do the dirty work around here.  Let it be you new miners.  Go patrol the mines and if you see any rats, bash them good!!  Return to me with four rat pelts and I will give you some armor as payment.  If you want a 628 mining cap, yer gonna have to smash that infernal [cleaner]!!");
		}
	elsif ($text =~ /run to the gnome city/i)
		{
		quest::say("Well, as you most likely know, we are a non-profit organization, at least here in Kaladim. We need to make our profit elsewhere and that means a little bit of thieving. Presently we need loyal members to [collect the gnome profit].");
		}
	elsif ($text =~ /collect the gnome profit/i)
		{
		quest::say("Take this key. Don't lose it!! You will need to use it on a metal rat called a scrubber. They are all over Ak'Anon. You must find the one that responds to the number, '628'. If it responds, use the key on it. It will hand over a bag with the 'gnome take'. Return it to me. Get moving!!");
		#:: Give a 12164 - Scrubber Key
		quest::summonitem(12164); # Scrubber Key
		}
	elsif (($text =~ /cleaner/i))
		{
		quest::say("Darn that blasted clockwork cleaner!!  No one in Kaladim even knows what it is! They all think it's some kinda rat in armor!!  Rat paladins?!!  The name fits.  We miners have seen many like it in the gnome city during heists, err.. visits.  We have to get rid of this one in Kaladim!!  If you smash it and get its scrap metal, I am authorized to give you a mining cap, if you are a member of Miner's Guild 628.");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount, 13054 => 4))
		{
		quest::say("'It's about time you managed to smash these four! Here. You do good work. We could use someone like you to [run to the gnome city].");
		quest::summonitem(quest::ChooseRandom(2108, 2124, 2118, 2116, 2120, 2123));
		quest::exp(5000);
		quest::ding();
		# factions per ZAM
		quest::faction(241, 1);		# Deeppockets
		quest::faction(322, 20);	# 628
		quest::faction(379, -1);	# BB Bandits
		quest::faction(223, -1);	# Circle of Unseen
		quest::faction(244, -3);	# Ebon Mask
		}

	if ($faction < 5 && plugin::check_handin(\%itemcount, 13282 => 1))
		{
		quest::say("Great work! We need this junk for something and we sure didn't need this rat sucking up any of our gems. Here. This is a Mining Cap 628. It's not much, but it is the mark of our miners and provides light for mining purposes. Hold onto it. You never know when we may call upon you to produce it.");
		quest::summonitem(12165);
		quest::exp(5000);
		quest::ding();
		# factions per ZAM
		quest::faction(241, 1);		# Deeppockets
		quest::faction(322, 15);	# 628
		quest::faction(379, -1);	# BB Bandits
		quest::faction(223, -1);	# Circle of Unseen
		quest::faction(244, -2);	# Ebon Mask
		}

	#:: Match a 12167 - Gnome Take (Bad)
	if ($faction < 5 && plugin::takeItems(12167 => 1)) 
		{
		quest::say("What is all this junk!! That blasted tin rat is supposed to be heisting expensive goods from rich gnomes - not all this garbage!! Here. This is your cut of this junk.");
		quest::summonitem(quest::ChooseRandom(13220, 10015, 10500, 10016));
		quest::ding();
		#Factions verified on zam
		quest::faction(322, 5);		#:: + Miners Guild 628
		quest::faction(223, -1);	#:: - Circle Of Unseen Hands
		quest::faction(379, -1);	#:: - Butcherblock Bandits
		quest::faction(241, 1);		#:: + Deeppockets
		quest::faction(244, -1);	#:: - Ebon Mask
		quest::exp(5000);
		my %cash = plugin::RandomCash(15,25);
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}

	#:: Match a 12162 - Gnome Take (Good)
	if ($faction < 5 && plugin::takeItems(12162 => 1)) 
		{
		quest::say("Good work miner. This is a fantastic haul!! Those wrinkly little gnomes don't know what is going on. Here is your cut. Now get back to work.");
		quest::summonitem(quest::ChooseRandom(10017,10020,10006,10320,10019));
		quest::ding();
		#Factions verified on zam
		quest::faction(322, 25);	#:: + Miners Guild 628
		quest::faction(223, -1);	#:: - Circle Of Unseen Hands
		quest::faction(379, -1);	#:: - Butcherblock Bandits
		quest::faction(241, 1);		#:: + Deeppockets
		quest::faction(244, -3);	#:: - Ebon Mask
		quest::exp(5000);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}


sub EVENT_SIGNAL
	{
	quest::say("I am working on it, Mater!!");
	}

#END of FILE Zone:kaladimb  ID:67018 -- Jeet
