sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Well met, friend.  May I be of assistance?");
		}
	}


sub EVENT_COMBAT
	{
	my $cur_target = $npc->GetHateTop();
	if($cur_target) 
		{
        my $target_name = $cur_target->GetCleanName();

		if ($combat_state == 1)
			{
			quest::say("Time to die, $target_name!");
			}
        }
	}
#END of FILE Zone:grimling  ID:167115 -- Royal_Khala_Dun 

