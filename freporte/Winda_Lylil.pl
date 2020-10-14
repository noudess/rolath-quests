
sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hello $name, you wouldn't happen to [be a baker] yourself or maybe you know someone who bakes?"); 
		}
	if ($text=~/I am a baker/i) 
		{
		quest::say("Well good! Maybe you can help me restock. If you are a baker you could help me out by restocking my [muffin supply].");
		}
	if ($text=~/what muffin supply/i) 
		{
		quest::say("Thanks, you're a pal. Take this crate and fill it with muffins, then seal it up and bring the Full Muffin Crate back to me. Don't go trying to pass off that store bought stuff on me either, I need fresh baked muffins. The ones in the stores are already too old and will get moldy too fast, so I don't want those.");
		quest::summonitem(17881);
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1)) 
		{
		# Verified
		quest::say("'Ah yes! This is exactly what I am looking for, dear. Let me put these on the shelf right away. Here is some coin for your trouble. Perhaps we can do business again sometime.");
		quest::faction(330, 2);
		quest::faction(336, 1);
		quest::faction(281, -1);
		quest::faction(362, -1);
		quest::givecash(0,0,6,0);
		quest::exp(100);
		quest::ding();
		}
	}
