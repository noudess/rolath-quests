sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You seem a little out of place here. You should go back to the nice little village you came from. This place will eat you alive. The [Golden Rooster] is no place for you.");
}
if($text=~/what Blackburrow Stout/i){
quest::say("Blackburrow Stout is the finest drink available. It is the nectar of the gods. Well.. nectar of the gnolls at least. I can't wait until they hold another drink special in the Rooster. When I hear that. I am there!");
}
if($text=~/what Golden rooster/i){
quest::say("The Golden Rooster only happens to be the finest gambling house in Highpass. It is also the only place in these parts that serves [Blackburrow Stout]."); }
}

sub EVENT_ITEM
	{
	if ($faction <= 5 && plugin::check_handin(\%itemcount, 13130 => 1))
		{
		quest::say("Why thank you, kind citizen! Mutt, throw me the package! Here. This is for your boss. Do not return return to Kane without the other two lists. Some other bixie boy might just beat you to one of the other pieces. Go to Freeport. There you will find a woman called Opal. Quite a looker. I hear she works with the Arcane Scientists. Tell her the disease is spreading. She will help you.");
		quest::summonitem(18808);
		# Faction verified on Live
		quest::faction(336,20);
		quest::faction(229,20);
		quest::faction(329,2);
		quest::faction(230,1);
		quest::faction(330,3);
		quest::exp(400);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}
 
#END of FILE Zone:highpass  ID:5021 -- Barn_Bloodstone 
