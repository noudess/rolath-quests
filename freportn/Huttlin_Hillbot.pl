sub EVENT_SAY
	{
	if($text=~/hail/i)
		{
		quest::say("The shop is closed for the evening. Come back in the morning.");
		}
	}
