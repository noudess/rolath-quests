
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18891 =>1 )) {
    quest::say("Search!! Find Windstream. Find the mallet!! One. Two. Three.");
    quest::spawn2(36096,0,0,-88,-637,-66,254);
	quest::ding();
	quest::exp(300);
  }
  plugin::return_items(\%itemcount);
}
