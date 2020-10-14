sub EVENT_SPAWN 
	{
	quest::SetRunning(1);
	quest::settimer("follow", 1);
	}

sub EVENT_TIMER
	{
	if ($timer eq "follow")
		{
		my $OpponentID = 30061;
		my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($OpponentID);
		my $follow_target = $getmobbynpctype->GetID();
		quest::follow($follow_target);
		quest::stoptimer("follow");
		}
	}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::say("Grrroarrr !!");
		quest::signalwith(30061,1);
		}
	}

sub EVENT_ITEM 
	{ 
	if(plugin::check_handin(\%itemcount, 12221 => 1)) 
		{
		quest::emote("growls with happiness and licks your face.  Just enough time to swipe the sweaty shirt from his collar!!  Iceberg then runs off to enjoy his lion delight!!");
		#Factions verified on Live
		quest::signalwith(30061,2);
		quest::ding();
		quest::faction(320, 2); #Wolves of the North
		quest::faction(327, 1); #Shamen of Justice
		quest::faction(328, 1); #Merchants of Halas
		quest::faction(311, 1); #Steel warriors
		quest::exp(1000);
		quest::ding();
		quest::summonitem(12226);  # sweaty shirt
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:everfrost  ID:30046 -- Iceberg 

