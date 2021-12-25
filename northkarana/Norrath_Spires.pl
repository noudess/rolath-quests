sub EVENT_SPAWN
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
	}

sub EVENT_ENTER
	{
	#when we enter the spires, set global true.
	quest::setglobal("spire_nk", 1, 1, "F");
	$spire_nk = undef;
	}

sub EVENT_EXIT
	{
    #when we leave spires, set global false.
	quest::delglobal("spire_nk");
	$spire_nk = undef;
	}

sub EVENT_SIGNAL
	{
	if ($signal == 101)
		{
		$npc->CastSpell(2935, 13022);    #flavor
		}
	}
