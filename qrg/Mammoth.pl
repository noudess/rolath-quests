sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12140 => 1)) {
    quest::summonitem(18809);
    quest::faction(343, 10);
    quest::faction(302, 10);
    quest::faction(272, 10);
    quest::faction(366, -30);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# Quest by mystic414
