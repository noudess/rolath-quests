my $quest_started = 0;

sub EVENT_WAYPOINT_ARRIVE{
	if($wp==2){
		quest::SetRunning(1);
	}
	if($wp==3){
		quest::SetRunning(0);
	}
}

sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Greetings, traveler! Have you need of provisions or perhaps other wares? I sell what I find upon the battlegrounds of the Commonlands.");
		}

	if($quest_started = 1 && $text=~/Where is your house/i)
		{
		quest::say("Follow me.");
		quest::moveto(4791.06,-83.55,-51.47);
		quest::spawn(22196, 0, 0, 4707.63, -105.49, -51.47);
		$quest_started = 0;
		}
	}

sub EVENT_ITEM 
{ 
	if ($faction > 4)
		{
		quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		plugin::return_items(\%itemcount);
		}
	# Check for "A Note (Note To Altunic)".
	elsif(plugin::check_handin(\%itemcount, 18896 => 1))
	{
		quest::say("You are the one they have sent? A squire?!! I hope you can help me. I gather items strewn upon the grounds of the Commonlands. I sell them at good prices. Lately, I have been terrorized by a human rogue named Narl. He will no doubt appear at my [house] soon. Bring his head to me.");
		$quest_started = 1;
	}

	elsif(plugin::check_handin(\%itemcount, 13867 => 1))
	{
		quest::say("You have performed a great service to me, but I fear others will attack me while I stroll the countryside. It would be very noble of you to fetch me a cloth shirt for protection from wicked creatures. It is not much, but it will help.");

		quest::givecash("7","0","0","0");

		# Not sure it faction given or not.
		quest::faction(281,5); 
		quest::faction(271, -1);
		quest::faction(330, -1);
		quest::faction(362,1);
		quest::faction(311,1);
		quest::ding();
	}

	elsif(plugin::check_handin(\%itemcount, 1004 => 1))
	{
		quest::say("Thank you. You are very noble for a squire. I can see you becoming a very valuable asset to the Hall of Truth. Take this token. Tell Merko that you have [earned the Token of Generosity].");

		# Give player the "Token of Generosity".
		quest::summonitem("13865");

		# Factions from ZAM
		quest::faction(281,5); 
		quest::faction(271, -1);
		quest::faction(330, -1);
		quest::faction(362,1);
		quest::faction(311,1);
		quest::ding();
	}
}

#END of FILE Zone:ecommons  ID:22058 -- Altunic_Jartin 
