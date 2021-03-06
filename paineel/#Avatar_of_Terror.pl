#BeginFile paineel\#Avatar_of_Terror.pl
#Quest for Paineel - Avatar of Terror: Terror Forged Mask
#
#Status: Incomplete
#Issue1: Create Spawn - 'Avatar of Terror'
#Issue2: Get correct text
#Issue3: Get correct faction hits
#

sub EVENT_SPAWN {
  quest::settimer("TerrorShouting", 5);
  quest::settimer("TerrorDepop", 120); #Despawn after 2 minutes
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 00000 => 1)) { #Mundane Mask
    quest::say("A desciple of Cazic-Thule! Take this forged item as a gift."); #Text made up
    quest::summonitem(14108); #Terror Forged Mask
    quest::exp(10000); 
quest::ding();
    quest::stoptimer("TerrorShouting");
    quest::stoptimer("TerrorDepop");
    quest::depop();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  if($timer="TerrorShouting") {
    quest::shout("My time is short, make haste! I will forge one item for the faithful of our lord, Cazic-Thule."); #Need real text
  }
  if($timer="TerrorDepop") {
    quest::stoptimer("Shouting");
    quest::stoptimer("TerrorDepop");
    quest::depop();
  }
}
#END of FILE Zone:paineel  ID:????? -- Avatar of Terror
