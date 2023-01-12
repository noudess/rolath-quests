sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Help me, get a key for these shackles!");
		}
	}

sub EVENT_ITEM
	{

	#:: Match one copper
	if ($copper == 1)
		{
		plugin::takeCopper(1);
		quest::say("What is this!!? Get me key number 24!!");
		}

	#:: Match a 20022 - Shackle Key 24
	if (plugin::takeItems(20024 => 1))
		{
		quest::say("Good work!! I shall be on my way. Farewell my friend!!");
		plugin::DoAnim("wave");
		quest::ding();

		#Factions made up since this doesn't work on live.
		quest::faction(333, 2);     #King Ak'Anon
		quest::faction(245, 1);     #Eldritch Collective
		quest::faction(255, 1);     #Gem Choppers
		quest::faction(238, -1);    #Dark Reflection
		quest::faction(287, -1);    #Meldrath
									#:: Grant a moderate amount of experience
		$client->AddLevelBasedExp(14, 10);

		#:: Create a hash for storing cash - 700 to 750cp
		my %cash = plugin::RandomCash(700, 750);

		#:: Grant a random cash reward
		quest::givecash($cash{copper}, $cash{silver}, $cash{gold},
						$cash{platinum});

		#:: Create a timer 'depop' that triggers every 30 seconds
		quest::settimer("depop", 30);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}

sub EVENT_TIMER
	{
	#:: Match the timer 'depop'
	if ($timer eq "depop")
		{
		#:: Stop the timer 'depop'
		quest::stoptimer("depop");

		#:: Depop with spawn timer active
		quest::depop_withtimer();
		}
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		quest::say("Time to die, $name!");
		}
	}
