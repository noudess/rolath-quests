sub EVENT_SAY
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif ($text =~ /hail/i)
		{
		quest::say("I am Ssynthi, [Warder of Ro]. Would you do a simple [service] for me?");
		}
	elsif ($text =~ /warder of ro/i)
		{
		quest::say("I have renounced my ties to the Shadowed Men and become a follower of the one True Flame, Solusek Ro. I have hopes that one day my brethren will see the errors of their ways and cease their mindless war.");
		}
	elsif ($text =~ /service/i)
		{
		quest::say("The body of my true love lies within this tomb. I see a token to remember her by the flower which lies atop her coffin. I would get it myself, but the tomb is warded against my kind. Since I can not enter, I ask you to fetch it for me.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 14362 - Flower
	if ($faction < 6 && plugin::takeItems(14362 => 1))
		{
		quest::say("Thank you. Since you have done me a service with no thought of reward, I offer you this small token of my favor.");

		#:: Give a 14364 - Scepter
		quest::summonitem(14364);

		#:: Ding!
		quest::ding();

		#:: Set factions
		#:: per ZAM
		quest::faction(415, 1);    #:: + Temple of Solusek Ro
		quest::faction(416, -1);    #:: - Shadowed Men
									#:: Grant a moderate amount of experience
		quest::exp(1000);
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
