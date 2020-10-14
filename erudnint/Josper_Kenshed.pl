# Ice goblin beads
# Ilanic's Scroll

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Come forward and speak.  What is it you seek within these walls?  Let it be the knowledge of wizardry. for that is what we are.  Only a [servant of wizardry] should be within these walls.");
		}

	elsif($text=~/servant of wizardry/i)
		{
		quest::say("A servant. you say?  If you be a young apprentice. perhaps you might assist me? I could use you to [collect components].  If you believe yourself to be beyond such things. you may wish to assist me with a [special matter].");
		}
	elsif ($faction > 5)	# Tested for apprehensive and amiable.
		{
		quest::say("The Crimson Hands will have nothing to do with you.  Perhaps only your death shall improve our relations.");
		}
	elsif ($faction > 4)
		{
		quest::say("The Crimson hands have no quarrel with you, but we cannot truely trust you as yet.");
		}
	elsif($text=~/collect components/i)
		{
		quest::say("Of course you may assist me!! We have much need of a certain item which can only be found in the frigid peaks of Everfrost. There you shall find creatures called ice goblins. Take this bag and fill it with ice goblin beads and be sure to combine them before you return them. Well, then... Off with you!! And be quick about it and I shall give you a fine wizard's weapon. None of this rust-covered garbage offered by our associates!");
		quest::summonitem(17944);
		}

	elsif($text=~/special matter/i)
		{
		quest::say("It seems my last apprentice was sent into Toxxulia to test a spell I call Ice Capade, well, everyone else calls it Column of Frost, how droll!  Anyway... he never returned.  I fear he is nothing more than BONES, though I hope I'm wrong.  Could you find good old Ilanic and ask him, [where is the scroll]?!  I do not wish it to fall into enemy hands.  Return it and I shall let you keep the scroll.  Oh yes, It is only half of a spell.  I forgot to send him the full scroll.  I imagine that is why he was not victorious.");
		}
	}

sub EVENT_ITEM 
	{

	if (plugin::check_handin(\%itemcount, 13898 => 1)) 
		{ # bag of ice necklaces

		quest::summonitem(12208);
		quest::say("Well done, my young apprentice. I call you apprentice for you are nothing but a spark to my fire. This is the final component for my greatest creation. AHA!! I call it - iced tea!! Never again shall I boil under the hot sun. As for you, take this. It should serve you well. Now go away. There is no iced tea for you");

		# Factions verified on live.
		quest::faction(233,15); #faction with Crimson hands increased
		quest::faction(266,1); #faction with High Council of Erudin increased
		quest::faction(265,-2); #faction with Heretics decreased
		quest::faction(267,2); #faction with High Guards of Erudin increased
		quest::exp(1000);
		quest::ding();
		quest::givecash(0,7,0,0);
		}

	if (plugin::check_handin(\%itemcount, 12207 => 1)) 
		{ # Ilanic's Scroll

		# Verified on live
		quest::summonitem(15380);
		quest::faction(233,5); #faction with Crimson hands increased
		quest::faction(266,1); #faction with High Council of Erudin increased
		quest::faction(265,-1); #faction with Heretics decreased
		quest::faction(267,1); #faction with High Guards of Erudin increased
		quest::exp(1000);
		quest::ding();

		quest::say("Go now and use his research to aid yourself. Seems that I lack the will to use Ilanic's knowledge for my better good.");

		}

	plugin::return_items(\%itemcount);

	}

#END of FILE Zone:erudnint  ID:24072 -- Josper_Kenshed 
