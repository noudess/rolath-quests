sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Greetings, citizen. Welcome to Akanon. *whirr whirr* Mission *Terminate Vermin* initiated. Bring four clockwork rat leg sections from defective cleaners for reward. All defective models must be eradicated *bzzzt whirr*.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 10967 => 4))	#Clockwork Rat Leg Section x 4
		{    
		quest::say("Four Clockwork Rat Leg Sections recieved *bzzzt* processing reward. Reward mode initiated. Coins given. Mission *Terminate Vermin* reset one second *bzzt whirr*.");
		#Factions per ZAM
		quest::faction(333, 1);     # +King Ak'Anon
		quest::faction(245, 1);     # +Eldritch Collective
		quest::faction(255, 1);     # +Gem Choppers
		quest::faction(238, -1);    # -Dark Reflection
		quest::faction(287, -1);    # -Meldrath
		quest::exp(145);	#Matched exp given in Qeynos Rat Whisker quest
		quest::ding();
		quest::givecash(1, 1, 1, 0);
		}
	else
		{
		quest::say("*bzzzt*");
		plugin::return_items(\%itemcount);
		}
	}

