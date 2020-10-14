# Part of quest for Bracer of the Reverent

sub EVENT_DEATH_COMPLETE {
  quest::unique_spawn(13042, 0, 0, -1560, 1450, 50, 251); #spawn Regis_the_Reverent
  quest::spawn_condition("northkarana", 3, 0);
}

# Quest by mystic414

