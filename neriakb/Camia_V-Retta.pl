sub EVENT_SAY
	{
	quest::emote("turns her hateful scowl towards you as you get your bearings.");
	quest::say("You best be here for training or I will have your tongue! If you are here to learn the ways of the Enchanter, read the note in your inventory and then hand it to me so we can begin.");
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18753 => 1)) {
    quest::say("Greetings, and welcome to the Tower of the Spurned! I am Camia V'Retta, master enchantress. Here is your guild tunic, wear it with pride. Once you are ready to begin your training please make sure that you see Morgalanth Tal`Raeloen, he can assist you in developing your hunting and gathering skills.");
	# Factions verified on live
    quest::summonitem(13584);
	quest::faction(239, -15);
	quest::faction(363, 100);
    quest::exp(100);
	quest::ding();
  }
}
#END of FILE Zone:neriakb  ID:41052 -- Camia_V`Retta
