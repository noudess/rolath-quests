###################################
#Zone: Ak`Anon                    #
#Short Name: akanon               #
#Zone ID: 55                      #
###################################
#NPC Name: Wuggan_Azusphere       #
#NPC ID: 55134                    #
#Quest Status: Complete           #
###################################

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18772 => 1)) {
    quest::say("Welcome to Library Mechanimagica. I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning. Here is our guild tunic, make us proud.");
    quest::summonitem(13521);
    quest::faction(245,1);
    quest::faction(238,-2);
    quest::faction(239,-2);
    quest::faction(255,1);
    quest::faction(333,1);
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}
