sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Oh hello. $name.  My name is Ilscent.   I am glad to see you. but I am in a bit of a [bind] right now.");
		}
	elsif($text=~/what bind/i)
		{
		if ($faction <=4) #Verified on Live
			{
			quest::say("Well. I promised an ally of ours that I would send him a case of Jumjum juice for all the help he has given us.  I had planned on taking it to him myself but I have too many chores to do here on the farm. Will you take the [jumjum juice] to him?");
			}
		else
			{
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			}
		}
	elsif($text=~/jumjum juice/i)
		{
        if ($faction <=4) #Verified on Live
			{
			quest::say("Oh. thank you so much!  His name is Xanuusus and he lives in the Plains of Karana. in the foothills along their northern edge. actually.  We are most grateful for your help.  Xanuusus normally rewards messengers well.");
			quest::summonitem("13411"); 
			 }
		else
			{
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			}
		}

	}
#END of FILE Zone:rivervale  ID:19102 -- Ilscent_Tagglefoot 

