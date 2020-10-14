sub EVENT_SAY
    {
    if($text=~/hail/i)
        {
        quest::say("Me Uglan. Mighty ogre. Member of Crakneks. We crush for dark elves. Do you [like dark elves] or they be [mean] to you?");
        }
    elsif($text=~/like dark elves/i)
        {
        quest::say("Me love friends dark elves.");
        }
    elsif($text=~/mean/i)
        {
        quest::say("You smart person. Me know dark elves not friendly. They just use ogres. Me not like Neriak anymore.");
        }
    }


sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13357 => 1)) 
		{
		quest::say("You from Oggok. Me waiting for you. Me know dark elves have dark plan for ogres. We must stop plan. You must go to Nektulos Forest. Wait for blue orc. He deliver message for dark elf king. Not good. You kill blue orc runners. If message on them then you take to Lork in Oggok. Ogres must know plan.");
		#Faction verified on ZAM
		quest::faction(239,5); #The Dead
		quest::faction(303,1);	#Queen Cristanos Thex
		quest::faction(278,-1);	#King Navthox Thex
		quest::faction(275,-1);	#Keepers of the Art
		quest::faction(245,-1);	#Eldrich Collective
		quest::faction(1522,-10);	#Primordal Malice
		quest::exp(500);
		quest::ding();
		}
	else {
	quest::say("Me not want this.");
	plugin::return_items(\%itemcount);
	}
	}
