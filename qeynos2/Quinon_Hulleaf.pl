sub EVENT_SAY
	{
	quest::say("Eh?... <yawn>... Ah good evening to you, too, $name. I'd be careful outside the city gates tonight if I were you... I've heard rumors of evil people and undead wandering the hills recently.");
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18020 =>1 )) 
		{
		quest::say("Ah, hey, $name...  <yawns>...  Here ya go...  <yawns>...  Please excuse my yawning, but this working nights has really drained the energy out of me.  Though, it does...  <yawn>...  get interesting around here sometimes, which helps to keep me awake.  Anyway, be safe, $name, and I'll see you later.");	#verified on live for faction and exp
		quest::summonitem(18025);
		quest::faction(284,10);	#league of antonican bards
		quest::faction(281,1);		#knights of truth
		quest::faction(262,1);		#guards of qeynos
		quest::faction(304,-1);		#ring of scale
		quest::faction(285,-1);		#mayong mistmoore
		quest::exp(200);
		quest::ding();
		}
	plugin::return_items(\%itemcount);
	}
