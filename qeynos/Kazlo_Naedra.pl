sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 10) {
    quest::say("Hey guys, you got any blank scroll sheets for sale? Or know where I could get some around here?");
	quest::signalwith(1115,3,1);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name.  I'm Kazlo Naedra of the Order of Three.  We always seem to be running out of [supplies] around here, which is, of course, very distracting to our studies.");
}
if(($text=~/what supplies/i) && ($faction > 4)){
quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!"); }


if(($text=~/what supplies/i) && ($faction <= 4)){
    quest::say("Yes, we're almost out of [blank scroll sheets]. Gahlith will be very upset, unless I can replenish our inventory soon.");
}

if ($text=~/blank scroll sheets/i) {
  quest::say("These blank sheets seem harder to find every month. All the local merchants are out of them. Hopefully, one of the merchants out in Surefall will have some.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18006 =>1 )) {
    quest::say("Good work, $name! Here's a little something for your troubles. Your quick work and loyalty will be noted by the Order of Three.");
    quest::exp(500);
	quest::ding();
	#Factions verified on ZAM
    quest::faction(342,5); #Order of Three
    quest::faction(262,1); #Guards of Qeynos
    quest::faction(221,-1); #Bloodsabers
    quest::faction(296,-1); #Opal Darkbriar
    quest::givecash(9,0,0,0);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1063 -- Kazlo_Naedra 

