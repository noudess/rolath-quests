sub EVENT_DEATH_COMPLETE { 
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(35069,15,0,$x + 20,$y,$z,$h);
    quest::spawn2(35069,15,0,$x - 20,$y,$z,$h);
    quest::spawn2(35069,15,0,$x,$y + 20,$z,$h);
    quest::spawn2(35069,15,0,$x,$y - 20,$z,$h);
}
