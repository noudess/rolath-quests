#Orc chit-chat
#Revised Angelox 10-23-06
#zone: Crushbone

sub EVENT_SPAWN
	{
	my $roll;

	$roll = int(rand(3));

	# One out of 3 can see invis.
	if ($roll == 0)
		{
		$npc->ModifyNPCStat("see_invis",  "1");
		}
	}

sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		quest::say("Hail, Emperor Crush!!");
		}
	}

