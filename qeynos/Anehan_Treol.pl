sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah.. Hello there..  $name, was it?  Yes, right, $name.  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18021 =>1 )) {
    quest::say("Oh, hello there, $name.  Report time huh?  Well, here ya go...pretty slow as usual.  See ya later,  $name.");
    quest::summonitem(18022);
    quest::faction(284,10);	#league of antonican bards
   quest::faction(281,1);		#knights of truth
   quest::faction(262,1);		#guards of qeynos
   quest::faction(304,-1);		#ring of scale
   quest::faction(285,-1);		#mayong mistmoore
   quest::exp(200);
quest::ding();
    
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL
	{
	quest::say("Oh, didn't you hear?  I forget that you've been away on vacation.   No, I got bit by too many dogs delivering mail.  I'm not down with that sort of nonsense!");
	quest::signalwith(1305,5,2);
	}
#END of FILE Zone:qeynos  ID:1003 -- Anehan_Treol 

