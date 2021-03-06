#BeginFile: Elishia_Leafrunner.pl
#Quest for South Felwithe - Elishia Leafrunner: Jeremy's Letter

sub EVENT_SAY {
  if($text=~/letter back to him/i) {
    quest::say("Thank you. Take this letter and see that he gets it."); #Real text still needed
    quest::summonitem(8970); #Letter to Jeremy
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8969=>1)) { #Letter to Elishia
    quest::say("Oh, a letter from my grandson? Thank you very much. I haven't been able to talk to him recently. Would you mind taking a [letter back to him] for me?");
    quest::faction(275,20);  #Keepers of the Art
    quest::faction(279,20);  #King Tearis Thex
    quest::faction(246,20);   #Faydarks Champions
    quest::faction(239,-20); #The Dead
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
} 
