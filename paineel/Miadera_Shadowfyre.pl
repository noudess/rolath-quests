#BeginFile paineel\Miadera_Shadowfyre.pl
#Quest for Paineel - Miadera Shadowfyre: Terror Forged Mask
#
#Status: Incomplete
#Issue1: Create Item - 'Mundane Mask'
#Issue2: Get correct text
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
  }

  if($text=~/summoning of terror/i) {
    quest::say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
	}

 if ($text =~ /Maugarim/i)
		{
		quest::say("Maugarim?  That traitor is dead to us.  She has been seen consorting with the kerran.  She understands no fear, aside from the fear of the light. It is said that she lives on an island in the Ridge.");
		}

	if (quest::istaskcompleted(74) && !quest::istaskcompleted(105))
		{
		if ($text=~/betrayal/i)
			{
			quest::say("So, only when summoned do you have the intestines to look into my eyes.. this disgusts me.  I can see only one [way] for me to allow you to remain in my service.");
			}

		if ($text=~/way/i)
			{
			quest::say("I require you to kill, disembowel, and bring Antus, of the Necromancers, the heads of any of the criminals that have slain our dogs.  Nothing short of that will allow me in good conscience to allow you to remain in our city.");
			if(!quest::istaskactive(105))
				{
				quest::assigntask(105);
				}
			}
		}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10523 => 1, 19032 => 1, 14110 => 1, 14109 => 1)) { #Eye of Urd, Basalt Drake Scales, Lens of Lord Soptyvr, Widowmistress Hair
    quest::say("Yes, this is what I require to summon Terror!"); #Text made up
    quest::emote("begins speaking an incantation. 'Take this mask as your reward for helping me.'");
#    quest::summonitem(00000); #Mundane Mask
#    quest::spawn2(?????); #Avatar of Terror
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre
