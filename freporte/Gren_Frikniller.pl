
sub EVENT_SAY
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Aya. howdy there. $name.  The name's Gren Frikniller.  'Niller the Killer' The only person who can give me a run for my money is my [sister].");
		}

	if($text=~/sister/i)
		{
		if ($faction > 6)
			{
			plugin::reject_say();
			}
		else
			{
			quest::say("Ah, my sister Falia has traveled here all the way from Rivervale. I hear that she's been staying up in North Freeport, but I haven't had a chance to find her yet. If you get some spare time, could you take this letter to her for me? Thanks, $name, you're really not so bad after all.");
			# Letter to Falia ID-18925
			quest::summonitem("18925");
			}	
		}

	if($text=~/rivervale/i)
		{
		quest::say("Rivervale?  Well. it's far from here. thank Fizzlethorpe.  They got more wanted posters with my face on 'em than they got trees there.  I mean. 'tweren't my fault either.  Just a friendly game of cards. and this little weasel catches me with an extra ace up my sleeve.  Can you believe this kid calls ol' Grenny here a cheater. right in front of the whole bar?!!  So. you know. I gave him a quick cut. ear to ear. with me dagger...  just to shut him up. you know.  Suddenly. I'm a murderer?  For simply defending myself?! Go figure!");
		}

	if($text=~/elisi/i)
		{
		quest::say("Elisi runs the show around here.  She's usually a pretty busy lady.  Dang smart. too.  And it's my sworn duty to protect her at any cost. even with my very own life.");
		}
	}

sub EVENT_ITEM
	{
	# Broken Heirloom Necklace ID-13159
	if($faction < 7 && $itemcount{13159} == 1)
		{
		quest::say("What's this? Oh, ol' Grandpa Frikniller's lucky necklace, huh? I'll bet this broken piece of junk won't even get me a sip of ale up at the bar. And lucky? How lucky could this thing be? Poor gramps was lonely and copperless his whole life. Bah!! Oh, well. Here's some coin for your efforts, thanks, $name");
		quest::exp("100");
		quest::ding();
		quest::givecash(6,1,0,0); 
		#Faction verified on ZAM
		# Coalition of TradeFolk Underground
		quest::faction(336,"10");
		# Coalition of Trade Folk Faction
		quest::faction(229,"10");
		# Carson McCabe Faction
		quest::faction(329,"1");
		# Corrupt Qeynos Guards Faction
		quest::faction(230,"1");
		# Freeport Militia Faction
		quest::faction(330,"1");
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("Yea...  Bite that tongue of yours, there shorty, or I might just have to cut it off to shut you up for good.");
	}

#END of FILE Zone:freporte  ID:10122 -- Gren_Frikniller


