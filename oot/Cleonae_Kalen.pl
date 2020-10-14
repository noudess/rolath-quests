sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the island of the Sisterhood of Erollisi.");
		}
	}
