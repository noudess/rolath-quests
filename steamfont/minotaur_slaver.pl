#NPC: minotaur_slaver   Zone: steamfont

sub EVENT_DEATH_COMPLETE
	{
	my $random_result = int(rand(100));
	if($random_result >= 94)
		{
		quest::unique_spawn(56161,0,0,-2179,1319,-101.2);
		}
	quest::say("I die soon! Meldrath, help me!");
	}
