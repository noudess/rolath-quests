sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Excuse me! I came here in hopes of being alone!");
		}
	elsif ($faction > 5)
		{
		quest::say("You are quite bold to approach a member of the Ebon Mask. Now be smart and run away.");
		}
	elsif ($faction > 4)
		{
		quest::say("You have done nothing to upset the Ebon Mask, but there is much more which you must do before we do business.  Perhaps a task from Master Hekzin shall set things right.");
		}
	elsif ($text=~/sent by Tani/i) 
		{
		quest::say("You're a new rogue, then! Your mission is to kill the young daughter of the owner of the Seafarer's Roost. Wait for the right time. Why? You don't need to know. Do it and return Lyda's head to Tani in Neriak. I hope you can make it back to Neriak alive. Good hunting!");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount, 18844 => 1))
		{
		quest::say("'I am glad to see you. We have a problem. The last runner and I attempted to carry the chest from a boat. It fell overboard! He went in after it, but the sharks made a meal of him. If you want to try and get it, it is down below in the water in the harbor. Be careful.");
		}
	}
