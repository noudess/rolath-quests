sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13954 => 1)) 
		{
		quest::say("Thank you!! I felt the madness nearing my brain, but now I feel much better. Please take this as thanks - it is all I have to donate to Astaed Wemor. Be sure he gets it. I shall thank Rodcet Nife every day for sending help.");
		# Verified on Live
		quest::summonitem(13970);
		quest::faction(341,1 );
		quest::faction(280, 1);
		quest::faction(262, 1);
		quest::faction(221, -1);
		quest::faction(219, 1);
		quest::exp(1000);
		quest::ding();
		}
	}
