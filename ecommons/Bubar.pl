sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
		}
	elsif ($text =~ /gem case/i)
		{
		quest::say("Talking of containers? I do not make containers any longer. Provisions are much more profitable. Do you have one of my containers? Most likely you have locked yourself out then. My specialty was the three-lock case. They always lose one of the keys. Hand me the case and at least two of the keys and I can open it for you.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 12351 => 1, 12352 => 1, 12350 => 1))
		{
		quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		quest::ding();
		quest::summonitem(12349);
		quest::exp(15000);
		quest::ding();
		}
	}

#EOF -- ZONE: ecommons -- NAME: Bubar -- ID: 22033

