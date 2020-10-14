sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("What do you want? I have no reason to waste my time with the likes of you!");
		}
	elsif ($faction > 4)
		{
		quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
    elsif($text =~/messages for Neriak/i)
        {
        quest::say("Yes! Yes, of course. I have been waiting for you. The last four couriers made the mistake of asking the High Keep Guards for directions. Now they are breathing dirt, six feet under. Take this to Neriak at once.");
        quest::summonitem(18889);#Letter To Loveal Of The Dead
        }
	}
