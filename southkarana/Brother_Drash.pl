#southkarana  Brother Drash
sub EVENT_SAY 
	{
	if ($text=~/hayle/i) 
		{
		quest::say("You know master?  He is great man.  Has been taken to cages to Paw.  Must be saved.  Help him.  I cannot.  Here is fire to light your way");
		quest::summonitem(13002);#Gives a torch to light the way
	 	}
	}
