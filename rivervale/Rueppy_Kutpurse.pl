sub EVENT_SAY 
	{ 
	if($text=~/hail/i) 
		{
		quest::say("Hello, $name. Rueppy's my name. Why don't you buy us something to [drink] and we can talk?");
		}
	if($text=~/drink/i) 
		{
		quest::say("How about a short beer? That sounds good.");
		}
	if($text=~/blackburrow stout/i) 
		{
		quest::say("Oh, well we can't get that here. However, you can always [smuggle] it in...");
		}
	if ($text=~/smuggle/i)
		{
		if($faction <= 4) 
			{
			quest::say("You interested in a little job?  I need you to meet someone who is bringing me some stout.  He was supposed to meet me in the ruins on the other side of the Great Wall, but I have other business to attend to.  His name is Gunrich.  You might have to wait for a while for him to show up, as he will be skittish at the sight of a stranger.  Payment has already been made.  Just tell him, 'Dark rivers flow east,' and he will know to trust you. Make sure you don't say anything else to him or the deal will sour.  Meet me back here with the stout.");
			}
		elsif ($faction <= 5)
			{
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			}
		else
			{
			plugin::reject_say();
			}
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13032 => 1)) { #Short Beer
    quest::say("Mmm. It's good, but not as good as [Blackburrow Stout].");
    quest::exp(100);
	quest::ding();
    quest::givecash(5,0,0,0); #Copper x 5
  }
  elsif($faction <= 4 && plugin::check_handin(\%itemcount, 13131 => 1)) { #Case of Blackburrow Stout
    quest::say("Heh heh!  You did it!  I thought the deputies would get you for sure!  I mean...  You did it!  Heh!  Here buy yourself a drink on me.");
	# Verified on live
	quest::faction(241,10);	#Deeppockets
	quest::faction(223,1); 	#Circle of Unseen Hands
	quest::faction(292,-1);	#Merchants of Rivervale
	quest::faction(336,1);	#Coalition of Tradefolk Underground
	quest::faction(329,1);	#Carson McCabe
    quest::exp(5000);
	quest::ding();
    quest::givecash(5,6,0,0);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:rivervale  ID:19064 -- Rueppy_Kutpurse
