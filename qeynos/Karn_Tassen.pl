sub EVENT_SIGNAL {
    quest::say("Ooh yeah! So would I, honey.");
    quest::signal(1066,1);
 }
  


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I'm starting to run out of stock. You wouldn't happen to [be a baker] yourself or maybe you [know] someone who bakes?"); }
if ($text=~/I am a baker/i) {
  quest::say("Well good! Maybe you can help me restock. If you are a baker you could help me out by restocking my [muffin supply]. Or if you don't mind a little travel, you can pick up a [shipment of bread] for me.");
}
if ($text=~/what muffin supply/i) {
  quest::say("Thanks, you're a pal. Take this crate and fill it with muffins, then seal it up and bring the Full Muffin Crate back to me. Don't go trying to pass off that store bought stuff on me either, I need fresh baked muffins. The ones in the stores are already too old and will get moldy too fast, so I don't want those.");
  quest::summonitem(17881);
}
if ($text=~/shipment of bread/i) {
  quest::say("There is a guy that lives in the plains to the south. I guess the plague hasn't hit that area too bad. Anyway, he's one heck of a baker and makes some quality bread. Go look him up and tell him you want a bag of bread loaves. He's one of those fellas that goes by the name of Meadowgreen.");
}
}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1)) 
		{
		# Verified
		quest::say("Hey, thanks kid! You are one top notch baker!  Here's some coin for your trouble.");
		quest::faction(219, 1);
		quest::faction(336, 1);
		quest::faction(262, 1);
		quest::faction(291, 2);
		quest::faction(223, -1);
		quest::givecash(0,4,2,0);
		quest::exp(100);
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 1838 =>1 )) 
		{
		quest::say("Ah finally, fresh bread! All right let me get this on the shelves right away. Here is your payment.");
		quest::faction(219, 5);
		quest::faction(336, 5);
		quest::faction(262, 5);
		quest::faction(291, 5);
		quest::faction(223, -10);
		quest::givecash(0,0,6,1);
		}
	}
#END of FILE Zone:qeynos  ID:1118 -- Karn_Tassen 
