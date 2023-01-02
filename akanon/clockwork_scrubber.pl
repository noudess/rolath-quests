my $miner628 = "false";

sub EVENT_SPAWN
	{
	#:: 1 in 20 will be 628
	my $random = int(rand(100));

	if ($random <= 5)
		{
		$miner628 = "true";
		}

	quest::settimer("vaccum", 1);
	}

sub EVENT_SAY
	{
	#:: 1 in 20 will respond to 628
	if ($text =~ /628/i && $miner628 eq "true")
		{
		quest::emote(".wizz.click.628.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 12164 - Scrubber Key (Rogue Scrubber Key)
	if (plugin::takeItems(12164 => 1) && $miner628 eq "true")
		{
		quest::emote(".wizz.click.628.");

		#:: Choose a random 12162 - Gnome Take (Good Take For Rogues), 12167 - Gnome Take (Bad Take For Rogues)
		quest::summonitem(quest::ChooseRandom(12162, 12167));

		#:: Ding!
		quest::ding();

		#:: Set factions
		quest::faction(695, -5);    #:: - Clockwork Gnome
									#:: Grant a small amount of experience
		quest::exp(500);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}

sub EVENT_TIMER
	{
	if (plugin::zoneClientCount() > 0)
		{
		# Find all objects
		my @objects = $entity_list->GetObjectList();

		foreach $thing (@objects)
			{
			my $item = $thing->GetItemID();
			my $ground = $thing->IsGroundSpawn();
			if ($item != 0 && $ground == 0)
				{
				my $mobX = $thing->GetX();	
				my $mobY = $thing->GetY();	
				my $mobZ = $thing->GetZ();	
			
				my $cdist = $npc->CalculateDistance($mobX, $mobY, $mobZ);
			
				if ($cdist <= 20)
					{
					quest::emote("Clockwork Scrubber clicks as a plate slides to the side revealing a hose that extends and sucks up an item off the ground.");
					$thing->Depop();
					$npc->AddItem($item);
					}
				}
			}
		}
	}
