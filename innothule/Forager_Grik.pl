sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Grikk.. Please leave me be. I but a humble forager. My people are starving.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13375 => 1)) {
    quest::say("Grrrikk.. This is Groak's vial!! He must be in danger. Here. Return this liquid to him. Be quick!");
    quest::faction(251,1);
    quest::summonitem(13376);
	quest::ding();
	$client->AddLevelBasedExp(10,1); # Not tested yet at level 2
  }
  else {
    quest::say("Grikk.. I do not want this.");
    plugin::return_items(\%itemcount);
  }
}
