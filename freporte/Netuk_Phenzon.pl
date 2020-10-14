sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome $name. Let us fill your heart with hate. May you carry that hate unto your fellow citizens. Innoruuk has need of your services. We have A [ mission ] for you. ");
		}
	elsif ($faction > 4)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/mission/i)
		{
		quest::say("There is a man called Groflah Steadirt. He runs A weapons shop here in Freeport. Our sources tell us he was given A piece of parchment taken from one of our allies. Who that is is none of your business. We only require you to recover the parchment, which he No doubt has on him. End his life and return the note to me. Do not let me see your miserable face again until you have the parchment. ");
		}

	}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
	{
	if($faction < 5 && plugin::check_handin(\%itemcount, 18818 => 1))
		{
		quest::say("It is about time you returned! Innoruuk would be proud of the red you have spread upon the land.");
		# Verified
		quest::faction(271,30);
		quest::faction(296,6);
		quest::faction(281,-4);
		quest::summonitem(15343);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}
