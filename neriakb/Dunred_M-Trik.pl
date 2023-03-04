sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("You better be bothering me to buy something $name.  Or maybe you are a [baker] and can be of some use?  If not you can at least make a [trip] for me."); 
		}
	if ($text=~/baker/i) 
		{
		quest::say("So you can bake, can you. Take this crate and fill it with muffins, seal it up and bring it back to me. Don't go trying to pass off that store bought stuff, I need fresh baked muffins. Bring me store bought muffins and I'll feed you to the shrieking eels!.");
		quest::summonitem(17881);
		}
	if ($text=~/trip/i) 
		{
		quest::say("Make yourself useful and go find that Meadowgreen in the southern plains. He's makes some quality bread and I can't be bothered to waste my time making bread all the time. Tell him you want a bag of bread loaves and be quick about it.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Well these aren't too bad, here take these coins and stop bothering me.");
		quest::faction(236,2);	#Dark Bargainers
		quest::faction(370,1);	#Dreadguard Inner
		quest::faction(334,1);	#Dreadguard Outer
		quest::givecash(0,4,2,0);
        $client->AddLevelBasedExp(4, 14);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Well it's about time, took you long enough.");
		quest::emote("tosses some coins to $name as he restocks his shelves with the fresh bread.");
		quest::faction(236,4);	#Dark Bargainers
		quest::faction(370,1);	#Dreadguard Inner
		quest::faction(334,1);	#Dreadguard Outer
		quest::givecash(0,0,7,1);
        $client->AddLevelBasedExp(4, 14);
		quest::ding();
		}
	}
