#BeginFile: Auhrik_Siet`ka.pl
#Quest for Paineel - Auhrik Siet`ka: Neonate Cowardice

sub EVENT_SAY 
	{
	if($text=~/understand common/i) 
		{
		if ($faction >= 6) # App no good.  Indiff?
			{
			plugin::reject_say();
			}
		else
			{
			quest::say("Of course you do. Now, listen carefully. It may be too much for your feeble mind to gather all at once, and I hate to repeat myself. Bring me one bat wing, one rat ear, one snake egg, and one fire beetle eye. Take this bag, and make sure it's sealed before you return it to me. Snake eggs spoil. Now, quit staring at me with your jaw hanging open like a dead codfish. I would have mistaken you for one, but dead codfish smell better. Haha!");
			quest::summonitem(17802); #Small Sealable Bag
			}
		}
	}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 14041 => 1)) { #A Rolled Up Note
    quest::say("Why are you giving this to me? Oh I see. I forgot that rats don't know how to read. Haha! Well, then. I shall read it for you. You do [understand common] don't you? Haha.");
  }
	#Text correct to match live
  elsif(plugin::check_handin(\%itemcount, 12993 => 1)) { #Small Sealed Bag
    quest::say("Well, that wasn't so hard, was it? I suppose I must now thank you for your services. Now, leave me to my studies. I would tell you what I needed the items for, but that would just cloud your fragile little mind. Off with thee");
	#Exp, cash and no faction change verified on live
    quest::exp(200);
	quest::ding();
    quest::givecash(6,4,0,0);
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: Auhrik_Siet`ka.pl
