sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::say("Hello.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18727 => 1)) 
		{
		quest::say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		quest::summonitem(13550);
		quest::faction(233,100);   #Crimson Hands
		quest::faction(266,10);  #High Council of Erudin
		quest::faction(265,-15); #Heretics
		quest::faction(267,15);  #High Guard of Erudin
		quest::exp(100);
quest::ding();
		}
	}

#END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire 
