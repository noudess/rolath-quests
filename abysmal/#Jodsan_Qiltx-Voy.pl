sub EVENT_ITEM {
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
