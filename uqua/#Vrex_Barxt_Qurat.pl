my $hpatinvul = 0;

sub EVENT_SPAWN {
  quest::settimer(1,180);
  quest::settimer(3,1);
  quest::setnexthpevent(40);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::settimer(2,30);
    quest::spawn2(292072,0,0,-830,-83,59,478);
    quest::spawn2(292072,0,0,-822,-77,59,474);
    quest::spawn2(292072,0,0,-813,-74,59,472);  
    quest::spawn2(292072,0,0,-921,-76,59,32);
    quest::spawn2(292072,0,0,-911,-79,59,22);
    quest::spawn2(292072,0,0,-902,-83,59,26);
    quest::spawn2(292072,0,0,-886,117,59,226);
    quest::spawn2(292072,0,0,-895,112,59,228);
    quest::spawn2(292072,0,0,-904,109,59,226);
    quest::spawn2(292072,0,0,-808,102,59,290);
    quest::spawn2(292072,0,0,-817,106,59,282);
    quest::spawn2(292072,0,0,-827,110,59,270);
    quest::depopall(292071);
    quest::modifynpcstat("special_attacks","ABfHG");
    $hpatinvul = $npc->GetHP(); #remember HP when mob went invulnerable
    $npc->WipeHateList();
  }
  elsif ($timer == 2) {
    #safety check for signal getting lost
    $signal = 1;
    EVENT_SIGNAL();
  }
  if($timer == 3){
   if($y < -250) {
    $npc->GMMove(-869,-16,65,250);
   }
  } 
}

sub EVENT_HP {
  if($hpevent == 40) {
    quest::spawn2(292074,0,0,-748,16,60,382);
    quest::spawn2(292075,0,0,-985,15,60,124);
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    $npc->SetHP($hpatinvul);
    if(!$entity_list->GetMobByNpcTypeID(292072)) {
      quest::modifynpcstat("special_attacks","RFQUMCNIDFf");
      if($entity_list->GetMobByNpcTypeID(292070)) {
        quest::spawn2(292073,0,0,-866,-43,61,260);
        quest::depop(292070);
      }
      quest::settimer(1,180);
      quest::stoptimer(2);
    }
  }
}

sub EVENT_DEATH {
  quest::spawn2(292076,0,0,$x,$y,$z,$h);
}
