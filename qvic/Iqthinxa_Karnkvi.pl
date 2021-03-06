sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
    quest::spawn2(295131,0,0,84,423,-410,168);
    quest::spawn2(295132,0,0,126,310,-422,464);
    quest::spawn2(295133,0,0,267,283,-410,248);
    quest::modifynpcstat("special_attacks",ABfHG);
    #safety check for lost/missed signal from ravs.
    quest::settimer(1,60);
    $npc->WipeHateList();
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    CheckForRavs();
  }  
} 

sub EVENT_TIMER {
  CheckForRavs();
}

sub CheckForRavs {
  if((!$entity_list->GetMobByNpcTypeID(295131)) && (!$entity_list->GetMobByNpcTypeID(295132)) && (!$entity_list->GetMobByNpcTypeID(295133))) {
     quest::modifynpcstat("special_attacks",SRTMCNIDf);
	 quest::stoptimer(1);
  }
}
