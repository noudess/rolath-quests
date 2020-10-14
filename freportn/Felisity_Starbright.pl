#Quest Name: Bard Mail Quest

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hail. $name - If you are interested in helping the League of Antonican Bards by delivering some mail you should talk to Ton Twostring."); 
		}
	}
sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18158 => 1) || plugin::check_handin(\%itemcount, 18157 => 1)) 
		{
		quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
		quest::givecash(0,0,quest::ChooseRandom(6,7,8,9),0);
		quest::exp(140);
		quest::ding();
		quest::faction(284,5); #league of antonican bards
		quest::faction(281,1); #knights of truth
		quest::faction(262,1); #guards of qeynos
		quest::faction(304,-1); #ring of scale
		quest::faction(285,-1); #mayong mistmoore
		}

	elsif(plugin::check_handin(\%itemcount, 18159 => 1)) 
		{
		quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
		quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
		quest::exp(140);
		quest::ding();
		quest::faction(284,5); #league of antonican bards
		quest::faction(281,1); #knights of truth
		quest::faction(262,1); #guards of qeynos
		quest::faction(304,-1); #ring of scale
		quest::faction(285,-1); #mayong mistmoore
		}

	elsif(plugin::check_handin(\%itemcount, 18155 => 1))  # From Grobb
		{
		quest::say("Mail from the front - thank you very much! Please take this gold for your troubles. If you are interested in more work, just ask Ton Twostring.");
		quest::givecash(0,0,quest::ChooseRandom(11,12,13,14,15),0);
		quest::exp(140);
		quest::ding();
		quest::faction(284,5); #league of antonican bards
		quest::faction(281,1); #knights of truth
		quest::faction(262,1); #guards of qeynos
		quest::faction(304,-1); #ring of scale
		quest::faction(285,-1); #mayong mistmoore
		}

	else 
		{
		quest::say("I have no need for that.");
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:freportn
