my $pickcount=0;

sub EVENT_SPAWN
	{
	$pickcount=0;
	}

sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{  
		quest::say("And who do you think you are? To step into the Cauldron of Hate one should have the black soul of a warrior. For one to speak with Trizam he should have good reason. Perhaps you return with tales of [deathfist] agendas. If so, then you're a year too late.");
		}
	if($text=~/deathfist/i)
		{
		# Orc Pawn Picks
		quest::say("Have you been spending day and night at the Malden's Fancy?!! The Deathfist Orcs in the Commonlands are up to something. As the inept humans in Freeport hunt down the warrior orcs, the pawns run about on some secret mission. I have been appointed by King Nathox to attend to this matter and hire young warriors who wish to [collect] pawn kills.");
		}
	if($text=~/collect/i)
		{
		if ($faction > 4)
			{
			quest::say("Go!! Return when you have done more to serve the Indigo Brotherhood of Neriak.");
			}
		else
			{
			quest::say("Yes, You will. You need not know the reason why. I command you by order of King Naythox Thex to venture forth to the Commonlands and slay all the orc pawns you see. Return with four pawn picks and maybe I shall even reward you. Leave at once or you shall find yourself hanging from the Hooks of Innoruuk!");
			}
		}
	}

sub EVENT_ITEM 
	{
	my $i = 13885; # Orc Pawn Picks
	my $c = $itemcount{$i}; #count of picks this turnin

	if ($c > 0 && $faction < 5)
		{
		if(plugin::check_handin(\%itemcount, $i => $c)) #Orc Pawn Picks
			{
			for ($i = 1; $i <= $c ; $i++)
				{
				$pickcount = $pickcount + 1;

				if ($pickcount < 4)
					{
					quest::say("I instructed you to return with no fewer than four pawn picks!");
					}
				else
					{
					# Factions verified on ZAM
					$pickcount = 0;
					quest::say("So you have done your part to serve the King.  As instructed, I shaw reward your good deed. But I choose to reward you with provisions from the pantries of Neriak. They shall keep you strong.");
					quest::faction(270,10);   # +Indigo Brotherhood
					quest::faction(326,-1);   # -Emerald Warriors
					quest::faction(311,-1);   # -Steel Warriors
					quest::faction(1522,-20);  # Primordial Malice
					$client->AddLevelBasedExp(14.2, 3); # Tested at level 3 - could extend
					quest::ding();
					# Summon: Neriak Nectar 
					quest::summonitem(quest::ChooseRandom(13021,13022), 2);
					} 
				}
			}
		}
	else 
		{
		quest::say("I have no need for this item $name, you can have it back.");
		plugin::return_items(\%itemcount);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}

