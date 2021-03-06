my $cash=0;
my $beads=0;

sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Please look around. We have many items exclusively for the members of the Temple of Life. We also have [scroll strongboxes]. If you are unsure of what an item is, feel free to ask me.");
		}
	elsif ($faction > 5)
		{
		quest::say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		}
	elsif($text=~/what scroll strongboxes/i)
		{
		quest::say("The scroll strongboxes are merely personal safes. Most of the members use them. I am afraid all are taken, but if you are here to remove a scroll, merely hand me your key and I shall get it for you. I handle all 20 numbered keys and [Whysia] handles all 30 and 40 numbered keys.");
		}
	elsif($text=~/prayer beads/i)
		{
		quest::say("The prayer beads are the blessed necklaces of the Priests of Life.  The beads have a few charges of minor healing.  I recharge them for all members in  good standing.  All I need are the beads and a donation of 100 gold pieces.");
		}
	}

sub EVENT_ITEM
	{
	if ($faction > 5)
		{
		quest::say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		}
	else
		{
		$cash = $cash + $copper + (10 * $silver) + (100 * $gold) + (1000 * $platinum);

		if ($beads == 1 || plugin::check_handin(\%itemcount, 13296 => 1))
			{
			if ($cash >= 100)
				{
				quest::say("I see your beads need to be charged. Very well, here you are. Use them and good health to you!!!");
				quest::summonitem(13296);
				$cash = $cash - 100;
				$beads=0;
				}
			else
				{
				$beads=1;
				quest::say("As instructed by High Priestess Jahnda I must ask for the beads and a donation of 100 gold coins.");
				}
			}

		if($itemcount{13306} == 1)
			{
			if ($faction < 5)
				{
				quest::say("Oh, turning in your key, are you? Very well, defender of life. Here you are.");
				quest::summonitem(quest::ChooseRandom(59575));
				}
			else
				{
				quest::summonitem(13306);
				}
			}
		}
	}
