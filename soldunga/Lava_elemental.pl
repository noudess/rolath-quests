sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_AGGRO {
	my $random = int(rand(4));
	if($random == 0) {
		quest::say("it's ${class}s like you that insult all of Norrath!");
	}
	if($random == 1) {
		quest::say("${class}s like you always bring out the worst in me!");
	}
	if($random == 2) {
		quest::say("${class}s like you are an affront to my senses!");
	}	
	if($random == 3) {
		quest::say("${race}s are better left dead than alive!");
	}	
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}
