sub EVENT_SPAWN
	{
	&TormentedSoulDialogue;
	}

sub TormentedSoulDialogue
	{
	#this npc has a dialogue timer of 37s, 74s, 147s, or 10 minutes
	#37 most common, 147 uncommon, 74 rare, 10 min rarest
	my $dialoguetimer = quest::ChooseRandom(37,37,37,37,37,37,37,147,147,147,147,147,74,74,74,600);
	quest::settimer("dialogue",$dialoguetimer);
	}

sub EVENT_SAY
	{
	if ($faction == 4)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif ($faction > 4)
		{
		quest::say("I was... once...");
		}
	elsif ($text =~ /hail/i)
		{
		quest::say("Whaaat foool does seek counsel with this spirit?");
		}
	elsif ($text =~ /counsel/i)
		{
		quest::say("Yes, counsel. It means to meet and converse, fool. Waste my time with definitions of words any dullard would know and taste my anger.");
		}
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0)
		{
		quest::stoptimer("dialogue");
		quest::say("Was oonncee... aliiive...");
		&TormentedSoulDialogue;
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

sub EVENT_AGGRO
	{
	quest::say("I will suck your soul into the endless torture that is my existence!");
	}
