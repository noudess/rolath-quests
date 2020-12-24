sub EVENT_SAY 
	{ 

	if ($text=~/Hail/i)
		{
		quest::say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [travel to Freeport] or [travel to Butcherblock] in the meantime, I can transport you to my companion there."); 
		}

	if ($text=~/travel to freeport/i)
		{
		quest::selfcast("2283"); 
		}

	if ($text=~/travel to butcherblock/i)
		{
		quest::selfcast("2281"); 
		}

	if ($text=~/boat/i)
		{
		my $c = quest::get_spawn_condition("oot", 0, 3);
		quest::shout("ooc condition 3: $c");
		my $c = quest::get_spawn_condition("oot", 0, 4);
		quest::shout("ooc condition 4: $c");
		my $c = quest::get_spawn_condition("oot", 0, 5);
		quest::shout("ooc condition 5: $c");
		my $c = quest::get_spawn_condition("oot", 0, 6);
		quest::shout("ooc condition 6: $c");
		my $c = quest::get_spawn_condition("butcher", 0, 4);
		quest::shout("butcher condition 4: $c");
		my $c = quest::get_spawn_condition("butcher", 0, 5);
		quest::shout("butcher condition 5: $c");
		my $c = quest::get_spawn_condition("freporte", 0, 3);
		quest::shout("freporte condition 3: $c");
		my $c = quest::get_spawn_condition("freporte", 0, 6);
		quest::shout("freporte condition 6: $c");
		}
	} 
