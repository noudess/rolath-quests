sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Oh, it's so nice to see you again $name. Why don't you have a look around and buy something nice for yourself today?"); }
if ($text=~/tax/i) {
    quest::say("Oh dear.  We had forgotten about those pesky taxes.  Here you go, $name.  Sorry you had to come collect them.  We will try to be on time from now on.");
    quest::faction(291, -1);
    quest::summonitem(13179);
  }
}
#END of FILE Zone:qeynos  ID:1119 -- Voleen_Tassen 

