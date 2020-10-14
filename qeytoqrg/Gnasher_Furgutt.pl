###################################################
# NPC: Gnasher_Furgutt.pl
# Part of the Gnashers Head quest And blackburrow stout quest
# Loot items: A Gnoll Head, identifies as Gnasher's Head (13309)
# A Note (18800)
# Zone: qeytoqrg
# By Andrew80k
# modified by Mitzrugi
##################################################

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		if ($faction >= 7)
			{
			# Saw this at Dubious
			quest::say("I know of you!  You leave before Gnasher calls gnoll watchers.  You are no friend of gnolls or Gnasher's human friends...");
			}
		else
			{
			quest::say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
			}
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18800 => 1)) {
    quest::say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
	# Faction verified on live
	# Accepeted turnin at dubious despite hail text
    quest::summonitem(13131);
    quest::faction(223,5);
    quest::faction(291,-1);
    quest::faction(230,1);
    quest::faction(262,-1);
    quest::faction(273,1);
	quest::ding();
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}

