#Ghost_Of_Ridossan
#NPC ID: 100222
#Stonebrunt

sub EVENT_SPAWN
	{
	quest::settimer(1, 300);
	quest::say("I will soon move on from this world to meet my ultimate fate.  But before I go, I must reward the staranger that assisted me.  Hand me the idol I gave you and you will be rewarded.");    #Text per live
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 2297 => 1))
		{     #Idol of Fear
		quest::emote("takes the idol into his spectral hand and shoves the lance into your arms. After letting go of the lance, the ghost immediately begins to fade away. Before it is gone completely, it looks into your eyes and says, 'Suffer.'");
		quest::summonitem(2099);    #Soulfiend Lance
		quest::stoptimer(1);
		quest::depop();
		}
	else
		{
		quest::emote("ignores you.");
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer(1);
	quest::depop();
	}
