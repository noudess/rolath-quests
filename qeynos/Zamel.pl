sub EVENT_SPAWN {
	#:: Create a timer "complain" that loops every 300 seconds (5 min)
	quest::settimer("complain", 300);
}

sub EVENT_TIMER {
	#:: Match timer "complain"
	if ($timer eq "complain") {
		my $randomChance = quest::ChooseRandom(1,2,3,4,5);
		#:: Match if greater than 4 (20 percent chance)
		if ($randomChance > 4) {
			quest::say("Clean the [aqueducts] they tell me. Peh, they don't pay me enough to climb into that filth!");
		}
	}
}

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, good $name.  My name is Zamel and I have the much coveted duty of pulling sludge up out of the pools and [aqueducts] of Qeynos..");
    }
  if($text=~/aqueducts/i){
    quest::say("Aye, the aqueducts are a horrible place.  I have heard rumors of horrible [beasts] who live under the city in the water and just the other day, a child playing in the water just up and disappeared!");
  }
  if($text=~/what beasts/i){
    quest::say("I know nothing of what or where they may be, just rumors, friend.  However, should you foolishly choose to enter the waters to brave the possibilities and return with some evidence of the [child's] fate, I would be most appreciative.");
  }
  if($text=~/what child/i){
    quest::say("The daughter of one of our own guardsmen is missing.  He has offered me a reward for any information about her disappearance.  So, if you find out anything, let me know and I will cut you in on the reward.");
  }
}

sub EVENT_ITEM {
  if($faction <= 6 && plugin::check_handin(\%itemcount, 13713 => 1)){
    quest::say("Yes,  I do believe this was the child's dress.  Here, take this as your share of the reward.  Her father will be heartbroken..");
    my $ZamelReward = int(rand(100));
    if ($ZamelReward<=35){
      quest::summonitem("10320","1");
    }
    else {
      quest::summonitem("10018","1");
    }
    quest::givecash("0","4","0","0");
	# Faction and XP verified on live
    quest::faction(262,2); #Guards of Qeynos
    quest::faction(219,1); #Antonius Bayle
    quest::faction(230,-1); #Corrupt Guards of Qeynos
    quest::faction(223,-1); #Circle Of Unseen Hands
    quest::faction(291,1); #Merchants of Qeynos
    quest::exp("719");
	quest::ding();
  }

  plugin::return_items(\%itemcount);
}

#End of updated file Zamel.pl
