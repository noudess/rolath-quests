
sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Hail, $name! We are the Steel Warriors of Freeport. Our training disciplines have created some of the finest warriors ever to walk upon Norrath. Perhaps the bards shall sing songs of you one day. Let your first mission be the extermination of [Clan Deathfist].");
		}
	if($text=~/clan deathfist/i) 
		{
		quest::say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts. If you are a true warrior of the bunker. perhaps you can begin with [the green and blue].");
		}
	if($text=~/the green and blue/i && $class eq "Warrior") 
		{
		quest::say("The green and blue was a test for all skilled warriors. All one needed do was return to me four orc legionnaire shoulderpads. Two from the loathsome green skinned Deathfist Clan and two from the vile blue skinned Crushbone Clan. But we have no more bunker battle blades to spare. We must prepare for war!!");
		}
	if($text=~/bigger problem/i) 
		{
		quest::say("The bigger problem is the Freeport Militia. Go to the Hall of Truth and speak with the Knights of Truth about that. They have already started their campaign to rid the city of the militia. The so-called Freeport Militia is not to be trusted.");
		}
	}

sub EVENT_ITEM 
	{
	if($itemcount{13916} > 1)
		{
        my $uselevel=$ulevel;
        my $xpgained;
        my $perc=19.0/125.0;

        if ($ulevel > 6)
            {
            $uselevel = 6;
            }

		my $xpthislevel = (($uselevel**3) * 1000) - ((($uselevel-1)**3) * 1000);

        $xpgained = ($itemcount{13916} / 2) * $xpthislevel * $perc;


		plugin::mass_handin(13916, 2, \&BeltReward);
		quest::say("Very fine work $name. With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");

        quest::exp($xpgained);
		}

	elsif(plugin::check_handin(\%itemcount, 18748 => 1)) #A Tattered Note
		{
		quest::say("Welcome to the Steel Warriors, young warrior. It is time to prove your mettle. Look to the outskirts of Freeport and join the fray. Show Clan Deathfist what a warrior of the bunker can do.");
		# Fixed factions while working Faqtion.
		quest::faction(330,-15); #Freeport Militia
		quest::faction(311,100);  #Steel Warriors
		quest::faction(281,20);  #Knights of Truth
		quest::faction(230,-15);  #Corrupt Guards of Qeynos
		quest::faction(262,20);  #Guards of Qeynos
		quest::ding();
		quest::summonitem(13572); #Dirty Training Tunic
		quest::exp(40);
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}


sub BeltReward
	{
	#Faction Verified on ZAM
	quest::faction(311,5);  #Steel Warriors
	quest::faction(281,1);  #Knights of Truth
	quest::faction(262,1);  #Guards of Qeynos
	quest::faction(330,-1); #Freeport Militia
	quest::faction(230,-1);  #Corrupt Guards of Qeynos
	quest::ding();
	quest::givecash(0,0,8,0);
	}
#END of FILE Zone:freportw  ID:9092 -- Cain_Darkmoore
