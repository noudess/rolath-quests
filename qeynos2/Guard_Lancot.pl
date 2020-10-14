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
quest::say("Greetings $name.  Welcome to the fine city of Qeynos!  If you wish to join our fight against the evil gnolls of Blackburrow, be sure to talk to Captain Tillin in The Hall of Steel."); }
}

