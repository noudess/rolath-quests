# Unsar's Glory

sub EVENT_SPAWN
	{
	quest::settimer("poly", 10);
	}

sub EVENT_TIMER
	{
	NEW_FORM();
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello, $name, I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?");
		quest::say("Have you seen Nostahla recently....?  She's trying to help me with my uhhh... problem.");
		}

	if ($faction <= 7 && $text =~ /unsar's glory/i)
		{
		quest::say( "Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some [rat whiskers], [snake scales], and two [bat wings], and I'll show you how it works.");
		}

	}

sub EVENT_ITEM
	{
	if ($faction <= 7
		&& plugin::check_handin(\%itemcount, 13071 => 1, 13070 => 1, 13068 => 2)
		)
		{    # batwing 2, snake scale, rat whiskers
		quest::say( "All right, check this out... Maybe one day you'll be good enough to do this too.");
		quest::doanim(15);

		# Faction from ZAM
		# Xp from live via spreadsheet
		quest::faction(342, 5);     # Order of Three
		quest::faction(262, 1);     # Guards of Qeynos
		quest::faction(221, -1);    # Bloodsabers
		quest::faction(296, -1);    # Opal Dark Briar
		quest::exp(145);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 232626 => 1, 232627 => 1, 232628 =>1))
        {
		quest::stoptimer("poly");
		quest::settimer("poly", 3600);
        quest::say("Ahhhh.... Unhhhh... Eeeekkkk what's happening!!  Oh yes this is much better, thank you $name, I thought I'd never stop morphing!");
		$npc->SetRace(1);
		
		my $reward = 0;
		
		if ($class eq "Wizard")
			{
			if ($level < 26)
				{
				$reward = 7653;
				}
			else
				{
				$reward = 7655;
				}
			}
		elsif ($class eq "Enchanter")
			{
			if ($level < 26)
				{
				$reward = 15243;
				}
			else
				{
				$reward = quest::ChooseRandom(15243, 30474, 7665);
				}
			}
		elsif ($class eq "Magician")
			{
			if ($level < 25)
				{
				$reward = quest::ChooseRandom(23517, 7632, 23525);
				}
			else
				{
				$reward = quest::ChooseRandom(23517, 30400, 23525);
				}
			}
		else
			{
			# Grant some permanent MR
			# Maybe cap this as it could be repeated ad naseum
			# $client->IncrementAA(47);  Not sure we want this - level restrict
			}

		if ($reward != 0)
			{
			quest::say("Take this scroll as a reward for your kindness!");
			quest::summonitem($reward);
			}

        quest::updatetaskactivity(114,15);
        quest::ding();
        }
	}

sub NEW_FORM
	{
	my $form = quest::ChooseRandom(36, 415, 34, 37);
	$npc->SetRace($form);

	if ($form == 34)
		{
		quest::say("No!  Not a bat again.  I'm going to throw up this time for sure.");
		}
	elsif ($form == 37)
		{
		quest::say("Thissssssssssss sssssucks....");
		}
	else
		{
		quest::say("Damn it.  I hope that female rodent doesn't come by and rub against me again!");
		}

	my $polytime = int(rand(1200));
	quest::stoptimer("poly");
	quest::settimer("poly", $polytime);
	}

#END of FILE Zone:qeynos  ID:1066 -- Unsar_Koldhagon.pl
