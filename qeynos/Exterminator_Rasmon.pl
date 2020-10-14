sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Hello, $name. Have you seen these pesky rodents? They are everywhere, and I simply cannot stand them! If you are willing to do a little cleaning up of the pests here, I will reward you for every four rat whiskers you bring me.");
  }
}

sub EVENT_ITEM {
  # Required Faction verified.
  if($faction <= 6 && plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("I am very impressed, $name! A few more cleaners like yourself and we could have a rodent-free Qeynos in no time!");
	# Verified && XP on live
    quest::faction(262,1); # +Guards of Qeynos
    quest::faction(219,1);   # +Antonius Bayle
    quest::faction(291,1); # +Merchants of Qeynos
    quest::faction(230,-1); # -Corrupt Qeynos Guards
    quest::faction(223,-1); # -Circle of Unseen Hands
    quest::exp(145);
	quest::ding();
    quest::givecash(1,1,1,0);
  }

  plugin::return_items(\%itemcount);
}

