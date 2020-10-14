sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hi $name. Times are tough these days. I am finding myself running short on baked goods lately. Would you be [willing to help] me out?"); 
		}
	if ($text=~/willing to help/i) 
		{
		quest::say("You'd help me? Oh, you are such a dear! Well, there are two ways you can help me and my little business. If you [can bake] you can make me some muffins so I don't run out. Otherwise, you [can travel] a little way for me and pick up some bread.");
		}
	if ($text=~/can bake/i) 
		{
		quest::say("You can bake, that's wonderful. Take this crate and fill it with muffins, then seal it up and bring it back to me. Don't go trying to pass off that store bought stuff, I need fresh baked muffins. The ones in the stores are already too old and will get moldy too fast, so I don't want those.");
		quest::summonitem(17881);
		}
	if ($text=~/can travel/i) 
		{
		quest::say("There is a wonderful baker that lives in the southern plains. I guess the plague hasn't hit that area too bad. Anyway, he's one heck of a baker and makes some quality bread. Go look him up and tell him you want a bag of bread loaves. He's one of those fellas that goes by the name of Meadowgreen.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 1839 => 1))
		{
		quest::say("Thanks, you are a dear. You are one top notch baker!  Here's some coin for your trouble.");
		quest::faction(289,1);	#Merchants of Erudin
		quest::faction(266,1);	#High Guard of Erudin
		quest::faction(267,1);	#High Council of Erudin
		quest::givecash(0,4,2,0);
		quest::exp(100);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 1838 => 1))
		{
		quest::say("Oh, wonderful fresh bread! Thank you for making the trip, that is such a long way. Here, I hope this covers your travel expenses. You have my deepest thanks.");
		quest::faction(289,1);	#Merchants of Erudin
		quest::faction(266,1);	#High Guard of Erudin
		quest::faction(267,1);	#High Council of Erudin
		quest::givecash(0,0,7,1);
		quest::exp(100);
		quest::ding();
		}
	}
