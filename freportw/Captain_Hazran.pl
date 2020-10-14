
sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Hail, $name! We are the Militia of Freeport. Our training disciplines have created some of the finest guards ever to walk upon Norrath. To prove your loyalty and ability your first mission is to be the extermination of [Clan Deathfist].");
		}
	if($text=~/clan deathfist/i) 
		{
		quest::say("Clan Deathfist are the orcs of the Commonlands. They are a nuisance and Sir Lucan has ordered their extermination. You will go forth into the Commonlands and kill these orcs. Clan Deathfis'st members are known to wear a clan belt. Bring a belt to me as proof of each death and you shall receive your wages and prove your allegiance to Freeport and all that is good.");
		}
	if($text=~/bigger problem/i) 
		{
		quest::say("The bigger problem is the Knights of Truth. We have already started our campaign to rid the city of the Knights. The so-called Knights of Truth are not to be trusted.");
		}
	}

sub EVENT_ITEM 
	{
	if($itemcount{13916} > 0) #Deathfist Slashed Belt
		{
		my $uselevel = $ulevel;
		my $xpgained;
		my $perc=19.0/125.0;	

		if ($ulevel > 6)
			{
			$uselevel = 6;
			}

		my $xpthislevel = (($uselevel**3) * 1000) - ((($uselevel-1)**3) * 1000);

        $xpgained = $itemcount{13916} * $xpthislevel * $perc;

		plugin::mass_handin(13916, 1, \&BeltReward);
		quest::say("Good work, warrior, you are good militia material. Beware though, there are some who dare to call us foe.  With your help, we shall soon rid the commonlands of the orcs, then we can move on to a [bigger problem].");

		quest::exp($xpgained);
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
	quest::ding();
	#Factions verified on ZAM
	quest::faction(330,5); #Freeport Militia
	quest::faction(336,1); #Coalilition of Tradefolk Underground
	quest::faction(362,-1); #Preists of Marr
	quest::faction(281,-1); #Knights of Truth
	quest::givecash(0,0,8,0);
	}
#END of FILE Zone:freportw  ID:9109 -- Captain_Hazran
