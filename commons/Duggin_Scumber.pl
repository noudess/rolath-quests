my $mojax;

sub EVENT_SPAWN
	{
	# Find Mojax and follow him
	$mojax = $entity_list->GetMobByNpcTypeID(21050);
	my $ftarget = $mojax->GetID();
	quest::follow($ftarget);

	# Start a timer to check proximity to Mojax
	quest::settimer("proximity", 3);
	}

sub EVENT_TIMER 
	{
	if ($timer eq "proximity")
		{
		my $mojaxx = int($mojax->GetX());
		my $mojaxy = int($mojax->GetY());
		my $mojaxz = int($mojax->GetZ());

		my $dugX= $npc->GetX();
		my $dugY= $npc->GetY();
		my $dugZ= $npc->GetZ();
		my $mojdist = int($npc->CalculateDistance($mojaxx, $mojaxy, $mojaxz));	
		if ($mojdist <= 15)
			{
			quest::emote("runs up and taunts Mojax.");
			quest::say("Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note you had hidden and now I shall take it to my superior!! Just try and catch me!!");
			quest::stoptimer("proximity");
			quest::signal(21050,1);
			quest::addloot(18822,1,0);
			quest::settimer("flee",2);
			}
		}

	if($timer eq "flee") 
		{
		quest::stoptimer("flee");
		quest::sfollow();
		quest::SetRunning(1);
		quest::start(2);
		}
	}

sub EVENT_DEATH 
	{
	quest::say("Your name shall be added to the most wanted list of the Freeport Militia!!");
	}


sub EVENT_ITEM 
	{
	plugin::return_items(\%itemcount);  
	}
