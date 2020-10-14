sub EVENT_SAY 
{
if($text=~/Hail/i)
	{
	quest::say("Hello there, $name. Please watch where you are stepping when you're out in the field.  Nothing is more frustrating than having some fine jumjum ruined by our own careless feet. That reminds me, [Deputy Tagil] still owes us for that jumjum he stomped on the other day!");
	}
elsif($text=~/who is Deputy Tagil/i)
	{
	if ($faction <= 4)	#Verified per ZAM
		{
		quest::say("Deputy Tagil is a fine young halfling who serves the vale well. But the other day, chasing that dirty Nillipuss, he trampled some fresh Jumjum.  He promised to make amends but it must have slipped his mind.  Please take this note to him as a friendly reminder.");
		quest::summonitem(18013); 
		}
	else
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	}
}

sub EVENT_ITEM 
{
if (plugin::check_handin(\%itemcount, 13240 => 1))
	{
	quest::say("I knew that Deputy Tagil had simply forgotten. He really is a good young halfling. Here, take this as a small payment for your time.");
	quest::summonitem(quest::ChooseRandom(13977,13100,14014,13083));
# Factions verified per ZAM
	quest::faction(355, 5);		#Storm Reapers
	quest::faction(286, 1);		#Mayor Gubbin
	quest::faction(292, 1);		#Merchants of Rivervale
	quest::faction(324, -1);	#Unkempt Druids
	quest::givecash(5,1,0,0);
	quest::exp(100); 
	quest::ding();
	}

	plugin::return_items(\%itemcount);
}
#EOF Zone:rivervale  NPC:19053 -- Uner_Gnarltrunk
