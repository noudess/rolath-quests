sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("Greetings, $name! How lucky you are to encounter the greatness of the legendary Sir Edwin Motte, slayer of cyclopes, battler of beasts, crusher of creatures, masher of monsters, eradicator of evil and champion of the third annual dart championship of Freeport.");
		}
	}
