#southkarana  Jerlan Meadowgreen

sub EVENT_WAYPOINT_ARRIVE 
	{
    if($wp == 1) 
		{
		quest::say("Mmmm can you smell that brothers, my latest batch of bread is just about done.");
		}
    if($wp == 4) 
		{
		quest::say("Perfect tiiming as always, no burning bread for me. Ohh ow ow ow, that's hot!");
		}
	}

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hello $name, don't you just love the smell of baking bread?");
		quest::emote("breathes in deeply with a happy smile.");
		}
	if ($text=~/bread loaves/i) 
		{
		quest::say("So, ya want some of my bread is that it? Well, you've come to the right place I'd say. My brothers told me the market was ripe for that sort of thing so I decided to move on over here. Anyway, hand over two gold pieces and I'll give ya a sack of bread made by me own two hands");
		}
	}

sub EVENT_ITEM
    {
    if ($gold >= 2)
        {
        quest::say("Here is your fresh bread loaves, enjoy.");
        quest::summonitem(1838);
        }
    }

