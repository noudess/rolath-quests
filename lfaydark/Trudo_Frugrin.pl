#########################################################
# Trudo Frugrin (ID:57059)
# Zone:   Lesser Faydark (lfaydark)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::say("What. what?!! I am quite busy here. I have studies to complete and charts to make!");
		}
	elsif ($faction > 5)
		{
		quest::say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		}
	elsif ($faction > 4)
		{
		quest::say("I cannot yet fully trust you");
		}
	elsif($text=~/lens/i)
		{
		quest::say("Yes, of course. Here you are. Now be off.");
		quest::summonitem(13275); #telescope lens [trudo's lens]
		}
	}

#END of FILE Zone:lfaydark  ID:57059 -- Trudo_Frugrin
