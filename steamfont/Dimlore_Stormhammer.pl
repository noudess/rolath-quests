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
		quest::say("What is this!!? Get me key number 23!!");
		}

	#:: Match a 20023 - Shackle Key 23
	if (plugin::takeItems(20023 => 1))
		{
		quest::say("Good work!! I shall be on my way. Farewell my friend!!");
		plugin::DoAnim("wave");
		quest::ding();

		#Factions made up since this doesn't work on live.
		quest::faction(274, 2);     #Kazon Stormhammer
		quest::faction(312, 2);     #Storm Guard
		quest::faction(228, -2);    #Clurg
		quest::faction(285, -1);    #Mayong Mistmoore
		quest::faction(304, -1);    #Ring of Scale
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
