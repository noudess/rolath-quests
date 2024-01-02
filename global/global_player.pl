my $mytimer = "";

sub EVENT_SAY
	{
	my $c;

	if ($text =~ /boatstatus/i)
		{
		# Check on Golden Maiden
		$c = quest::get_spawn_condition("qeynos", 0, 4);
		if ($c > 0)
			{
			quest::shout("Golden Maiden is in qeynos.");
			}
		$c = quest::get_spawn_condition("erudnext", 0, 6);
		if ($c > 0)
			{
			quest::shout("Golden Maiden is in Erudin.");
			}
		$c = quest::get_spawn_condition("erudsxing", 0, 4);
		$c = $c + quest::get_spawn_condition("erudsxing", 0, 6);
		if ($c > 0)
			{
			quest::shout("Golden Maiden is in Eruds Crossing.");
			}

		# Check on Sea King
		$c = quest::get_spawn_condition("qeynos", 0, 5);
		if ($c > 0)
			{
			quest::shout("Sea King is in qeynos.");
			}
		$c = quest::get_spawn_condition("erudnext", 0, 7);
		if ($c > 0)
			{
			quest::shout("Sea King is in Erudin.");
			}
		$c = quest::get_spawn_condition("erudsxing", 0, 5);
		$c = $c + quest::get_spawn_condition("erudsxing", 0, 7);
		if ($c > 0)
			{
			quest::shout("Sea King is in Eruds Crossing.");
			}
		# Check on Siren's Bane
		$c = quest::get_spawn_condition("butcher", 0, 4);
		if ($c > 0)
			{
			quest::shout("Siren's Bane is in butcherblock.");
			}
		$c = quest::get_spawn_condition("freporte", 0, 6);
		if ($c > 0)
			{
			quest::shout("Siren's Bane is in Freeport.");
			}
		$c = quest::get_spawn_condition("oot", 0, 4);
		$c = $c + quest::get_spawn_condition("oot", 0, 6);
		if ($c > 0)
			{
			quest::shout("Siren's Bane is in the Ocean of Tears.");
			}

		# Check on StormBreaker
		$c = quest::get_spawn_condition("butcher", 0, 5);
		if ($c > 0)
			{
			quest::shout("StormBreaker is in Butcherblock.");
			}
		$c = quest::get_spawn_condition("freporte", 0, 3);
		if ($c > 0)
			{
			quest::shout("StormBreaker is in Freport.");
			}
		$c = quest::get_spawn_condition("oot", 0, 5);
		$c = $c + quest::get_spawn_condition("oot", 0, 3);
		if ($c > 0)
			{
			quest::shout("StormBreaker is in the Ocean of Tears.");
			}
		}
	}

sub EVENT_POPUPRESPONSE{
    #::: plugin::DiaWind response subroutine
    plugin::DiaWind_Process_Response();
}

sub EVENT_ENTERZONE 
	{
	quest::debug("$name entered zone");
	$peebucket{$charid} = $charid . "-peepers-pee";
	if (quest::get_data($peebucket{$charid}))
		{
		# This character stinks. Set a timer to emit stink
		quest::settimer($peebucket{$charid}, 60);
		if ($zoneid == 100)
			{
			quest::faction(5007, 500, 1);
			}
		quest::debug("Timer $peebucket{$charid} started");
		}

	if ($name eq "Prexus")
		{
		quest::playersize(15);
		}

	#::: Dismount on indoor zone
	$ex = plugin::LoadMysql()->prepare("SELECT `castoutdoor` from `zone` WHERE `zoneidnumber` = ? AND `castoutdoor` = 0");
	$ex->execute($zoneid);
	while (@row = $ex->fetchrow_array()) 
		{
		quest::debug("We have zoned into a indoor zone, dismounting...");
		$client->BuffFadeByEffect(113);
		}

	# Check for new titles
	my %h = (71 => 100, 72 => 200, 73 => 250, 74 => 300);
    foreach my $key (keys %h) {
        if (!quest::checktitle($key) && CheckSkills($client, $h{$key}, 7)) {
            quest::enabletitle($key);
			$client->NotifyNewTitlesAvailable();
        }
    }	

	# Zone music

	if ($zoneid == 3)
		{
		plugin::playmp3once("otr.mp3");
		}
	elsif ($zoneid == 19)
		{
		plugin::playmp3once("rivervale.mp3");
		}
	elsif ($zoneid == 36)
		{
		plugin::playmp3once("befallen.mp3");
		}
	else	
		{ 
		$client->PlayMP3("");
		}

	my $deity = $client->GetDeity();
	my $gm="Cazic Thule";

	quest::debug("$class is $name class");
	if ($class eq "Cleric")
		{
		$gm="Miadera";
		}
	elsif ($class eq "Shadowknight")
		{
		$gm="Shevra";
		}
	elsif ($class eq "Necromancer")
		{
		$gm="Antus";
		}	

	if ($race eq "Erudite" && $deity == 203 && !quest::istaskcompleted(105))
		{
		$client->Message(13, "$name! It is unfathomable that you have allowed what has transpired.  I can only guess that you actually desire death by dismemberment.  Our new guard dogs have been slain, and I hear nothing from your lips.  Come, see me, and we shall discuss your punishment for your [betrayal] - $gm.");
		}
	quest::debug("$name zone in complete");
	}

sub CheckSkills {
    my $client = shift;
    my $skill_level = shift;
	my $num_required = shift;
	my $total=0;
    foreach my $skill (55..61, 63..65, 68, 69) {
        if ($client->GetRawSkill($skill) >= $skill_level) {
            $total = $total + 1;
        }
    }
    return ($total >= $num_required);
}

sub EVENT_COMBINE_SUCCESS
{
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonitem($reward{$type}{$recipe_id});
        quest::summonitem(67704);
        $client->Message(1,"Success");
    }
}

sub EVENT_CAST {
	if ($spell_id == 25686)
		{
		my $pets=$client->GetPetID();
		my $knight = $entity_list->GetMobByID($pets);
		$knight->ChangeSize(3);
		}
}

sub EVENT_TIMER
	{
	$mytimer = $charid . "-peepers-pee";

	quest::debug("Global timer $timer running");
	if ($mytimer eq $timer)
		{
		#quest::debug("Timer $timer executing");

		my @pc_list = $entity_list->GetClientList();

		foreach $pc_ent (@pc_list) 
			{
			$checkhim = $pc_ent->GetName();
			if ($checkhim ne $name && $pc_ent->CalculateDistance($client->GetX(), 
				$client->GetY(), $client->GetZ()) < 100) 
				{
				$random = int(rand(3));

				if ($random == 0)
					{
					$pc_ent->Message(0, "$name smells like cat pee.");
					}
				elsif ($random == 1)
					{
					$pc_ent->Message(0, "Has $name been inside a litter box?");
					}
				elsif ($random == 2)
					{
					$pc_ent->Message(0, "$name reeks.");
					}
				}
			}
		}
	}
