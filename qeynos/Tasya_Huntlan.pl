###########################################
# NPC:  Tasya Huntlan
# Quest: Nitrates and the Assassin
# Author: Unknown
# Updated:  Andrew80k
###########################################

sub EVENT_SAY { 

   if($text=~/Hail/i){

      quest::say("Hail, $name!  Are you just visiting Qeynos?  We have plenty of rooms available or, if your throat is parched, you can always visit Earron in our pub."); 
   }
  if ($text=~/tax/i) {
    quest::say("Taxes?  Oh, that time again, huh?  Here you are.  Give Vicus our best.  I hear he is under the weather.");
    quest::faction(291, -1);
    quest::summonitem(13176);
  }

}
sub EVENT_SIGNAL {
    if ($signal==2) {
        quest::say("Yes.  He is staying here at the Lion's Mane Inn, but it is against regulations to give out room numbers.  I can tell you that he loves to see the sun rise over the ocean.");
    }
}

#END of FILE Zone:qeynos  ID:1104 -- Tasya_Huntlan
