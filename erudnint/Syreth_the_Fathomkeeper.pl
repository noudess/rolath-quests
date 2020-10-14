sub EVENT_ITEM 
	{
	#This was a one-time special quest completed on 7/9/14.  
	#The 4 quest drops have been removed from the loot drop tables.
	if(plugin::check_handin(\%itemcount, 3 => 1, 4 => 1, 5 => 1, 6 => 1)) 
		{
		quest::say("$name!  You are a hero!  The High Council will hear your name this day!");
		quest::emote("reaches into a robe pocket, removing a sparking charm");
		quest::summonitem(1); 
		quest::doanim(36);
		quest::say("I hereby don thee, High Scholar $name.");
		quest::shout2("Fellow scholars, today is a bright day in our history.  $name has recovered the lost shards of knowledge!");
		quest::shout2("With this ancient knowledge, we will defeat our heretic enemies and restore Odus to a place of peace and tranquil contemplation.  All hail High Scholar $name!");
		quest::enabletitle(4);
		}
	else 
		{
		quest::say("I have no need for this, $name.");
		plugin::return_items(\%itemcount);
		}
	}
