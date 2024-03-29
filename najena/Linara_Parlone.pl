sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Please [help] me out of this horrid place! My family must be terribly worried!");
		}
	elsif ($text =~ /help/i)
		{
		quest::say("If you can find the [key] to my restraints. I should be able to escape.");
		}
	elsif ($text =~ /key/i)
		{
		quest::say("Last I knew, Najena's priest had the key. I fear he has left this place though. I heard talk of traveling to some estate. I know not where. Oh dear, oh dear! I shall never leave this place!");
		}
	}

sub EVENT_ITEM
	{
	#:: Match a 12269 - Tarnished Bronze Key
	if (plugin::takeItems(12270 => 1))
		{
		quest::say("Oh thank you $name! I must make my escape now. Give this note to my father in Felwithe, he will reward you handsomely for your service.");

		# Give a sealed letter
		quest::summonitem(12270);

		#:: Set faction
		# Verified
		quest::faction(275, 10);    #:: + Keepers of the Art
		quest::faction(279, 2);     #:: + King Tearis Thex
		quest::faction(246, 1);     #:: + Faydark's Champions
		quest::faction(239, -2);    #:: - The Dead

		#:: Ding!
		quest::ding();
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
