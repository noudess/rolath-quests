# Quest for Nolusia Finharn in erudnint - Enchanter's first assignment 
# NPC ID 23000 -- Nolusia Finharn 

sub EVENT_SAY 
	{ 
	if ($text=~/hail/i) 
		{ 
		quest::say("Greetings, $name. Has [Larken] sent you to see me?  Are you a [visitor or citizen of Erudin]?"); 
		} 

	if ($text=~/visitor of Erudin/i) 
		{
		quest::say("Then, remember, inside the palace walls, never speak the names of those defilers who have passed on. I shall be at the Vasty Inn later tonight. I can answer your questions there."); 
		}

	if ($text=~/citizen of Erudin/i) 
		{
		quest::say("Well, then, you should know better than to speak the names of defilers inside the palace walls! I must get back to my work, or I shall be late to the inn this evening.");
		}

	if ($text=~/larken/i) 
		{ 
		quest::say("Then let us begin your first task. I require some components for an experiment I have been meaning to conduct. If you could [gather] them for me, I will make sure that you are rewarded."); 
		} 

	if ($text=~/Moodoro/i) 
		{ 
		quest::say("My brothers is dead.  I have nothing to say.  If you insist on persuing this matter, talk to me later at the Vasty Deep Inn."); 
		quest::updatetaskactivity(25,1,1);
		} 

	if ($text=~/gather/i) 
		{ 
		quest::say("In Toxxulia Forest you should be able to find some snakes and skunks. I require two snake fangs and two skunk eyes. Once you have collected them, bring them to me for your reward."); 
		} 
	} 

sub EVENT_ITEM 
	{ 
    if (plugin::check_handin(\%itemcount, 13067 => 2, 27658 => 2)) 
		{ # random level 1 spell and experience 
      	quest::summonitem(quest::ChooseRandom(15208, 15286, 15040, 15288, 15292, 15676)); 
      	quest::exp(150); 
quest::ding();
      	quest::say("You have passed your first task. Nice work. Take this spell as your payment."); 
    	} 
    else 
		{ 
		plugin::return_items(\%itemcount); 
		quest::say("What am I supposed to do with these, $name?"); 
    	} 
	} 

#END of FILE Zone:erudnint  ID:23000 -- Nolusia Finharn 
