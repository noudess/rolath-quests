sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name.  Care to help the city?  Bring me four rat whiskers and I'll reward you with some spare coin.");  #adlib text
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13071 =>4 )) {
  quest::exp(145);
  quest::ding();
  quest::faction(336,1 );
  quest::faction(330,1 );
  quest::faction(281,1 );
  quest::faction(362,1 );
  quest::givecash(5,2,1,0);
    
  }
}
