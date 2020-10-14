sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("Are you here to seek the ways of the Dark Truth?  If that is the case, then read the note in your inventory and then hand it to me.  If you are not here for such a purpose, I suggest you leave at once lest you anger me further."); }
}
sub EVENT_ITEM { 
 if ($item1==18017){quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Faratain, he can assist you in developing your hunting and gathering skills.");
	quest::summonitem("13573");
    quest::faction(265,100);
    quest::faction(231,-100);
    quest::faction(233,-100);
    quest::faction(242,-100);
    quest::faction(254,-100);
	quest::exp("100");
quest::ding();
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:paineel  ID:75111 -- Mandaril_Dark_Knife 

