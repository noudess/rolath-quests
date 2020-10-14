sub EVENT_SAY
	{
	if ($text =~/hail/i)
		{
		quest::say("Hello, adventurer. I hope the land of Norrath has been kind to you. I myself have made a killing. Hunting is surely the sport of the rich. And if you are not rich at its start, you soon shall b, from the profit made off hides.");
		}
	}
