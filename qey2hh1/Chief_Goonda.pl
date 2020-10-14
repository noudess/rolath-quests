sub EVENT_SAY
	{
    if ($text=~/hail/i)
        {
        quest::say("Greetings to you, Reveree. What business do you have with us? We are quite busy with the [enchantment of the stone].");
        }
    elsif ($text=~/enchantment/i)
		{
        quest::say("That is none of your concern! I do believe that you should be on your way.");
		}
	}
