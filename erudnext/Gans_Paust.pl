sub EVENT_SAY 
	{ 
	if ($text=~/hail/i)
		{
		quest::emote("glances at you and hurriedly makes a gesture of religious meaning before you."); 
		quest::say("Yes, yes, I hereby bless you in the name of Prexus. May your catch be plentiful and your nets never snag. Are there any other fishermen seeking a blessing? I'm very busy."); 
		}

	if ($text=~/what of your brother/i)
		{
		quest::say("What? How do you know of my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [check on him]."); 
		}

	 if ($text=~/check on him/i) 
		{
		if ($faction > 4)
			{
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			}
		else
			{
			quest::say("Thank you, adventurer. He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success.");
			quest::summonitem(18173);
			}
		}
	}

sub EVENT_ITEM 
	{ 
	if ($item1==18724)
		{
		quest::say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights. Go see Dleria. she will get you started in your studies.  Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem(13544);
		quest::faction(242, 100); #Deepwater Knights
		quest::faction(266, 15); #High Council of Erudin
		quest::faction(265, -15); #Heretics
		quest::exp("100"); 
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 1771 => 1)) 
		{
		quest::say("Excellent! Thank you for checking on my brother, I am glad to hear that he is well.  Here is something that shall help you on your way");
		quest::summonitem(1763);
		quest::faction(242, 25); #Deepwater Knights
		quest::faction(266, 3); #High Council of Erudin
		quest::faction(265, -3); #Heretics
		quest::exp("1000"); 
		quest::ding();
		}
	}
#END of FILE Zone:erudnext  ID:98061 -- Gans_Paust 

