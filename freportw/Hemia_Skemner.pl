
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("How are you? Welcome to the Academy of Arcane Science. Please feel free to roam. May knowledge be your goal. Be you a [fellow scientist] or visitor, I am sure you will find whatever you seek.");
		}

	if ($faction > 5)
		{
		quest::say("You had best leave my sight. I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
		}
	elsif ($faction > 4)
		{
		quest::say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us.  Perform a tasks for the great Tara Neklene.");
		}
	elsif($text=~/fellow scientist/i)
		{
		quest::say("That is good. I hope you can handle the knowledge of arcane science. Some have gone mad conducting research. Such a person is [Lydl Mastat].");
		}

	elsif($text=~/Lydl Mastat/i)
		{
		quest::say("Lydl Mastat is nothing more than a young apprentice of mine. He went mad working on a formula for deep water breathing. He now roams the outskirts of Freeport boasting of power he does not have. Someone should [teach Lydl a lesson].");
		}

	elsif($text=~/teach Lydl a lesson/i)
		{
		quest::say("Then go. He appears near the gates of Freeport from time to time. He is not powerful, but he has a secret. Nothing save magic can harm him. This was the result of an experimental potion he drank. Slay him and return his locked spellbook to me.");
		}

	}

sub EVENT_ITEM
	{
	# A Locked Book ID-13863
	if ($faction < 5 && plugin::check_handin(\%itemcount, 13863 =>1 )) 
		{
		quest::say("It is a shame we had to take such actions. I mourn for the sanity of Lydl. I cheer for the addition of such a fine wizard as yourself, $name. I found this while rummaging through my vault. Take it as thanks. It is not much.");
		quest::ding();
		quest::givecash ("9","9","5","0");
		#Factions verified ion ZAM
		# Arcane Scientists Faction
		quest::faction(220,"10");
		# Knights of Truth Faction
		quest::faction(281,"2");
		# Opal Dark Briar Faction
		quest::faction(296,"-1");
		# Freeport Militia Faction
		quest::faction(330,"-1");
		}
	plugin::return_items(\%itemcount);
	}


#END of FILE Zone:freportw  ID:9071 -- Hemia_Skemner
