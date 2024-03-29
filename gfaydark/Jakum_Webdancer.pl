#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Hail. $name - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to Idia.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 18161 => 1))
		{
		quest::say("More mail - you have done us a noteworthy service! Please take this gold for your troubles. If you are interested in more work, just ask Idia.");
		quest::givecash(0, 0, quest::ChooseRandom(3, 4, 5, 6), 0);
		quest::exp(50);
		quest::ding();
		# Verified
		quest::faction(284, 5);     #league of antonican bards
		quest::faction(281, 1);     #knights of truth
		quest::faction(262, 1);     #guards of qeynos
		quest::faction(304, -1);    #ring of scale
		quest::faction(285, -1);    #mayong mistmoore
		}

	elsif (plugin::check_handin(\%itemcount, 18160 => 1) || 
		   plugin::check_handin(\%itemcount, 18162 => 1) || 
		   plugin::check_handin(\%itemcount, 18163 => 1))
		{
		quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
		quest::givecash(0, 0, quest::ChooseRandom(6, 7, 8, 9), 0);
		quest::exp(80);
		quest::ding();
		# Verified
		quest::faction(284, 5);     #league of antonican bards
		quest::faction(281, 1);     #knights of truth
		quest::faction(262, 1);     #guards of qeynos
		quest::faction(304, -1);    #ring of scale
		quest::faction(285, -1);    #mayong mistmoore
		}

	else
		{
		quest::say("I have no need for that.");
		plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:gfaydark
