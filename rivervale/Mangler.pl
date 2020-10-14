my $SpawnX = -247;
my $SpawnY = -159;
my $SpawnZ = 1.88;
my $SpawnH = 33;


sub EVENT_SPAWN 
	{
	$SpawnX = $x;
	$SpawnY = $y;
	$SpawnZ = $z;
	$SpawnH = $h;
	quest::settimer("mangler",300);
	}

sub EVENT_AGGRO
	{
	quest::settimer("leash", 1);
	}

sub EVENT_TIMER 
	{
	if ($timer eq "mangler")
		{
		quest::say("<Bark, bark, bark! Hoooooowwwwwwl!>");
		if (plugin::zoneClientCount() > 0)
			{
			quest::signal(19049,1);
			}
		}
	elsif ($timer eq "leash")
		{
		my $deltax = abs($x - $SpawnX);
		my $deltay = abs($y - $SpawnY);
		if ($deltax > 50 || $deltay > 50)
			{
			quest::emote("growls and goes back to guarding his bed");
			WIPE_AGGRO();
			}
		}
	}

sub WIPE_AGGRO 
	{
	$npc->BuffFadeAll();
	$npc->WipeHateList();
	$npc->SetHP($npc->GetMaxHP());
	$npc->GMMove($SpawnX,$SpawnY,$SpawnZ,$SpawnH);
	quest::stoptimer("leash");
	}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox 
