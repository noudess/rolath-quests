# Inert Potion

sub EVENT_SAY 
	{

	if ($text=~/Hail/i)
		{
		quest::say("Welcome. my friend! We are the Craftkeepers. We study the circle of magic called enchantment. What circle do you [study]?");
		}

	if ($text=~/study enchantment/i)
		{
		quest::say("Then I welcome you into our circle. It is good to see new blood. I have a favor to ask of you. Do you wish to [assist Toresian] or do you not have the time?");
			
		# Depop any already spawned Slansin's
		quest::depop(23001);
		quest::depop(23081);

		quest::spawn2(quest::ChooseRandom(23001, 23081),0,0,575,683,-12.13,157);
		}

	if ($text=~/study magic/i)
		{
		quest::say("The ways of magic are not ours.  You should speak with the Gatecallers.  They will assist you.");
		}

	if ($text=~/study wizardry/i)
		{
		quest::say("Then you should visit with the Crimson Hands.  They are also found within the Palace of Erud.");
		}

	if ($text=~/assist/i)
		{
		if ($faction  >= 5) # need more clarification, know indiff not enuf
			{
			quest::say("You are most welcome into our circle of the CraftKeepers, but I require more service before we can discuss such things.");
			}
		else
			{
			quest::say("Ahhhhh $name. Slansin used to have need of those potions, however he mysteriously disappeared long ago. The only person I know of who still wants them is a cleric of the Church of Marr in Freeport.");
			quest::summonitem(13983);
			}
		}
	}

#END of FILE Zone:erudnint  ID:23073 -- Toresian_Fhabel
