sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_WAYPOINT_ARRIVE {
    if($wp == 18) {
    quest::say("Have you noticed anything strange about Commander Bayle lately? I saw him talking to that trouble-making Irontoe the other day and one night late last week, when I was on patrol, I saw him sneaking into Crow's");
	quest::signal(2094,1)
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello, $name.  My name is Ginton Firepride.  My pop owns a smithy in South Qeynos if you're looking for some new equipment."); }
}
#END of FILE Zone:qeynos2  ID:2110 -- Guard_Aerryn 

