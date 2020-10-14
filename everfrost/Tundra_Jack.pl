sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		if($combat_state ==1) {
			quest::say("On my way, Iceberg!!");
		}
	}
	if($signal == 2) {
		quest::say("Ha!!  Looks like old Iceberg likes you.  Either that or he's tasting you.");
	}
}

sub EVENT_COMBAT {
	my $random = int(rand(5));
	if($combat_state == 1) {
		if($random ==1) {
			quest::say("Let me show you how the dwarves taught me to use my mining picks!!");
		}
	}
	if($combat_state == 0) {
		if($random ==1) {
			quest::say("Fer Halas!! One more victory fer the Wolves o' the North!!");
		}
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if(($wp eq 14) || ($wp eq 45)) {
		quest::say("Come on, Iceberg! Time to do a little mining.");
	}
	if(($wp eq 16) || ($wp eq 17) || ($wp eq 18) || ($wp eq 47) || ($wp eq 48)) {
		quest::say("Silver and Gold!!.. Silver and Gold!!");
	}
	if(($wp eq 19) || ($wp eq 49)){
		quest::say("Nothin'!!");
	}
}

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Good mining to you, kid! What are you doing way out here? You're gonna catch frostbite. The name's Tundra Jack, prospector supreme. Trained by the finest miners in Kaladim!! Me 'n [Iceberg] have been out here for three years now, searchin' fer fortune.");
	}
	if($text=~/iceberg/i){
		quest::say("Iceberg used to be a beast.  He terrorized Halas for some time, then he met me.  I tamed the beast and now he watches my back.  You never know when the ice giants may go for a stroll from [Permafrost]."); 
	}
	if($text=~/permafrost/i){
		quest::say("It's said that Permafrost used to be the lair of the ice giants.  Most up and left for the icy continent of Velious.  Now Permafrost is a haven for ice goblins and a few straggling giants.  I have also hears rumors of a dragon within.  I bet its lair is filled with silver and gold!"); 
	}
	if($text=~/sweaty shirt/i){
		quest::say("Looking fer that blasted shirt, huh?  Well, as you can smell, I didn't get to washing it, but I wrapped it onto Iceberg's collar. I'd say you can have it, but Iceberg kind of likes it now.  The only way you're gonna be able to grab it from him is to feed him his [favorite meal].");
	}
	if($text=~/favorite meal/i){
		quest::say("Iceberg has some picky eating habits.  If he can't catch any goblins, he prefers [Lion Delight].  Lion Delight is his favorite."); 
	}
	if($text=~/lion delight/i){	
		quest::say("I usually get Lion Delight from Teria O'Danos in Halas."); 
	}
	if($text=~/Megan/i){	
		quest::say("Megan? Just a young warrior of the Wolves of the North. She sorta likes hangin' around ol' Tundra Jack. Must be my good looks."); 
	}
}

#END of FILE Zone:everfrost  ID:30069 -- Tundra_Jack 

