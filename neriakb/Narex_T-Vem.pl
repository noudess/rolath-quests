#Narex_T-Vem.pl
#Fire Goblin Runner/Halfling Raider Helms

my $capcount=0;

sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("Welcome to the Cauldron of Hate. If you are a young warrior, you have come to the right place. There are many [duties] to be performed. If you are a veteran of the blade, we welcome your return to service. Perhaps you return with a [Leatherfoot] skullcap?");
		}
	elsif ($faction > 5)
		{
		quest::say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");
		}
	elsif ($faction == 5)
		{
		quest::say("Go!! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		}
	elsif($text=~/duties/i) 
		{
		quest::say("I am so glad you asked. There is one matter of importance with which you may be able to assist. It seems an Erudite has made camp in Lavastorm. He is powerful and we do not expect you to slay him. Your mission is to cut off his supply line. I hope you will [accept the mission].");
		}
	elsif($text=~/accept the mission/i) 
		{
		quest::say("Go to the Lavastorm Mountain Range. It is a dangerous place, but the one you seek must leave by the direction you entered. He is a goblin. Apparently the Erudite is employing their strength. The fire goblin runner shall be an easy kill for you. At least, he should be. Return his runner pouch to me.");
		}
	elsif($text=~/leatherfoot/i) 
		{
		quest::say("Where have you been? The halflings of Rivervale have an elite force of warriors. They are called the Leatherfoot Raiders. They have been infiltrating our glorious city of Neriak for quite some time. They must be exterminated! I must hire strong warriors who wish to [collect the bounty].");
		}
	elsif($text=~/collect the bounty/i) 
		{
		quest::say("So you wish to collect the bounty on Leatherfoot Raiders? Then go into Nektulos and hunt them down. I shall pay a reward for no fewer than four Leatherfoot Raider skullcaps.");
		}
	}

sub EVENT_ITEM 
	{
	my $c = $itemcount{13113}; # Count of caps turned in this time

	if($faction <=4 && plugin::check_handin(\%itemcount, 13886 => 1)) 
		{ #Goblin Supply Pouch
		quest::say("Fine work. I trust the denizens of Lavastorm were not unkind. Please take this featherweight pouch as a reward. May it keep you fleet of foot.");
		# Factions Verified
		quest::summonitem(17972); #Featherweight Pouch
		quest::faction(270, 25); #Indigo Brotherhood
		quest::faction(326,-3); #Emerald Warriors
		quest::faction(311,-1); #Steel Warriors
		quest::faction(1522,-50); #Primordial Malice
		quest::exp(17150);#5% of level 8 experience, quest is for levels 8+  
		quest::ding();
		}

	if($faction <= 5 && plugin::check_handin(\%itemcount, 13113 => $c)) 
		{ #Leatherfoot Raider Skullcap
		for ($i=0; $i<$c;$i++)
			{
			$capcount = $capcount +1;
			if ($capcount < 4)
				{
				quest::say("Fool! There shall be no reward until I have four skullcaps in my hands!");
				}
			elsif ($capcount == 4)
				{
				quest::say("'I had my doubts, but you have proven them false. You are a fine warrior. You must continue to refine your talents. I reward you with the footman's voulge! Welcome into our house of warriors. Let us share skills as we shall share foes.");
				# Factions Verified
				quest::summonitem(12257);#Footman's Voulge
				quest::givecash(0,0,4,0);#4gp
				quest::faction(270, 50); #Indigo Brotherhood
				quest::faction(326,-7); #Emerald Warriors
				quest::faction(311,-2); #Steel Warriors
				quest::faction(1522,-100); #Primordial Malice
				$client->AddLevelBasedExp(14.2,3);
				quest::ding();
				$capcount=0;
				$i=$c;
				}
			}
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	
	}
#END of FILE Zone:neriakb  ID:41032 -- Narex_T-Vem 
