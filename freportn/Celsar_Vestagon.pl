sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("May the Truthbringer guide your path. I am Celsar Vestagon, upholder of the faith and cleric of Mithaniel Marr. Did you come to see the [minnows of marr]?");
		}
	if ($text=~/minnows of marr/i) 
		{
		quest::say("The Marr Minnow is unique to the Hall of Truth. It is a beautiful fish. Unfortunately, recently, reports of piranha have been heard. Due to greater concerns, I must look for assistance from noble clerics who wish to help Marr and [eradicate the piranha].");
		}
	if ($text=~/piranha/i) 
		{
		quest::say("Yes. You are new to the word of Marr. Go to the waters surrounding the Hall of Truth. Fill this sack with no fewer than four dead piranha. You'd best keep well fed. I do not want you to eat the fish before you fill the sack and combine it. May Marr be with you.");
		quest::summonitem(17936);
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 13872 =>1 )) 
		{
		quest::say("You have done well. The Marr Minnow shall have a greater chance of flourishing. Please take this as a reward."); 
		quest::givecash("14","0","0","0");
		quest::faction(281,"20"); #Knights of Truth
		quest::faction(362,"4"); #Priests of Marr
		quest::faction(330,"-3"); #The Freeport Militia
		quest::faction(271,"-3"); #Dismal Rage
		quest::faction(311,"2"); #Steel Warriors
		quest::summonitem(quest::ChooseRandom(13869,15207,59971));
		quest::exp(100);
		quest::ding();
		}
	}
#END of FILE Zone:freportn  ID:8034 -- Celsar_Vestagon 

