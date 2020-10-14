#Gharin.pl
#Gharin's Note (Good)


my $brewcount=0;

sub EVENT_SPAWN
	{
	$brewcount=0;
	}

sub EVENT_SAY 
	{
	if ($faction <= 6) # Could be needs more - know dubious fails
		{
		if($text=~/Hail/i)
			{
			quest::say("Good day! I see they have good stock for the future armies of Qeynos. I, myself, wish to be a soldier one day instead of doing this [job].");
			}

		if($text=~/job/i)
			{
			quest::say("I am a [messenger] for Antonius Bayle. Not big enough to fight, but light enough to run all the way to the [Jaggedpine] tomorrow morning. I sort of wish I did not have to go. I'd rather be at the Lion's Mane.");
			}

		if($text=~/Jaggedpine/i)
			{
			quest::say("I will be taking a private note to the head druid of the Jaggedpine Treefolk. Matter of fact, I am carrying the note right now. But enough about that, if it were not for the mission tomorrow, I could be doing something at the [Lion's Mane].");
			}
		if($text=~/Lion's Mane/i)
			{
			quest::say("Ahh. The Lion's Mane. If I were there, I would be enjoying a stein of Crow's [special brew]. They are expecting their first shipment of the brew. I believe if I had a few or more of those lagers, I would be very ill. I would probably have to have someone else deliver the note for me. Still, I wish I had one of those fine brews.");
			}

		if($text=~/special brew/i)
			{
			quest::say("Oh yes.  I would drink several of those given the chance...");
			}
		}
	else
		{
		plugin::reject_say();
		quest::say("I am thirsty though..  if only I had several of crow's special brews... several now....");
		}
	}

sub EVENT_ITEM 
	{
	my $i = 13799; # Crows special brew
	my $c = $itemcount{$i}; #count of brews this turnin.

	if ($c > 0)
		{
		if (plugin::check_handin(\%itemcount, $i => $c ))
			{
			for ($i = 1; $i<=$c ; $i++)
				{
				quest::say("Oh! That's tasty. I guess I could handle a few more.");
				$brewcount = $brewcount + 1;
				if ($brewcount >= 4)
					{
					$brewcount = 0;
					quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh..");
					quest::summonitem(18807);#Sealed Letter [Note To Jaggedpine - real]
					# Faction & XP verified on live
					quest::faction(262, 50);#Guards of Qeynos
					quest::faction(219, 7);#Antonius Bayle
					quest::faction(223, -12);#Circle Of Unseen Hands
					quest::faction(230, -7);#Corrupt Qeynos Guards
					quest::faction(291, 5);#Merchants of Qeynos
					quest::exp(364);
					quest::ding();
					quest::givecash(0, 1, 0, 0);#1sp
					}
				}
			}
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}

#End of File zone:qeynos ID: 1081 -- Gharin.pl
