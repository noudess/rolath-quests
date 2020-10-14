sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_SAY 
	{
	if($text =~ /Hail/i) 
		{
		# Faction Apprehensive (new Karana Human Paladin)
		# Faction Dubious (new Agnostic Erudite Mage)
		quest::say("Hail!  Please leave here immediately.  This no place for a common citizen");
		}
	}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
