my $FollowTarget;
my $User;
my $engaged=0;

sub EVENT_AGGRO
	{
	quest::say("Guards! Guards! Help me!!");
	}

sub EVENT_SAY
	{
	#:: Match if FollowTarget is not defined (nobody has triggered a follow event yet)
	if (!$FollowTarget)
		{
		quest::say("Hello there $name. I don't suppose you can spare some coins? I'm just a poor halfling that is far away from home. I can't afford anything to eat or drink. Anything you can offer me will be of help.");
		$FollowTarget = $charid;
		$User         = $userid;

		#:: Set a timer to loop every 5 seconds
		quest::settimer("follow", 5);

		#:: Set appearance to Stand
		$npc->SetAppearance(0);
		}
	}

sub EVENT_ITEM
	{
	#:: Match if FollowTarget is not defined (nobody has triggered a follow event yet)
	if (!$FollowTarget)
		{
		quest::say("Oh thank you . You are too kind to this poor halfling. Do you have anything else to give me?");
		$FollowTarget = $charid;
		$User         = $userid;

		#:: Set a timer to loop every 5 seconds
		quest::settimer("follow", 5);

		#:: Set appearance to Stand
		$npc->SetAppearance(0);
		}
	}

sub EVENT_TIMER
	{
	#:: Match timer "follow"
	if ($timer eq "follow")
		{
		#:: Match if FollowTarget is defined (someone triggered a follow event)
		if ($FollowTarget)
			{
			#:: Create a scalar variable to store the following target by entity ID
			my $FollowingTarget
				= $entity_list->GetClientByCharID($FollowTarget);

			my $crushmob = $FollowingTarget->CastToMob();
			if ($crushmob->IsInvisible($npc))
				{
				my $crush = $FollowingTarget->GetName();
				quest::attack($crush);
				$FollowingTarget = 0;
				}

			#:: Match if the target was defined, but is no longer on the entity list
			if (!$FollowingTarget)
				{
				undef $FollowTarget;
				undef $User;

				#:: Stop following (just in case)
				quest::sfollow();

				#:: Return to spawn point
				quest::moveto(2407, 1482, -0.25, 331, 1);
				}

			#:: Match if the following target is on the entity list
			else
				{
				#:: Follow the target who triggered the follow event
				quest::follow($User);
				AssistMyTarget();
				}

			}

		#:: Match if no follow target is defined
		else
			{
			#:: Match if back at spawn point
			if ($x == 2407 && $y == 1482)
				{
				#:: Set appearance to Feign Death
				$npc->SetAppearance(3);

				#:: Cleanup the timer "follow"
				quest::stoptimer("follow");
				}
			}
		}
	}

sub AssistMyTarget
	{
	if ($engaged == 0)
		{
		my @moblist = $entity_list->GetMobList();
		foreach $mobby (@moblist)
			{
			my @mobbyhate=$mobby->GetHateList();
			my $hate_count = @mobbyhate;
			if ($hate_count > 0)
				{
				foreach $mobbyent (@mobbyhate)
					{
					$theent=$mobbyent->GetEnt();
					if ($theent)
						{
						if ($theent->IsClient())
							{
							my $thisclient=$theent->CastToClient();
							my $ctar=$thisclient->CharacterID();
							
							if ($ctar == $FollowTarget)
								{
								# Our owner is on this mob's hate list.
								# if he gets close enough - attack.
								my $mobX = int($theent->GetX());
								my $mobY = int($theent->GetY());
								my $mobZ = int($theent->GetZ());

								# get distance from npc
								my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));
								#Don't go very far to attack
								if ($npc_dist <= 50) 
									{
									$mobname=$mobby->GetCleanName();

									# Don't attack my own faction
									my $ctnpc=$mobby->CastToNPC();
									my $tarpf = $ctnpc->GetPrimaryFaction();
									if ($npc->GetPrimaryFaction() == $ctnpc->GetPrimaryFaction()) 
										{
										quest::say("STOP $ownername, I will not attack my bretheren.");
										}
									else
										{
										$engaged=1;
										quest::attacknpc($mobby->GetID());
										$lastmob=$mobname;
										last;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}


sub EVENT_COMBAT
	{
	my $target=$npc->GetTarget();

	if ($combat_state == 1) # Entering Combat
		{
		# Do NOT set engaged.... it will break because of order
		# of EVENT_AGGRO and EVENT_COMBAT
		# $target isn't even set yet...
		}
	else
		{
		$engaged=0;
		}
	}
