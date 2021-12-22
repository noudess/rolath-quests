my $whospawned;

sub EVENT_SPAWN
	{
	my $sg = $npc->GetSp2();
	
	# See if we are the triggering mob for Salani/Kindl
	if ($sg == 27102)
		{
		$whospawned = $npc->GetID();
		# Set spawn condition to spawn Salani/Kindl if we don't get Faelin
		if ($whospawned == 54237)
			{
			quest::spawn_condition("gfaydark", 1, 0);
			}
		else
			{
			quest::spawn_condition("gfaydark", 1, 1);
			}
		}
	}

sub EVENT_ITEM
	{
	my $whospawned = $npc->GetID();

	if ($whospawned == 54237)
		{
		if (plugin::check_handin(\%itemcount, 20472 => 1))
			{
			quest::emote("reads the note carefully and growls to herself. 'Bad news, eh? Take this ring. There is one elf, dark elf even, whom we must go to in order to gather insight into Innoruuk's plans. Giz X'Tin, he goes by most commonly. Kithicor seems to be his favorite haunt and most likely you will find him there. Don't ask how I know him. Just take the ring as my sign to him and he will speak to you. We don't need to speak again, so don't seek me out. Just go to Telin. I must leave to investigate these events.'");
			quest::summonitem(20446);
			}
		else
			{
			quest::emote("does not accept the item.");
			plugin::return_items(\%itemcount);
			}
		}
	}

# EOF zone: gfaydark ID: 54237 NPC: Faelin_Bloodbriar

