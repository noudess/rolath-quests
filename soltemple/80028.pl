sub EVENT_SAY {
  if ($text=~/solusek ro/i) {
    quest::say("Solusek Ro is the Master of Fire and the Keeper of Power.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE
	{
	quest::spawn2(80040,0,0,$x,$y,$z,$h);
	}

#End of File, Zone:soltemple  NPC:80028 -- a_seeker (generic)
