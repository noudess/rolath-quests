sub EVENT_SPAWN {
  quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
  quest::ze(15,"The stone tile beneath your feet shifts, setting a complex trap into motion. Amidst the muffled sounds of grinding gears and grating stone you notice the clay golems nearby are stirring. A chill runs down your spine as you realize what you've done. They stumble forth to attack, dried flakes of clay raining from their ancient bodies.");
  quest::depopall(296002);
  quest::spawn2(296048,0,0,-454,-500,-72,384);
  quest::spawn2(296048,0,0,-494,-401,-72,256);
  quest::spawn2(296048,0,0,-533,-500,-72,108);
  $npc->Depop(1);
  my $instid = quest::GetInstanceID("inktuta",0);
  quest::setglobal($instid.'_inktuta_status',5,3,"H6");
}
