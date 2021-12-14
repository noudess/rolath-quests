sub EVENT_SPAWN
	{
	quest::settimer("alive", 60);
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		#:: Match if faction is Amiable or better
		if ($faction <= 4)
			{
			quest::say("Whaaat foool does seek counsel with this spirit?");
			}
		else
			{
			quest::say("Come back when you have done more to further our campaign."); }
		}
	elsif ($text =~ /counsel/i)
		{
		#:: Match if faction is Amiable or better
		if ($faction <= 4)
			{
			quest::say("Yes, counsel. It means to meet and converse, fool. Waste my time with definitions of words any dullard would know and taste my anger.");
			}
		else
			{
			quest::say("Come back when you have done more to further our campaign."); }
		}
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0)
		{
		quest::say("Was oonncee... aliiive...");
		}
	}


sub EVENT_ITEM
	{
	#:: Match if faction is Kindly or better
	if ($faction <= 3)
		{
		#:: Match a 7114 - Soul Trap
		if (plugin::takeItems(7114 => 1))
			{
			quest::say("Was oonncee... aliiive...");

			#:: Give a 7105 - Mantle of Souls
			quest::summonitem(7105);

			#:: Ding!
			quest::ding();

			#:: Set factions
			quest::faction(265, 15);    #:: + Heretics
			quest::faction(242, -15);   #:: - Deepwater Knights
			quest::faction(254, -15);   #:: - Gate Callers
			quest::faction(231, -15);   #:: - Craftkeepers
			quest::faction(233, -15);   #:: - Crimson Hands
			quest::exp(1000);
			}
		}
	else
		{
		quest::say("Come back when you have done more to further our campaign.");
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
