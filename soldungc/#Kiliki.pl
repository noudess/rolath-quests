##Kiliki.pl
#Kiliki's Goblin Heads
#This quest and Gitog's are supposed to be almost identical from what I understand.
#I have no text for him, but I can make him take the heads and give the
#proper reward and faction hits.

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Bring me the heads of brain scorched goblins and I will reward you, $name.");#text made up, I have no text.
  }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55252 => 4)) {#Brain-Scorched Goblin Heads
    quest::say("These will be no more threat.  Take this, $name.");#text made up
    quest::exp(1750000);#1% of Level 51 xp
quest::ding();
    quest::summonitem(55240);#Enchanted Lava Spider Blood
    quest::faction(258, 10);#Goblins of Fire Peak
    quest::faction(1732, -30);#Tribe Vrodak
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#Done
