sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount,  19661 => 1, 19612 => 1 )) 
		{
		quest::emote("fashions a grip out of the thorn drakeling scales then tests and polishes the blade of the machete.");
		quest::say("Yer another one of Megosh's trainees I suppose. This here's a fine weapon for a Ranger of the Storm Reapers.  We shall make good use of it.  Take this magical shard, it will help you in your battles as you work to protect the Vale");     
		# Factions verified on live
		quest::faction(292,5);
		quest::faction(241,1);
		quest::faction(263,1);
		quest::faction(286,1);
		quest::faction(336,-1);
		quest::ding();
		quest::summonitem(1266); 
		}

	if(plugin::check_handin(\%itemcount, 19663 => 1, 19616 => 1))
		{
		quest::emote("fashions a grip out of the large fruit bat wing then tests and polishes the blade of the scimitar.");
		quest::say("Yer another one of Hibb's trainees I suppose. This here's a fine weapon for a Druid of the Storm Reapers.  We shall make good use of it.  Take this magical shard, it will help you in your battles to protect the Vale");
		# faction verified on live
		quest::faction(292,5);
		quest::faction(241,1);
		quest::faction(263,1);
		quest::faction(286,1); 
		quest::faction(336,-1); 
		quest::ding();
		quest::summonitem(1264);
		}

	if (plugin::check_handin(\%itemcount,  19662 => 1, 13060 => 1 )) 
		{
		quest::emote("fashions a grip out of the large snake skin then tests and polishes the blade of the sword.");
		quest::say("Yer another one of Kaya's trainees I suppose. This here's a fine weapon for a Druid of the Storm Reapers.  We shall make good use of it.  Take this magical shard, it will help you in your battles to protect the Vale");
		# Factiobs verified on live.
		quest::faction(292,5);
		quest::faction(241,1);
		quest::faction(263,1);
		quest::faction(286,1);
		quest::faction(336,-1);
		quest::ding();
		quest::summonitem(1266); 
		}
	plugin::return_items(\%itemcount);
	}


