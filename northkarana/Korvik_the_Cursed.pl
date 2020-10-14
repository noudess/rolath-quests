sub EVENT_SPAWN
	{
	if($entity_list->GetNPCByNPCTypeID(13117))
		{
		quest::settimer("die",1);
		}	
	}

sub EVENT_TIMER
	{
	if ($timer eq "die")
		{
		quest::stoptimer("die");
		$npc->Depop(0);
		}
	elsif ($timer eq "cheer")
		{
		quest::say("I think I am CURED!");
		quest::doanim(27);
		quest::stoptimer("cheer");
		quest::settimer("runhome", 5);
		}
	else
		{
		quest::stoptimer("runhome");
		quest::shout("I feel alive again!  I have to run home and see my family!  Yippeeeee!");
		quest::SetRunning(1);
		quest::stop();
		quest::moveto(2957, 626, 0, 0, 0);
		quest::settimer("die", 45);
		quest::spawn_condition("qeynos", 3, 1);
		}
	}

sub EVENT_CAST_ON
	{
	#This does not work for players... its a beneficial spell.
	if ($spell_id == 7514)
		{
		quest::emote("blinks a few times.");
		quest::say("Something feels different.");
		quest::settimer("cheer", 5);
		}
	}
