#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, $name - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18150 => 1) || plugin::check_handin(\%itemcount, 18151 => 1) || plugin::check_handin(\%itemcount, 1375 => 1)) {
    quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(3,4,5,6),0);
    quest::exp(128);
	quest::ding();
	# Faction verified on ZAM
    quest::faction(284,5); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
  }
  
  elsif(plugin::check_handin(\%itemcount, 18153 => 1) || plugin::check_handin(\%itemcount, 18154 => 1)) {
  quest::say("Incoming mail - very good!  Please take this gold for your troubles.");
    quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
    quest::exp(100);
	quest::ding();
	# Faction verified on ZAM
    quest::faction(284,5); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
  }

  else {
    quest::say("I have no need for that.");
    plugin::return_items(\%itemcount);
  }
}


sub EVENT_SIGNAL
	{
	quest::settimer("depart", 37);
	}

sub EVENT_TIMER
	{
	quest::start(70);
	quest::shout("Right behind you love.");
	quest::stoptimer("depart");
	}


sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 13)
		{
		quest::emote("shakes Korvik's hand");
		}
	elsif ($wp == 14)
		{
		quest::stop();
		quest::moveto(139, 20.5, 3.75, 143.6,1);
		}
	}
# End of File zone: qeynos
