sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Yes, what is it? If you are here for training, read the note in your inventory and hand it to me. Otherwise I don't have time to waste with you!.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18754 => 1)) {
    quest::say("Welcome, young magician. I am Jayna D'Bious. You have much to learn, so let's get you started. Here is your guild tunic. Once you are ready to begin your training please make sure that you see Morgalanth Tal`Raeloen, he can assist you in developing your hunting and gathering skills.");
    quest::summonitem(13583);
    quest::exp(100);
	quest::faction(363, 100);
	quest::faction(239, -15);
	quest::ding();
  }
}
#END of FILE Zone:neriakb  ID:41054 -- Jayna_D`Bious
