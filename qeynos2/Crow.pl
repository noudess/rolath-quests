#The Tattered Pouch
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		if ($faction >= 6) # tested at apprehensive
			{
			quest::say("Heh... With all you've done, I'm suprised you're still alive.");
			}
		else
			{
			quest::say("Welcome to Crow's! If you're thirsty, we have a fine selection of brews and ales.");
			}
		}
	}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 17600 => 1)){
      quest::say("What are you? The Rat's new bag man? Peh, he is useless. That bum drinks any gold he gets. Here ya go, kid!");
      quest::summonitem(13901);
      quest::givecash("0","0","6","0");
      # Verified on live
      quest::faction(223,2); # +Circle of Unseen Hands
      quest::faction(291,-1); # -Merchants of Qeynos
      quest::faction(230,1); # Corrupt Qeynos Guards
      quest::faction(262,-1); #-Guards of Qeynos
      quest::faction(273,1); # Kane Bayle
      quest::exp(100);
      quest::ding();
      }
plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("You ok Sabs?");
    quest::signalwith(2083, 2, 1);
  }
  if($signal == 2) {
	quest::say("Do you want me to toss his ass out?");
	quest::signalwith(2083, 5, 1);
    }
  if($signal == 3) {
    quest::say("Excellent. To think that he thought he could stroll in here from Highpass and take over my action. He will learn the hard way what happens to merchants who think they can operate here without our support and protection.");
     }
if($signal == 4) {
    quest::say("Anything you say, my love.");
     }
	if ($signal == 5)
		{
    	quest::say("Bwah! Ha! Ha! I love it when he does that!  HA HA HA!!! You are too much Flynn!");
		}
}


#END of FILE Zone:qeynos2  ID:2054 -- Crow.pl
