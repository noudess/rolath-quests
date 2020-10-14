sub EVENT_SAY 
	{ 

	if($text=~/Hail/i)
		{
		quest::say("I'm Captain Bosec. and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass."); 
		}

	if($text=~/goblin/i)
		{
		quest::say("Goblins are vile creatures, help us exterminate them. They call themselves the [Pickclaw] Clan.. I call them annoying. I will gladly pay big money for the left ear of every goblin slain."); 
		}

	if($text=~/pickclaw/i)
		{
		quest::say("A couple of months ago, Carson decided to add some more floors beneath the keep. During the construction, we came across these tunnels.. and these goblins. Work has been temporarily halted until we can completely clear out this Pickclaw infestation."); 
		}
	}

sub EVENT_ITEM 
	{ 
	# Left Goblin Ear ID-13790
	my $ear = 0;
	if (plugin::check_handin(\%itemcount,13790=>4)) {$ear=4;
	} elsif (plugin::check_handin(\%itemcount,13790=>3)) {$ear=3;
	} elsif (plugin::check_handin(\%itemcount,13790=>2)) {$ear=2;
	} elsif (plugin::check_handin(\%itemcount,13790=>1)) {$ear=1;
	}
	if ($ear>=1) 
		{
		for ($i=0; $i<$ear; $i++) 
			{
			quest::say("Well done! We could really use the extra help around here.");
			$client->AddLevelBasedExp(1,24);
			quest::ding();
			quest::givecash("3","5","6","0");
			#Verified on ZAM
			quest::faction(329,1); # Carson McCabe
			quest::faction(230,1); # Corrupt Qeynos Guards
			quest::faction(332,2); # Highpass Guards
			quest::faction(331,1); # Merchants of Highpass
			quest::faction(330,1); # Freeport Militia

			}
		}
	}

#END of FILE Zone:highkeep  ID:6034 -- Captain_Bosec.pl  

