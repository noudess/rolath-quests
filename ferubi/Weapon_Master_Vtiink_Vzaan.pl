sub EVENT_SPAWN {
  quest::spawn2(284093,0,0,1254,-563,106,70);
  quest::spawn2(284094,0,0,1256,-419,106,204);
  quest::spawn2(284095,0,0,1402,-418,106,328);
  quest::spawn2(284096,0,0,1400,-565,106,454);
}

sub EVENT_DEATH {
  quest::signalwith(284074,1,1);
}

sub EVENT_COMBAT {
  if($combat_state == 0) {
    quest::depopall(284093);
    quest::depopall(284094);
    quest::depopall(284095);
    quest::depopall(284096);
    quest::depop();
  }
}


 
