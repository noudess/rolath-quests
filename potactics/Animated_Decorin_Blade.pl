#Five Animated Decorin Blades spawn when Tagrin Maldric is aggro'd. This quest file will depop them if they aren't aggro'd for fifteen minutes after spawning.

sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::settimer("depop",900);
}

sub EVENT_AGGRO {
  quest::stoptimer("depop");
}

sub EVENT_DEATH {
  quest::stoptimer("depop");
  if($entity_list->GetMobByNpcTypeID(214054)) {
    quest::spawn2(214119,0,0,$x,$y,$z,$h);
  }
}

sub EVENT_TIMER {
  if ($timer eq "depop") {
    quest::stoptimer("depop");
    quest::depop();
  }
}
