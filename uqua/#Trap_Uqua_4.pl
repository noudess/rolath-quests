#rage trap 1

sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-794,-1249,3,374);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-764,-1261,3,382);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-764,-1240,3,382);
  quest::ze(15,"A trusik in the distance shouts, This cannot be possible. They located the Temple of Rage! Attack them, now!");
  $npc->Depop(1);
}
