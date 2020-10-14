# begin -- quests/qeytoqrg/Axe_Broadsmith.pl

# Axe Broadsmith, Qeynos Hills, Steel Warrior Initiation quest
# BatCountry

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("Greetings. The fishing is sparse here. You would fare better at [Lake Rathe].");
   }
   if($text=~/Lake Rathe/i){
      quest::say("Beyond the Plains of Karana can be found a pass to Lake Rathe. I have heard stories of a giant water beast and underwater cities. I wish I knew how to swim.");
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 18893 => 1)) #A Sealed Letter
   {
      quest::unique_spawn(4192,0,0,1055,3858,-19); # a_strange_skeleton
      quest::say("So you are the new warrior. Let us test your skill. Across the pond is a skeleton. See him? Engage him in combat. He awaits. Return his skull to me and I shall call you a Steel Warrior. Be quick. He will dissipate soon.");
      quest::settimer(86,60 * 10); #depop in 10 minutes... it's a 6th level mob a few feet away. kill it faster
	  # verified
      quest::faction(311,2);     # Steel Warriors better
      quest::faction(262,1);     # Guards of Qeynos better
      quest::faction(230,-1);     # Corrupt Qeynos Guards worse
      quest::faction(330,-1);    # Freeport Militia worse
      quest::faction(281,1);     # Knights of Truth better
	  quest::exp(200);
	  quest::ding();
   }
   
   if(plugin::check_handin(\%itemcount, 13397 => 1)) # Skull
   {
      quest::say("So you have returned. Victory is yours, young Steel Warrior. Take this letter of recommendation to Brin Stolunger at the arena in Qeynos. You have passed.");
      quest::summonitem(18895); # Letter of Recommendation
	  # verified
      quest::faction(311,5);     # Steel Warriors better
      quest::faction(262,1);     # Guards of Qeynos better
      quest::faction(230,-1);     # Corrupt Qeynos Guards worse
      quest::faction(330,-1);    # Freeport Militia worse
      quest::faction(281,1);     # Knights of Truth better
	  quest::exp(200);
	  quest::ding();
      quest::givecash(7,0,0,0);
   }

   plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
   if($timer == 86)
   {
      quest::depopall(2700052);
   }
}
# end -- quests/qeytoqrg/Axe_Broadsmith.pl 
