sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah..  good day. friend.  My name's Leanon Ruksey. loyal member of the League of Antonican Bards..  Qeynos Chapter. of course.  It's part of my job to keep up with the goings-on of the city. who's coming and going and all that.  So we usually keep a man here and one at the docks.  Anyway. nice chatting with you..  be careful out there!"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18020 =>1 )) {
    quest::say("Ah, hello there, $name. It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.");	#not verified on live but updated to match Quinon for faction and exp
    quest::summonitem(18024);
    quest::faction(284,10);    #league of antonican bards
   quest::faction(281,1);      #knights of truth
   quest::faction(262,1);      #guards of qeynos
   quest::faction(304,-1);     #ring of scale
   quest::faction(285,-1);     #mayong mistmoore
   quest::exp(200);
quest::ding();
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2012 -- Leanon_Ruksey 

