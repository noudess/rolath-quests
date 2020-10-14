#This NPC assists newbies in the starting area.

my $owner = 0;
my $mychar = 0;
my $ownernname = "";
my $mobname="";
my $lastmob="";
my $pf=0;
my $engaged=0;

sub EVENT_SPAWN
{
	$pf=$npc->GetPrimaryFaction();
	$engaged=0;
	$npc->SetAllowBeneficial(1);
	$npc->SetOOCRegen(0);
	$lifespan=24*60*60;
	quest::settimer("death", $lifespan);
}

sub EVENT_SAY
	{
	$pf=$npc->GetPrimaryFaction();
	if ($faction <= 7)
		{
		if ($text =~ /hail/i)
			{
			if ($owner == 0)
				{
				if ($ulevel >= ($mlevel -5))
					{
					$owner = $client;
					$mychar = $client->CharacterID();
					$ownername = $name;
					quest::follow($userid);
					quest::settimer("assist", 2);
					quest::stop();
					}
				else
					{
					COLOR_SAY("young");
					}
				}
			else
				{
				# If someone hails an owned (unreleased) apparation
				if ($ownername ne $name)
					{
					COLOR_SAY("owned");
					quest::say("Only $ownername can release me.");
					}
				}
			}
		
		if ($ownername eq $name)
			{
			if ($text =~ /assist off/i)
				{
				COLOR_SAY("assistoff");
				quest::stoptimer("assist");
				}
			elsif ($text =~ /assist on/i)
				{
				$engaged=0;
				COLOR_SAY("assiston");
				quest::settimer("assist", 2);
				}
			elsif ($text =~ /assist/i)
				{
				quest::say("I respond to [assist on] and [assist off] along with a great many other commands that you're just going to have to figure out for yourselves.");
				}
			elsif ($text =~ /stay/i)
				{
				quest::stoptimer("assist");
				COLOR_SAY("stay");
				quest::say("I am no longer assisting.");
				quest::moveto($x, $y, $z, $h, 1);
				quest::sfollow();
				quest::settimer("stay", 1);
				}
			elsif ($text =~ /follow/i)
				{
				$engaged=0;
				COLOR_SAY("follow");
				quest::settimer("assist", 2);
				quest::say("I am now assisting.");
				quest::follow($userid);
				}
			elsif ($text =~ /release/i)
				{
				$owner=0;
				COLOR_SAY("release");
				quest::sfollow();
				}
			}
		}
	else
		{
		COLOR_SAY("faction");
		}
	}

sub EVENT_TIMER
	{
	$npc->RemoveFromHateList($owner);

	if ($timer eq "death")
		{
		quest::shout("I can serve you no longer, $ownername.  I feel my spirit fading.");
		$npc->Depop(0);
		}
	elsif ($timer eq "stay")
		{
		quest::stoptimer("stay");
		$npc->SetAppearance(1);
		}
	# Must be assist timer - look for new mobs or deal with the one we have
	elsif ($engaged == 0)
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
							
							if ($ctar == $mychar)
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
										if (!$mobby->IsClient())
											{
											COLOR_SAY("encombat");
											}
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
	else
		{ # We are engaged in battle...

		# Check to see what % current mob is at.
		# If it is less than a safe spot to check, drop hate and reset to try and not steal xp
		$mytarget = $npc->GetTarget();
		if ($mytarget)
			{
			$ratio = $mytarget->GetHPRatio();
			if ($ratio <= 12)
				{
				$casted=$mytarget->CastToNPC();
				$casted->RemoveFromHateList($npc);
				$npc->AddToHateList($mytarget, 1);
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
		if (!$target->IsClient())
			{
			COLOR_SAY("excombat");
			}
		}
	}

sub EVENT_AGGRO
	{
	$npc->RemoveFromHateList($client);
	}

# Spit out some text based on situation.
sub COLOR_SAY
	{
	my $vtext;
	my %mobtext = (
		265 => { 
				"stay" => "What am I, your dog?  Watch yourself.", 
				"follow" => "Very well, we shall see if you are worthy.", 
				"release" => "About time you grew a set.  I shall remain.", 
				"assistoff" => "Ha!  Ready to do your own dirty work?", 
				"assiston" => "I will help you since you are weak.",
				"excombat" => "The might of the Heretics proves successful yet again!",
				"encombat" => "Foolish weakling, cower in fear at the might of a servant of Cazic Thule.",
				"faction" => "Foolish creature, how dare you insult me.  You are not worthy of the Heretics.",
				"owned" => "You have nerve.",
				"young" => "You must mature before I deem you worthy to assist." },
		298 => { 
				"stay" => "I will stay here until you return.", 
				"follow" => "Following you friend.", 
				"release" => "Be safe friend.  Call on me again if you are in need.", 
				"assistoff" => "I shall not interfere.", 
				"assiston" => "I will endeavor to be of assistance.",
				"encombat" => "You shall pay for your insolence to my people!",
				"excombat" => "Once again Erudite intelligence proves victorious!",
				"faction" => "Your deeds have not proven worthy enough to gain my service.",
				"owned" => "I am currently assisting someone.",
				"young" => "Perhaps when you mature some, I will help with your efforts." }
		);

	$vtext=$mobtext{$pf}{$_[0]};
	quest::say("$vtext");
	}
