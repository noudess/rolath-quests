sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Hail. and welcome to Stormguard Hall. home to all great warriors! Are you also a [warrior of the Stormguard] or do you [follow another guild]?");
		}
	elsif ($text =~ /i follow another guild/i)
		{
		quest::say("Then go to your guild. This is the hall of the dwarven warriors - not a place for common folk to lounge around.");
		}
	elsif ($faction > 5)
		{
		quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.'");
		}
	elsif ($faction > 4)
		{
		quest::say("Prove yourself to the Stormguard and then we shall talk.  Perhaps you may assist Master Canloe and show your worth to us.");
		}
	elsif ($text =~ /i am a warrior of the stormguard/i)
		{
		quest::say("As I thought. You do not appear to be one who relies on wits rather than brawn. no offense. I have word that a Stormguard on duty has deserted his post at one of the guardposts in the Butcherblocks. I want you to go and seek him out. He is Guard Bundin. Return his Stormguard axe to me. along with his head. There shall be no cowards in the Stormguard!!");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 5 && plugin::check_handin( \%itemcount, 12156 => 1, 5014 => 1 ))
		{
		quest::say("I shall display this in the guard hall. Let it be a warning to all those who dare to run from battle. As for you, that was splendid work, but next time, remember to wrap decapitated heads in something drip-proof. Those stains will never come out! Oh yes, and here is your reward.");
		quest::exp(5000);
		quest::ding();
		# Factions verified.
		quest::faction( 274, 2 );
		quest::faction( 312, 15 );
		quest::faction( 293, 2 );
		quest::faction( 290, 3 );
		quest::faction( 232, -3 );
		quest::ChooseRandom( 5034, 7013, 6024, 5027, 6019 );
		quest::givecash( 3, 6, 10, 0 );
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins( \%itemcount, $class, 'Warrior' );
	plugin::return_items( \%itemcount );
	}

#END of FILE Zone:kaladima  ID:60006 -- Hogunk_Ventille
