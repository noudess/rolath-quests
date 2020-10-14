sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::emote("flutters about and seems to be staring back at you as if reading and understanding your thoughts!!");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12271 => 1)){
		quest::emote("gladly gulps up your odd mixture and transforms into..!!");
		quest::unique_spawn(51176,0,0,$x,$y,$z,$h);
		quest::ding();
		quest::faction(5001, 10);
		quest::faction(226, 10);
		quest::faction(279, 10);
		$npc->Depop(1);
	}
	else {
		plugin::return_items(\%itemcount);
	}
}

