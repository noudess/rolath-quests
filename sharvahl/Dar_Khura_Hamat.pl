sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("How may I help you? What are you looking for?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Dar_Khura_Hamat
