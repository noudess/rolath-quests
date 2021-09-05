sub EVENT_SPAWN
	{
	quest::settimer("help", 10);
	}

sub EVENT_TIMER
	{
	my @moblist = $entity_list->GetClientList();
	foreach $mobby (@moblist)
		{
		my $mname = $mobby->GetName();
		my $mobX = int($mobby->GetX());
		my $mobY = int($mobby->GetY());
		my $mobZ = int($mobby->GetZ());
		
		# get distance from pc
		my $pc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));

		#Checking if within range of Lieutenant_Arathur to respond.
		if ($pc_dist <= 50 and !$mobby->CastToClient()->IsTaskActive(114))
			{
			quest::say("Hey $mname! Are you super busy?  We're looking for someonme to help with [Unsar]'s [problem]");
			quest::stoptimer("help");
			quest::settimer("help", 30);
			last;
			}
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 3)
		{
		$npc->SetAppearance(1);
		}
	if ($wp == 4)
		{
		$npc->SetAppearance(0);
		}
	if ($wp == 16)
		{
		quest::say("Gahlith, I'm going down to the docks to see if Ghul has anything new from overseas today. I'll be back in a little while.  Maybe I'll see someone to help Unsar while I am there.");
		}
	}


sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings..  I am Nostahla Westfend, understudy of Gahlith, and Second Master Wizard of the Order of Three.  Have you come to help [Unsar] with his, err, [problem]?");
		}
	elsif ($text =~ /Unsar/i)
		{
		quest::say("Unsar Koldhagon.  He's a man of many talents.  He's spent years of his life researching a new spell that he can 'call' his own. It hasn't really turned out like he had hoped.");
		quest::emote("chuckles");
		plugin::DoAnim("laugh");
		}
	elsif ($text =~ /problem/i)
		{
		quest::say("His continual obsession with vermin has left a permanent mark on his appearance.  An odd issue for an enchanter, I might say.  If you are [interested] in helping us look into the matter, we have an idea of how some unique ingredients might help Unsar look more like his old self.  If you stop in to see him, please be kind and don't let him know his new appearance is somewhat off-putting.");
		}
	elsif ($text =~ /interested/i)
		{
	    if (!quest::istaskactive(114))
			{
			my @task_array;
			push(@task_array, 114);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("I think you are already seeking the ingredients?");
			}
		}
	}

sub EVENT_TASKACCEPTED
	{
	quest::say("Very good $name, thank you for helping.  You will need to collect various components and and then see some experts.  Our own Caleah is an expert alchemist and can help with the rat problem.  Seek out Toxdil who is a poison expert to help with Unsar's slithering issue.  Hmmm the bat problem... ahh yes Blaize the Radient can do wonders with sunlight, I'm sure she will have a solutionfor Unsar's flapping problem!");
	}

#END of FILE Zone:qeynos  ID:1129 -- Nostahla_Westfend
