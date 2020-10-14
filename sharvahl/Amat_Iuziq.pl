sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 6265 =>1 )) {
  quest::say("Ah so there you are we've been expecting you. Take this spear and go speak with Arms Historian Qua. He can provide further instructions.");
  quest::summonitem(6147);
}
if (plugin::check_handin(\%itemcount, 5544 =>1, 6268 =>1 )) {
	quest::say("This spear is very well crafted! Your work is very impressive. Please go see Ahom Guzhin. He hangs out near Grimling Forest most days. The sonic wolf spear was the result of some of his original studies in the moor. He has dedicated his life to studying creatures of the moor and can almost always be found there. Be careful when you go looking for him. You've done well here, but don't get careless. Good journeys.");
  quest::shout("Hear me fellow Vah Shir! We hereby promote $name to the rank of journeyman. His wisdom grows daily. We are proud as should you all be. May this student of our ways continue to progress and live worthy of our noble heritage.");
  quest::summonitem(6268);
  quest::summonitem(6267);
  quest::exp(10000);
quest::ding();
}
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Amat_Iuziq
