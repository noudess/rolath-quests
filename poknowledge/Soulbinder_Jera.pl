#generic soulbinder quest
sub EVENT_SAY { 
	plugin::soulbinder_say($text);
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}
