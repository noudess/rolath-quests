sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13241 => 1)) { #Full Bottle of Elixir
    quest::say("Mmmm.. I feel much warmer. Thank you. You should now find Bryndin McMill. He could use a swig also. I saw him hanging around two other guards.");
    quest::ding();
    quest::exp(125);
	# Verified ZAM
    quest::faction(328,1); #Merchant's of Halas
    quest::faction(327,1); #Shaman of Justice
    quest::faction(311,1); #Steel Warriors
    quest::faction(320,5); #Wolves of the North
    quest::summonitem(13242); #3/4 Full Bottle of Elixir
  }
  else {
    quest::say("No thanks.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:everfrost  ID:30072 -- Talin_O`Donal
