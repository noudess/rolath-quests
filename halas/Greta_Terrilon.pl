 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Greta Terrilon
## ID: 29036
## ZONE: halas
##
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You will have to excuse me. I am quite busy.");
  }
  if($text=~/some ink/i) {
    quest::say("Jinkus must've sent ye fer some of me special ink made frrom the pigment of th' datura flower. Ye may take some free o' charge as a donation to the church and to the will of the Tribunal as well.");
    quest::summonitem(12619); #Vial of Datura Ink
  }
}

sub EVENT_ITEM {
  quest::say("I do not need this.");
  plugin::return_items(\%itemcount);
}
