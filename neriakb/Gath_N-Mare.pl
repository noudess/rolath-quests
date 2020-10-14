sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("I am Gath N`Mare. Read the note in your inventory and hand it to me so that you may begin on the path of the Wizard. True power can be yours should you have the will to train hard enough!.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18755 => 1)) {
    quest::say("'I am Gath N'Mare, master wizard of the Tower of the Spurned. Welcome to our guild. Let's get started, shall we? Here is your tunic, represent us well with it. Morgalanth Tal`Raeloen is our beginning guild trainer. He will teach you the basics and give you a solid learning foundation of magic.");
    quest::summonitem(13582);
    quest::exp(100);
	quest::ding();
	# Factions Verified
	quest::faction(363, 100);
	quest::faction(239, -15);
  }
}
#END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare
