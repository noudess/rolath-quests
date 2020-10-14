sub EVENT_WAYPOINT_ARRIVE 
	{
		if ($wp eq 3) 
		{
			quest::SetRunning(1);
		}
		if ($wp eq 6) 
		{
			quest::SetRunning(0);
		}
	}

sub EVENT_SAY 
	{
		if($text=~/Hail/i)
		{
			quest::say("Brrrr.. It.. Is sooo.. c-cold!! I never.. sh-should've j-joined.. the.. the W-wolves of the N-north!!");
		}
		if ($faction > 5) #Verified
			{
			quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
			}
		elsif ($faction > 4)
			{
			quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.");
			}
		elsif ($text=~/Ivan's remains/i) 
		{
			quest::say("You were sent to retrieve the remains? I am sorry, I lost them. It was not my fault! There was no escort as I was told. I got lost returning to Halas and ended up on a frozen river. The ice broke and the remains were scattered into the freezing water. Will you [dive for the remains]?");
		}
		elsif ($text=~/dive for the remains/i) 
		{
			quest::say("Thank the Tribunal!! I would have, but I cannot swim. Take this chest. Fill it with the four pieces which fell below the surface. I know not what else lies within. When you fill the box and combine the items, return it to Renth. Good luck, $name.");
			quest::summonitem(17945);
		}
	}

sub EVENT_ITEM 
	{
		# 13244 :  One Quarter Bottle of Elixir
		if (plugin::check_handin(\%itemcount, 13244 => 1)) 
		{
			quest::say("Oh thank you. Sorry, but the bottle is empty now. I hope you did't need any. Take the empty bottle back to Dargon. He may refill it for you.");
			# Verified
			quest::ding();
			quest::exp(125);
			quest::faction(328,1); # 213 : Faction Merchant's of Halas
			quest::faction(327,1); # 294 : Faction Shaman of Justice
			quest::faction(311,1); # 311 : Faction Steel Warriors
			quest::faction(320,5); # 361 : Faction Wolves of the North
			quest::summonitem(13245); # 13245 :  Empty Bottle of Elixir
		}
		else 
		{
			plugin::return_items(\%itemcount);
		}
	}

#END of FILE Zone:everfrost  ID:30029, 30096, 30119 -- Megan_OReilly
