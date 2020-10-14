my $counter = 0;
#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
}
  
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm thirsty, I require tea.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground, perished");
  $npc->Depop(1);
}

sub EVENT_ITEM {
  #accepts items in the range: 58687 - 58704
  my $i = 0;

  for ($i = 58687; $i<=58704 ; $i++) {
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
