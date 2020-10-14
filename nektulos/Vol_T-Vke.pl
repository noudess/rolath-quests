sub EVENT_SAY
	{
	if ($race eq "Dark Elf")
		{
		quest::say("Welcome to the gates of Neriak, $name. Please enter the city but keep a watchful eye for we may still have some Troll guests within. Try not to assault them. For now, you are ok to pass through unharmed.");
		}
	else
		{
		quest::say("You haven't the face of a Dark Elf, I have nothing to speak to you about, begone.");
		}
	}
