sub EVENT_SAY 
	{ 
	if ($faction > 7)
		{
		quest::say("Is that your BREATH, or did something die in here?  Now go away!");
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Rrrr.. catching and prrreparing fish is my specialty. Perrrhaps you could fetch for me some [rrrare fish] so that I may demonstrate my skill? Rrrr.");
		}
	elsif($text=~/what rrrare fish/i)
		{
		quest::say("Rrrr.. my most delectable dish is prrreparrred frrrom rrraw darkwater piranha. Unforrrtunately. the pirrranha only surrrvives in the murrrky waterrrs of the wicked Nektulos forrrest. I will rrreward any brrrave fisherman who can brrring me some rrraw darkwater pirranha."); 
		}
	elsif($text=~/recharged/i)
		{
		quest::say("Yes, you bring Roary fresh fish and the dead spear.  Roary will fix it."); 
		}
	}

sub EVENT_ITEM {
  if ($faction < 8 && plugin::check_handin(\%itemcount, 12318 => 1)) {
    quest::say("Rrrrr... you found the rrrraw fish.  I can now make my favorrrrrite dish.  Herrrrre is a special spearrrrr that will help you to catch morrrrrre of these. If you need this [recharged] just come back bearing gifts."); #need proper text
    quest::summonitem(7027);
	quest::exp(1000);
	quest::ding();
  }

  if ($faction < 8 && plugin::check_handin(\%itemcount, 7027 => 1, 13019 => 1)) {
    quest::say("Fresh Fish!  Thank you.  Herrrre is your refrrrreshed spear.");
    quest::summonitem(7027);
	quest::ding();
  }
}
#END of FILE Zone:kerraridge  ID:74075 -- Roary_Fishpouncer 

