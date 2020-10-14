sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hi $name. Times are tough these days. I am finding myself running short on baked goods lately. Would you be [willing to help] me out?"); 
		}
	if ($text=~/willing to help/i) 
		{
		quest::say("You'll help me, great! If you [can bake] you can make me some muffins so I don't run out. Otherwise, you [can travel] a little way for me and pick up some bread.");
		}
	if ($text=~/can bake/i) 
		{
		quest::say("Take this crate and fill it with muffins, seal it up and bring it back to me. Don't go trying to pass off that store bought stuff, I need fresh baked muffins. The ones in the stores are already too old and I need to keep the guards and gypsys happy!");
		quest::summonitem(17881);
		}
	if ($text=~/can travel/i) 
		{
		quest::say("Accross the bridge in the southern plains is one heck of a baker. It's one of the Meadowgreen fellas.  Go look him up and tell him you want a bag of bread loaves.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Thanks, you are a top notch baker!  Here's some coin for your trouble.");
		quest::faction(291,1);	#Merchants of Qeynos
		quest::faction(262,1);	#Guards of Qeynos
		quest::faction(345,1);	#Karana Residents
		quest::givecash(0,4,2,0);
		quest::exp(100);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Ahhh, fresh baked bread! Thank you for making the trip, it's not far, but I can never seem to find the time. Here is a little coin for your travel expenses. You have my thanks.");
		quest::emote("whistles as he quickly restocks his shelves.");
		quest::faction(291,1);	#Merchants of Qeynos
		quest::faction(262,1);	#Guards of Qeynos
		quest::faction(345,1);	#Karana Residents
		quest::givecash(0,0,7,1);
		quest::exp(100);
		quest::ding();
		}
	}
