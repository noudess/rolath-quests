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
quest::say("Hello $name.  My name is Rashik Hiccs and I would like to welcome you to Qeynos on behalf of all the guards.  If you get into trouble, just find one of us and we will help you out."); }
}
