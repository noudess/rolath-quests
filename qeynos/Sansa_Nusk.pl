sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hello..  Welcome to the Wind Spirit's Song.  I'm Sansa, and I help out the local bards here."); 
		}
	else
		{
		if ($faction >= 7) # Tested - works at APP
			{
			quest::say("The League of Antonican Bards is very displeased with your recent actions.  And I don't particularly care for your stench, either.");
			}
		elsif ($text=~/Fabian/i) 
			{
			quest::say("Ahh - jolly Fabian. He is one of our best customers! That is, of course, due to the fact that he has the heaviest fingers of any bard I know. Anyhow, down to business. I assume he sent you for a new set of strings. Unfortunately, I have not been able to procure any of the special - uhh - things needed to make his strings lately.");
			}
		elsif ($text=~/special things/i) 
			{
			quest::say("Uhh - ummm - uhhh - Fabian does not know this, but his strings are - uh - made of - uh - troll guts.");
			}
		elsif ($text=~/troll guts/i) 
			{
			quest::say("Well, Fabian likes the thick resonance that only troll gut strings can provide. Trouble is, trolls are scarce around these parts,
		thank the gods, but Fabian breaks his strings as fast as I find suppliers. Trolls sometimes wander the Karanas in search of food but that is so rare, to see one there. Anyhow, if you find one out in the Karanas, bring me his guts along with 10 gold for materials and I can make the strings to take to Fabian.");
			}
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13703 => 1) && 
		($gold >= 10 or $platinum >= 1)) 
		{
		quest::say("I am not even going to bother asking where you got that. Just take this set I already made and hurry them back to Fabian.");
		# Faction verified on live
		quest::faction(284, 2);
		quest::faction(281, 1);
		quest::faction(262, 1);
		quest::faction(304, -1);
		quest::faction(285, -1);
		quest::summonitem(13709);
		quest::exp(1000);
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 13708 => 1)) 
		{
		quest::say("Ah, well, Fabian said to give you this. It really is a good piece. Good luck!");
		quest::faction(284, 2);
		quest::faction(281, 1);
		quest::faction(262, 1);
		quest::faction(304, -1);
		quest::faction(285, -1);
		quest::summonitem(85059);
		quest::exp(1000);
		quest::ding();
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 2)
		{
	# Not sure if this is correct, but it happens on live now..
	quest::say("Uhh - ummm - uhhh - [Fabian] does not know this, but his strings are - uh - made of - uh - [troll gut].");
		}
	elsif ($signal == 1)
		{
		quest::settimer("depart", 27);
		}
	}

sub EVENT_TIMER
	{
	quest::start(70);
	quest::shout("Wait for me!");
	quest::stoptimer("depart");
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 13)
		{
		quest::say("May your fortune and future be bright my friend.");
		quest::emote("hugs Korvik");
		}
	elsif ($wp == 14)
		{
		quest::stop();
		quest::moveto(148.5, 22.19, 3.75, 141.6,1);
		}
	}
#END of FILE Zone:qeynos  ID:1124 -- Sansa_Nusk 

