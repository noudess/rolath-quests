#BeginFile: Neclo_Rheslar.pl
#Quest for Qeynos Hills - Neclo Rheslar: Note to Neclo

sub EVENT_SAY {
  #Nothing identified to say!
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18823=>1)) { #Note to Neclo
    quest::say("Ah.. Hello friend.. So, I see Daenor sent you.. Uh huh, ok.. Here's something that will be very useful for you. Practice this well, friend.. It will help protect you in this harsh world.");
	# This is verified
    quest::faction(342,5);  #Order of Three
    quest::faction(221,-1);  #Bloodsabers
    quest::faction(262,1);  #Guards of Qeynos
    quest::faction(296,-1); #Opal Dark Briar
    quest::exp(1000);
	quest::ding();
    quest::summonitem(15288); #Spell: Minor Shielding
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}


#END of FILE Zone:qeytoqrg  ID:4106 -- Neclo_Rheslar 

