# This is to spawn a lesser spirit upon Blinde's death for Shaman epic 1.0

sub EVENT_DEATH 
	{
	quest::say("My comrades will avenge my death.");
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	my $z = $npc->GetZ();
	my $h = $npc->GetHeading();
	quest::spawn2(50306,0,0,$x,$y,$z,$h);
	}

sub EVENT_AGGRO 
	{
	quest::say("Time to die, $name!");
	}
