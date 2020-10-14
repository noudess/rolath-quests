sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 10) {
    quest::say("Hey Hanns.. Have you gotten word from Prak about the spy in Carson's guards?");
	quest::signalwith(2074,1,1)
  }
}

sub EVENT_SIGNAL {
  if(($x == 163) && ($y == 144) && ($signal == 1)) {
    quest::say("Yeah, whatever, Knarg. If I were you, I wouldn't mess around with [Renux]. She's in tight with [Hanns], and you know how he is.");
    }
  if($signal == 2) {
quest::say("[Rujahn] Tahslek, huh? I've never heard of him, but those bandits seem to have a new leader every month or so.");
    quest::signalwith(2074,2, 10);
	
	}
  if($signal == 3) {
	quest::say("I'll send one of our best men to Highpass and eliminate [Rujahn]'s spy.");
   }
}


sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{
		quest::say("Hey..  My name's Zannsin. but you can call me [Zan].");
		}
	if($text=~/men to prak in highpass/i) 
		{
		if ($faction <= 4)
			{
			quest::say("Hmm, I see. Maybe you can help us out with this, $name, huh? I think it'd be a perfect opportunity for you to prove just how valuable you are to our little organization. Take this letter to Prak at Golden Rooster in Highpass, and see what you can do to help him out.");
			quest::summonitem(18795);
			}
		else
			{
			quest::say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
			}
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18028 => 1)) {
    quest::say("Great work, $name.... The Circle is very pleased with your performance of late, abd as a small reward for our more trusted members, I give you this... the cloak of the Unseen Hands.  It's good to know that we can count on you to get the job done... here, $name, go relax and have some wine on me.");
    quest::summonitem(1048);
	quest::givecash(0, 6, 3, 2);
	quest::faction(223,125);
	quest::faction(291,-18);
	quest::faction(230,18);
	quest::faction(262,-18);
	quest::faction(273,12);
	quest::exp(200);
	quest::ding();
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet
