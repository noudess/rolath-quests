my $mrace;
my $been_fishing = 0;
my $bitch;

sub EVENT_SPAWN
	{
	$mrace = $npc->GetRace();
	if ($mrace == 29)
		{
		quest::settimer("globalgargsit", 60);
		}
	
	# Make fishermen fish
	my $weapon_one = $npc->GetEquipmentMaterial(7);
	if ($weapon_one == 38)
		{
		quest::settimer("fishing", 12);	
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "globalgargsit")
		{
		plugin::SetAnim("sit");
		quest::stoptimer($timer);
		}
	elsif ($timer eq "fishing")
		{
		if ($been_fishing)
			{
			$bitch = int(rand(10));
			if ($bitch == 0)
				{
				quest::say("Damn it, spilled my beer again!");
				}
			}
		quest::doanim(5);	
		$been_fishing = 1;
		}
	}

sub EVENT_COMBAT
	{
	$mrace = $npc->GetRace();
	if ($mrace == 29)
		{
		if ($combat_state == 0)
			{
			quest::settimer("globalgargsit", 300);
			}
		elsif ($combat_state == 1)
			{
			quest::stoptimer("globalgargsit");
			plugin::SetAnim("stand");
			}
		}
	}
