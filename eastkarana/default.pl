my $npccheck;
my $fleeing=0;
my $mobtexture;
my $mrace;
my $bully;
my $bname;

sub EVENT_COMBAT 
	{
	if ($combat_state == 1)
		{
		if($fleeing == 0)
			{
			$mobtexture = $npc->GetTexture();
			$mrace = $npc->GetRace();
			if ($mrace == 39 and ($mobtexture ==0 or $mobtexture == 2))
				{
				my $myid;
				$myid = $npc->GetNPCTypeID();
				if ($myid == 15084 or $myid == 15093)
					{
					quest::say("Slay the hairless ones!");
					}
				else
					{
					quest::say("For the glory of Zek!  Attack!!");
					}
				}
			}
		}
	}

sub EVENT_SPAWN
	{
	$mobtexture = $npc->GetTexture();
	$mrace = $npc->GetRace();
	if ($mrace == 39 and ($mobtexture ==0 or $mobtexture == 2))
		{
		quest::settimer("giantcheck", 5);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "giantcheck")
		{
		if ($npc->IsEngaged() == 0)
			{
			# See if any giants close
			@moblist = $entity_list->GetMobList();
			foreach $mobby (@moblist)
				{
				my $mobX = int($mobby->GetX());
				my $mobY = int($mobby->GetY());
				my $mobZ = int($mobby->GetZ());

				# get distance from npc
				my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));
				my $npctype = $mobby->GetNPCTypeID();

				if ($npc_dist < 150 && $fleeing == 0 && $npctype == 15195)
					{
					$bname = $mobby->GetCleanName();
					$fleeing = 1;
					$npc->SetSpecialAbility(37, 100);
					$npc->Damage($mobby,1,0,0);
					$bully = $mobby;
					$npc->RemoveFromHateList($bully);
					$npc->SetTarget($bully);
					quest::settimer("stopfleeing", 2);
					last;
					}
				}	  
			}
		}

	if ($timer eq "stopfleeing")
		{
		$fleeing = 0;
		$npc->SetSpecialAbility(37, 25);
		quest::stoptimer("stopfleeing");
		}
	}
