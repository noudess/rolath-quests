sub EVENT_SIGNAL
	{
	if ($signal == 20)
		{
		quest::say("In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica and Faydwer.");
		}
	elsif ($signal == 23)
		{
		quest::say("The portals to Odus, Antonica and Faydwer will become active in five minutes. Please begin gathering in the portal areas.");
		}
	elsif ($signal == 24)
		{
		quest::say("As a reminder, the portals to Odus, Antonica and Faydwer will become active in three minutes.");
		}
	elsif ($signal == 25)
		{
		quest::say("One minute till teleportation to Odus, Antonica and Faydwer. Please be prepared to step onto the teleport pad.");
		}
	elsif ($signal == 26)
		{
		quest::say("The portals to Odus, Antonica and Faydwer are now active. Please stand on the pad and you will be teleported shortly. Come back soon.");
		quest::say("In approximately eleven minutes the portals will become active and will transport you back to Odus, Antonica and Faydwer."
			);
		}
	}
