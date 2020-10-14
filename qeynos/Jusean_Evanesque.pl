sub EVENT_WAYPOINT_ARRIVE 
	{
	if($wp == 3) 
		{
		quest::emote("growls, revealing his fangs.");
		}

	if ($wp == 13)
		{
		quest::emote("gives Korvik a huge hug and moves back to admire his uniform");
		}
	elsif ($wp == 14)
		{
		quest::stop();
		quest::moveto(167.24, 14.5, 3.75, 123.8,1);
		}
	}

sub EVENT_SAY 
	{
	if ($faction >= 7) # tested at Dubious - what about apprehensive?
		{
		quest::say("The League of Antonican Bards is very displeased with your recent actions.  And I don't particularly care for your stench, either.");
		}
	elsif($text =~ /Hail/i) 
		{
		quest::say("Why, hello there, $name! I am Jusean, loyal member of the League of Antonican Bards. You look like the reliable sort, maybe you could help me out for a bit, huh? It's about time for our field agents to turn in their [watch reports], and I need someone to go pick them up for me."); 
		}
	elsif ($text=~/watch reports/i) 
		{
		quest::say("We always have someone stationed on watch duty at the two main entries to the city to keep an eye on what is happening around Qeynos. We have [Anehan and Behroe] down at the docks, and [Leanon and Quinon] working the North Gate.");
		}
	elsif ($text=~/Anehan and Behroe/i) 
		{
		quest::say("Here, if you take this to Anehan or Behroe down at the docks, and then return their report to me as soon as you can, I will give you a small reward.");
		quest::summonitem(18021);
		}
	elsif ($text=~/Leanon and Quinon/i) 
		{
		quest::say("Leanon is in charge of the day shift at the North Gates of Qeynos, and Quinon is stationed there during the night. Please take this to either of them, have them fill it out, and then return it to me as soon as you can.");
		quest::summonitem(18020);
		}
	elsif($text =~ /Who is your father/i) 
		{
		quest::say("My father Heltin disappeared while on a voyage aboard the Sea King. A group of troll pirates attacked and boarded the ship. Ginleen Harltop and the steel warriors traveling with them managed to fight them off, but took many casualties. My father was one of the bodies that was not accounted for. They found his song book floating in the water near the boat. The red water soaked through it's pages told more of the story then I ever care to know.");
		}
	elsif ($text =~ /carry/i || $text =~ /carrier/)
		{
		quest::say("Why yes, we are training a new mail carrier.  And that man just happens to be my brither [korvik]!  He was lost to me for many years but we have him back and are glad to say he is interested in being a mail carrier!");
		quest::signalwith(1305,1,0);
		}
	elsif ($text =~ /korvik/i)
		{
		quest::say("Yes, Korvik is my brother.  He was killed by a creature of the night some years ago now.  I've.. had some experience along these lines myself.....  You don't really die, at least not your flesh...  Not pleasant, but managable.  Korvik didn't handle it so well and lost his wits a bit.  He lives again now, here with us.  As I said, he was lost to beasts in the Karanas, but a [cure] has brought him back to us.  He is excited about being a postman now.  He is just inside if you wish to speak with him.");
		}
	elsif ($text =~ /cure/i)
		{
		quest::say("Oh, they say there is a band of werewolf hunters that call themselves the fangbreakers.  It is rumored that they were the key to [korvik]'s return.");
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1)
		{
	quest::say("You've completed your training brother?  I must say I am suprised, but very pleased.  I thought all you were up to was drinking Short beer at Fish's Ale!  You are full of suprises!");
		}
	elsif ($signal == 2)
		{
		quest::stop();
		$npc->SetCurrentWP(0);
		quest::start(70);
		quest::shout("My little brother!  Saved and now a Postman!");
		quest::settimer("depart", 5);
		}
	elsif ($signal == 3)
		{
		plugin::DoAnim("laugh");
		quest::say("Haha brother, always the joker!");
		quest::say("Let's share our new tune with Korvik, Sollari!");
		quest::signalwith(1050,2);
		}
	elsif ($signal == 4)
		{
		plugin::DoAnim("wave");	
		quest::settimer("depop", 10);
		}
	}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 59023 => 1)) {
    #aria of acestiscisitmishm
    quest::emote("peers intently through several pages of the book, mumbling quietly under his breath as he does. His gaze falls on one page in particular as his eyes begin to widen as they pass over each line. He begins scribbling frantically across the pages in between the lines.");
    quest::say("Take this, who ever wrote it was obviously a student of my father. The style is unmistakable. I've written some notes up for you so it should be easier to read. Take this back to Kardin and he'll teach it to you.");
    quest::summonitem("59024");
    quest::exp(2500);
	quest::ding();
    quest::faction(284,10); #league of antonican bards
    quest::faction(281,10); #knights of truth
    quest::faction(262,10); #guards of qeynos
    quest::faction(304,-30); #ring of scale
    quest::faction(285,-30); #mayong mistmoore
  }
  elsif (plugin::check_handin(\%itemcount, 59042 => 1)) {
    #aria of innocence
    quest::say("My father gave you this just before he died?! So he's been alive all these years in the mines of Brokenskull Rock. What a bitter end for such a talented minstrel. I will transcribe this song for you $name, but you must promise to use it to help those like my father, trapped in an unnatural insanity. I pray that you will not fall to the same fate.");
    quest::summonitem("59001");
    quest::exp(2500);
	quest::ding();
    quest::faction(284,10); #league of antonican bards
    quest::faction(281,10); #knights of truth
    quest::faction(262,10); #guards of qeynos
    quest::faction(304,-30); #ring of scale
    quest::faction(285,-30); #mayong mistmoore
  }
  if (plugin::check_handin(\%itemcount, 18023 =>1 )) {
    quest::say("Good job. I hope Behroe wasn't sleeping on the job again when you talked to him. Hmm, the docks seem to be a hotbed of activity after the sun goes down. Thanks for your quick work, $name, here's a little cash for your efforts.");
    quest::exp(100);
	quest::ding();
	# verified on live
    quest::faction(284,25); #league of antonican bards
    quest::faction(281,3); #knights of truth
    quest::faction(262,3); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18024 =>1 )) {
    quest::say("Ah, very good. I'll make sure to note Leanon's report in our journals. Here's a little something for your troubles, $name.");
    quest::exp(100);
	quest::ding();
	# verified on live
    quest::faction(284,10); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18022 =>1 )) {
    quest::say("Ok, good work $name.  I'll make sure to note the day's activities in our journal.  Here's a little something for your efforts."); #Turn in Anehan's Report - faction and exp verified on live
    quest::exp(100);
quest::ding();
    quest::faction(284,25); #league of antonican bards
    quest::faction(281,3); #knights of truth
    quest::faction(262,3); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  if (plugin::check_handin(\%itemcount, 18025 =>1 )) {
    quest::say("Hmm... interesting... good work, $name, thank you for your help."); #Turn in Quinon's report - faction and exp verified on live
    quest::exp(100);
quest::ding();
    quest::faction(284,10); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
    quest::givecash(10,2,0,0);
  }
  
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Bard');
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER
	{
	@pals = (1050, 1124, 1132, 1131);

	if ($timer eq "depart")
		{
		foreach (@pals)
			{
			quest::signalwith($_,1);	
			}
		quest::stoptimer("depart");
		}
	elsif ($timer eq "depop")
		{
		foreach (@pals)
			{
			quest::depop_withtimer($_);	
			}
		quest::stoptimer("depop");
		quest::depop_withtimer();
		}
	}
