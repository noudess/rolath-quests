sub EVENT_SPAWN {
  quest::shout("AH HAH! I am corporeal once more! I cannot hold this form for long, but it will be long enough for me to rip open that flea brothel and..well, I wont spoil it for you, heheheheh. Come! Assist me in the attack on the Kejekan village! The one that wears the iron beads must die at my hands and NO OTHER! Just make sure I get to him and you will be rewarded.");
  quest::SetRunning(1);
}

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 6) {
    quest::unique_spawn(100133, 0, 0, -629, 1219, 1028, 79); #Disciple_Okarote
  }
}
