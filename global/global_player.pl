sub EVENT_POPUPRESPONSE{
    #::: plugin::DiaWind response subroutine
    plugin::DiaWind_Process_Response();
}

sub EVENT_ENTERZONE 
	{
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

	# Note about postal gear for sale
	if (quest::istaskactive(66))
		{
		if (!plugin::check_hasitem($client, 1394))
			{
			$client->Message(2, "Before you get your bearings, a stranger pushes a note into your hand and then disappears.");
			quest::summonitem(1394);
			}
		}

	# Zone music
	if ($zoneid == 3)
		{
		$client->PlayMP3("otr.mp3");
		}
	elsif ($zoneid == 19)
		{
		$client->PlayMP3("rivervale.mp3");
		}
	elsif ($zoneid == 36)
		{
		my $key = $client->CharacterID() . "-reaper";
		my $played = quest::get_data($key);
		if ($played == 0)
			{
			$client->PlayMP3("befallen.mp3");
			quest::set_data($key, 1, 600);
			}
		}
	else	
		{ 
		$client->PlayMP3("");
		}

	my $deity = $client->GetDeity();
	my $gm="Cazic Thule";

	if ($class eq "Cleric")
		{
		$gm="Miadera";
		}
	elsif ($class eq "Shadow Knight")
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
