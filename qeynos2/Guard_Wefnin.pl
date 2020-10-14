sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail $name.  If you are looking for the way to South Qeynos, the passage through the city wall south of the cobbler's shop leads to Merchant's Square near the Clock of Ak'Anon."); }
}
