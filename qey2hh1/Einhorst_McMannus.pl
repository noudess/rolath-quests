 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Einhorst McMannus
## ID: 12091
## ZONE: qey2hh1
##
############################################

my $rS = int(rand(10));
#Above 3 variables are used to generate random gold silver and copper coin returns

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. Welcome to the fishing village of Clan McMannus. We sell what we can here. Have a look around but, please do not buy too much. We must save most of our stock for delivery to our home.");
  }
  if($text=~/searching for the fugitive/i) {
    quest::say("I see they have sent someone to hunt the scoundrel down.  I am afraid I haven't seen the barbarian thief in quite some time.  You can search and search for him here in the western plains, but I doubt you shall find him.  Good luck.");
  }  
  if($text=~/lion meat shipment/i) {
    quest::say("Oh, yes, the lion meat shipment. Aye, it's here somewhere. Just a moment. Ah! Here you go. Apologize for the delay in this.");
    quest::summonitem(13961); #Lion Meat Shipment
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18831 => 1)) { 
    quest::say("Yes.  We almost forgot of the shipment of Karana clovers.  Here you are, my friend.  Back to the north with you.  I am sure the Shamans of Justice will need this.");
    quest::exp(100);
    quest::ding();
    quest::givecash(0,$rS,0,0);
	# Verified Zam
    quest::faction(320,1);  #Wolves of the North
    quest::faction(327,1);  #Shamen of Justice
    quest::faction(328,1);  #Merchants of Halas
    quest::faction(311,1);  #Steel Warriors
    quest::summonitem(13962); #Karana Clover Shipment
  }
  else {
    quest::say("I do not need this, $name.");
    plugin::return_items(\%itemcount);
  }
}

