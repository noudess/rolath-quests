my $counter = 0;
#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm starved, I require barbequed cragbeast.");
  }
}

sub EVENT_TIMER {
  quest::emote("crashes to the ground, starved.");
  $npc->Depop(1);
}
  
sub EVENT_ITEM {
  #accepts items in the range: 58472 - 58554
  my $i = 0;

  for ($i = 58472; $i<=58554 ; $i++) {
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
