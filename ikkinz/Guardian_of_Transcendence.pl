sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
     $npc->WipeHateList();
     $npc->GMMove(445,-489,-45,418);
     quest::setnexthpevent(75);
     quest::setglobal("ikkydoor",1,3,"H6");     
  }
  if($hpevent == 75) {
     $npc->WipeHateList();
     $npc->GMMove(671,-714,-50,382);
     quest::setnexthpevent(50);
     quest::setglobal("ikkydoor",2,3,"H6");     
   }
   if($hpevent == 50) {
      $npc->WipeHateList();
      $npc->GMMove(534,-210,-50,144);
      quest::setglobal("ikkydoor",3,3,"H6");     
   }
}  

sub EVENT_DEATH {
  quest::spawn2(294593,0,0,530,-261,-50,138);
  quest::spawn2(294598,0,0,531,-157,-50,252); 
  quest::spawn2(294599,0,0,522,-233,-50,136);
  quest::spawn2(294600,0,0,516,-182,-50,136);
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout5", 1, "H6", 293115, $charid, 293);
  }
}
