sub EVENT_SAY {
 if($text =~ /Hail/i) {
	# Factions verified on live.
	if ($faction >= 6)
		{
		quest::say("How dare you speak with me, the Commander of the Qeynos Guards?!  The reports on you have told me that we look forward to seeing your name on the most wanted list.  Until then, stay far from me or find yourself in shackles!");
		}
	else
		{
		# Seen on live at Indifferent
		quest::say("Hail citizen!  I am afraid you are not allowed in this building.  You will have to leave.  Good day to you.");
		}
 }
  if($text=~/donate to the temple of thunder/i) {
    quest::say("Why of course!!  I would love to contribute to your esteemed organization.  I would just hate to see the Knights of Thunder crumble.  What would ever happen to Qeynos if their noble order were gone?!  Perish the thought!");
	quest::summonitem(13292);
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
