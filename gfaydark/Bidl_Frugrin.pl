sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings $name. Do not you find the wine of Kelethin as sweet as their women?");
		}
	elsif ($faction > 5)
		{
		quest::say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		}
	elsif ($faction > 4)
		{
		quest::say("I cannot yet fully trust you");
		}
	elsif ($text =~ /lens/i)
		{
		quest::say("Oh my!! I forgot I had that. Here you are. You better take it back.  I need to go elsewhere, bye now.");

		#:: Give a 13276 - Telescope Lens
		quest::summonitem(13276);
		}
	}
