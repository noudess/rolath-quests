sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 17) {
    quest::say("When will my sister show up? I need her!");
  }
  if($wp == 43) {
    quest::say("Bartender! Some water, please.");
  }
}

sub EVENT_SAY 
	{ 
	if($text=~/hail/i) 
		{
		quest::say("Good day to you! Be careful in the city of Qeynos. [Rumors] of corruption may be true. Believe me. I wish my [sister] were here to help.");
		}

	if ($text=~/rumors/i) 
		{
		quest::say("I have heard that a few of the Qeynos merchants and guards are not very happy with the current state of the city. Taxes are too high and many of the guards have been sent to the outlands, leaving Qeynos vulnerable to attack. I do not feel the same way, but I fear these few may become many. I [fear for my life].");
		}

	if ($faction >= 5)
		{
		quest::say("I do not trust you.  I heard word that you are not a good eprson.  Mend your ways and then I may trust you with such talk.");
		}
	elsif($text=~/sister/i) 
		{
		quest::say("My sister is in the Karanas. She is a warrior. Her name is Milea. I really need her. Would you please deliver a note to her? You look able-bodied enough for the job.");
		}
	elsif($text=~/deliver a note/i) 
		{	
		if ($ulevel < 4) 
			{
			quest::say("I cannot discuss such things with a person as young to the world as you are.");
			}
		else
			{
			quest::say("Here you go then, brave adventurer. Godspeed to you.");
			quest::summonitem(18801);
			}
		}
	elsif ($text=~/fear for your life/i) 
		{
		quest::say("During a late night stroll by the pond in north Qeynos I spied a guard carrying a very large carpet on his shoulders. He approached the pond's edge and unrolled the carpet, the body of another guard rolled out and began to moan. The other guard grabbed for a long spear like weapon from his back. He drove the weapon into the man and pushed him into the pond. I screamed. He turned to me and I ran. I do not think he gave chase, too bad, he would not like to run into my [guardian] at home. I told my guardian and we both went to the pond and saw no body. He believes I was drinking too much wine. I do not drink. Now I fear for my life when I am in the streets of Qeynos.");
		}
	elsif($text=~/guardian/i) 
		{
		quest::say("When my big sister left Qeynos for adventure, she left me in the hands of her old time friend Kane Bayle. Yes, the commander of the Qeynos Guards is my guardian. You would think I would be safe. Every time I tell him the rumors I hear he just ignores me. He is too busy I guess.");
		}
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13302 =>1 )) {
    quest::say("Thank you my friend. I understand that Astaed Wemor of the Temple of Life has been concerned for my well being. Take him this note. I am sure he will reward you for easing my troubled mind.. If you are a respected member.");
    quest::summonitem(18862);
	# Validated on Live
    quest::givecash(0,10,0,0);
    quest::faction(291,15);
    quest::faction(223,-3);
    quest::faction(219,2);
    quest::faction(229,1);
    quest::faction(262,3);
    quest::exp(3000);
	quest::ding();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2  ID:2052 -- Nerissa_Clothspinner
