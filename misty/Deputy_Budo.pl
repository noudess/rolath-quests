sub EVENT_COMBAT 
{
	if($combat_state == 1)
	{
	my $cur_target = $npc->GetHateTop();
		if($cur_target) 
		{
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_SAY
{
 if ($text=~/hail/i)
	{
	quest::say("Hail, $name. Are you reporting for [duty]? I am Deputy Budo Bullnose, the squad leader of the Great Wall Patrol. Be very careful in the lands beyond the wall. They are filled with dangerous beasts, as well as [Clan Runnyeye].");
	}
 if ($text=~/clan Runnyeye/i)
	{
	quest::say("Beyond this wall lies Runnyeye, the lair of the goblins of Clan Runnyeye. They have been a nuisance to Rivervale for quite some time. If you wish to join the fight, go to Rivervale and ask Sheriff Roglio about Clan Runnyeye.");
	}

 if ($text=~/duty/i)
	{
	quest::say("Stand tall then, Deputy $name. Your orders are to keep the creatures from venturing into the community of Rivervale and to kill many goblins. Check the goblin bodies, if you should find unbroken warrior beads on them, take them to Sheriff Roglio Bruth and should you be lucky enough to find a bizarre grappling device, you are to take it to Marshal Ghobber Truppack immediately! One more thing - should you defeat any orcs in battle, bring me their leather belts and I shall reward you for the great victory. May the power of Underfoot be with you!");
	}
 }

sub EVENT_ITEM 
{ 
 if($itemcount{13916} > 0)
	{
	quest::say("Grand work. Deputy $name! You will become a full-fledged deputy in no time. You should check in with Marshal Ghobber from time to time to see if you have earned your squad ring. Just go up to him and ask. 'Am I one with the Wall?' He will know. but you must first show your bravery in many battles against the goblins.");
	plugin::mass_handin(13916, 1, \&BeltReward);
	}

plugin::return_items(\%itemcount);
}

sub BeltReward
	{
	#faction and experience verified on Live

	quest::givecash("0","5","0","0");
	quest::summonitem(13024);
	quest::faction(263, 5); #Guardians of the Vale
	quest::faction(286, 1); #Mayor Gubbin
	quest::faction(355, 1); #Storm Reapers
	quest::faction(292, 1); #Merchants of Rivervale
	quest::faction(334, -1); #Dreadguard Outer
	quest::exp(104);
	quest::ding();
	}
#END of FILE Zone:misty  ID:33081 -- Deputy_Budo 
