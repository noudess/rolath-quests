my $counter = 0;
#needs live text
#accepts beer braised tuna
#accepts garlic buttered tuna
sub EVENT_SPAWN {
  $counter=0;
  quest::settimer(1,1800);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm famished, I require tuna.");
  }
}
sub EVENT_TIMER {
  quest::emote("collapses from hunger.");
  $npc->Depop(1);
} 

sub EVENT_ITEM {
  #accepts items in the range: 58380 - 58637
  my $i = 0;

  for ($i = 58380; $i<=58637 ; $i++) {
    if($itemcount{$i}) {
	  my $c = $itemcount{$i};
      if (plugin::check_handin(\%itemcount, $i => $c )) {
        quest::faction(1770,5 * $c );
        quest::exp(100000 * $c );
quest::ding();
        $counter += $c;
      }
    }
  }
  if($counter >= 11) {
    $npc->Depop(1);
  }
  plugin::return_items(\%itemcount);
}
