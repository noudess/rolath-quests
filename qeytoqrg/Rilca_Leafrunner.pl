sub EVENT_SPAWN 
	{
	quest::settimer(1,10);
	}

sub EVENT_TIMER 
	{
	if($timer eq "1") 
		{
		$npc->SetAppearance(1);
		quest::stoptimer(1);
		}
	} 


sub EVENT_SAY
	{
	if ($text =~ /hail/i) 
		{
		quest::say("Well, it seems that you have something of importance that you wish to speak to me about? No? Then perhaps you can do something [for me].");
		}
	elsif ($faction > 4)
		{
		plugin::reject_say();
		}
	elsif ($text =~ /for you/i) 
		{
		quest::say("Well I need some information. It appears that some gnolls are planning an [invasion] of Surefall. I believe there are some gnoll couriers that are running information. If you could bring me their marching orders, invasion plans, area maps, and their encryption key. Your best chance to catch a courier is probably inside Blackburrow.");
		}
	elsif ($text =~ /invasion/i)
		{
		quest::say("Apparently they've heard of our plans to reopen the entrance to Jaggedpine inside Surefall. It seems they believe the think they have a chance to stop us. While most of us have little concern about a gnoll invasion force the information you provide would be of great assistance.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount,15931=>1,15932=>1,15933=>1,15934=>1)) 
		{
		quest::emote("takes a look at the documents you handed her and smiles.");
		quest::say("This is exactly what we needed. We'll be better prepared if the gnolls are foolish enough to actually attack. I hope you are willing to assist us in the defense of Surefall. Should you choose to aid us, this club will serve you well.");
		quest::exp(15000);
		quest::ding();
		quest::summonitem(15935);
		}

	plugin::return_items(\%itemcount);
	}
