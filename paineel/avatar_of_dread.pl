sub EVENT_SPAWN
	{
	quest::settimer("DreadShout", 17000);
	quest::settimer("DreadDepop", 170000);
	}

sub EVENT_TIMER
	{
	#:: Match timer DreadShout
	if ($timer eq "DreadShout")
		{
		quest::shout("Grrrraaaaarrrrrg! The stench of fear permeates the walls of this city! I will forge one item for the faithful of our Lord Cazic-Thule! Make haste!  My time here is short!");
		}

	#:: Match timer DreadDepop
	elsif ($timer eq "DreadDepop")
		{
		quest::depop();
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 14105 - Mundane Shield
	if (plugin::takeItems(14105 => 1))
		{
		quest::say("Wear this shield imbued with my very essence. Wear it in honor of your great services to our Lord Cazic-Thule!");

		#:: Give a 14107 - Dread Forged Shield
		quest::summonitem(14107);

		#:: Ding!
		quest::ding();

		#:: Set factions
		quest::faction(265, 50);     # + Heretics
		quest::faction(254, -50);    # - Gate Callers
		quest::faction(242, -50);    # - Deepwater Knights
		quest::faction(231, -50);    # - Craftkeepers
		quest::faction(233, -50);    # - Crimson Hands
									 #:: Grant a moderate amount of experience
		quest::exp(1000);

		#:: Despawn
		quest::depop();
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
