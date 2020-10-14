sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13844 =>1)) {
    quest::say("Tick.. Pop.. Access granted.");
    quest::summonitem(13212);
    quest::faction(333,1);
    quest::faction(245,1);
    quest::faction(255,1);
    quest::faction(238,-1);
    quest::faction(287,-1);
    quest::exp(100);
quest::ding();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
