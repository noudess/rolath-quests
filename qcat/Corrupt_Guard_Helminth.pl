#Qeynos Badge of Honor (Badge #4)
#Author: Drool & Neysa

sub EVENT_SIGNAL
{
	my $c = $entity_list->GetClientByCharID($signal);
	quest::attack($c->GetName());
}

sub EVENT_DEATH_COMPLETE
{
	quest::spawn2(45204,0,0,-262,440,-38.22,131);
	quest::spawn2(45104,0,0,-130,452,-38.22,361);
	quest::spawn2(45104,0,0,-130,428,-38.22,409);
}
