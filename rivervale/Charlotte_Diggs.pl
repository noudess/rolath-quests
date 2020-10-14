sub EVENT_SPAWN {
	my $random = int(rand(720)); 
	if ($random < 30)
		{
		$random+=30;
		}
	quest::settimer("pick",$random)
}
sub EVENT_TIMER {
	quest::emote("picks up something from the ground.");
}
