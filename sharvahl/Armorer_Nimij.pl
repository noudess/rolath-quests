sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Are you looking for something special, friend?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Armorer_Nimij
