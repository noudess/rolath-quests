sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
    quest::say("Hey Pelshia, how's business?");
	quest::signalwith(2073,1,1);
	}
  if($wp == 7) {
    quest::say("And what about you, gorgeous? Looking as delightful as ever, I must say.");
	}
  if($wp == 18) {
    quest::say("So, yeah, that Pelshia, she's all over me. And Renux, too. She was giving me the look, man. I'm telling ya. Zan, all the ladies want a piece of the Knargman.");
	quest::signalwith(2085,1,1);
	}
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("How about you and I go take a stroll under the docks tonight?");
    quest::signalwith(2073,2,1);
     }
}



sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Hey..  What's up? My name's Knargon Lanenda. I just came over here from [Freeport] a couple of months ago. I used to run a big business importing goods from [Faydwer]. If you've been to [Freeport]. I'm sure you've heard of me.");
		}
	elsif($faction >= 7)
		{
		quest::say("Heh... With all you've done, I'm suprised you're still alive.");
		}
	elsif($text=~/Hanns/i)
		{
		if ($faction >=6)
			{
			quest::say("Heh... With all you've done, I'm suprised you're still alive.");
			}
		else
			{
			quest::say("He is genuinely dangerous.  If you think otherwise, you don't be thinking for long.");
			}
		}
	elsif($text=~/freeport/i || $text=~/faydwer/i || $text=~/highpass/i)
		{
		quest::say("It's a long way from here. . .which is a good thing for me.");
		}
	elsif($text=~/jracol/i) 
		{
		quest::say("I don't know why [Carson] likes that guy ... he's certainly been nothing but trouble for me.");
		}
	elsif($text=~/carson/i || $text=~/mccabe/i) 
		{
		quest::say("Carson McCabe? He runs that sham of a fortress called [Highpass Hold]. We've been dealing with him for a few years, now. But, lately he seems to be losing control of his business. [Hanns] will whip him into shape pretty soon though, I bet.");
		}
	elsif($text=~/shipment/i || $text=~/business/) 
		{
		quest::say("We have a small shipment of goods coming in later tonight. The [courier] will be waiting outside the city gates. Casually tell the courier [Lovely night for a stroll], and give him this old card as proof that you work for us. Make certain that you are not followed, and return the shipment to me.");
		quest::summonitem(13903); #Bent Playing Card
		} 
	elsif($text=~/courier/i) 
		{
		quest::say("The courier that usually runs [McCabe]'s shipment, is that good for nothing J'Racol. I don't trust his kind.");
		}
	}

sub EVENT_ITEM 
	{
	if($faction <= 5 && plugin::check_handin(\%itemcount, 18722 => 1)) 
		{ #Sealed Note For Knargon
		quest::say("Hmm. Carson better deal with his little 'problem' soon, it's costing us a lot of money. Hanns is gonna skin us all when he hears this. Go tell Hanns that [Carson has a mole in the Highpass] guards, and see what he wants us to do.");
		# Factions Verified on Live
		quest::faction(223,5);    #Circle of Unseen Hands
		quest::faction(230,1);    #Corrupt Qeynos Guards
		quest::faction(273,1);   #Kane Bayle
		quest::faction(291,-1); #Merchants of Qeynos
		quest::faction(262,-1); #Guards of Qeynos
		quest::exp(150);
		quest::ding();
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
		} 
	}
#END of FILE Zone:qeynos2  ID:2063 -- Knargon_Lanenda
