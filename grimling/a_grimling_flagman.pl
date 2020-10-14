# Part of Danarin's raid

sub EVENT_SAY 
	{ 
	if ($text=~/Hail/i)
		{
        quest::forcedoorclose(72);
		}
	}

sub EVENT_SPAWN
	{
	# if its the flag man, work the flag.
	$sx=$npc->GetSpawnPointX();
	$sy=$npc->GetSpawnPointY();
	if ($sx == 530 && $sy == -690)
		{
        quest::forcedoorclose(72);
		}
	}
