sub EVENT_SAY 
	{
	if ($faction < 5)
		{
		if($text=~/megan/i)
			{
			quest::say("I heard she got lost on the plains. You should go ask her dog, Snowflake, where she is. I hear she is somewhere around the pass to Halas.");
			}
		else
			{
			quest::say("My word!! I cannot believe how cold it is out here. I must keep running around just to keep warm.");
			}
		}
	elsif($faction == 5)
		{
		quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		}
	else
		{
		quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		}
	}

sub EVENT_ITEM {
	# 13243 :  One Half Bottle of Elixir
	if (plugin::check_handin(\%itemcount, 13243 => 1)) {
                quest::ding();
		quest::say("Mmmm.. Thank you stranger. I feel a lot warmer now. You should now go and find [Megan] O'Reilly.");
		quest::exp(125);
		# Verified ZAM
		quest::ding();
		quest::faction(328,1); # 213 : Faction Merchant's of Halas
		quest::faction(327,1); # 294 : Faction Shaman of Justice
		quest::faction(311,1); # 311 : Faction Steel Warriors
		quest::faction(320,5); # 361 : Faction Wolves of the North
		quest::summonitem(13244); # 13244 :  One Quarter of Elixir
	}
}

sub EVENT_SPAWN {
	quest::SetRunning(1);
}



#END of FILE Zone:everfrost  ID:30049 -- Arnis_McLish

