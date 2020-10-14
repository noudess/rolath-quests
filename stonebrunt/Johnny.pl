sub EVENT_SAY
	{
	if($text =~ /hail/i)
		{
		$varname="SBBANK$charid";
		if (defined($qglobals{$varname}))
			{
			quest::say("Oh, hi again $name, let me call Jade for you.");
			quest::depop(110230);
			quest::spawn2(110230, 0, 0, -447, 1391, 1028, 306);
			}
		else
			{
			quest::say("Can't you see I am busy?  What do you think I am, a [banker]?");
			}
		}
	if($text =~ /banker/i) 
		{
		quest::say("Yes, banker!  You know, Jade.  She's works my fingers to the bone.  She didn't even give me a decent [chair].");
		quest::emote("frowns");
		}
	if($text =~ /chair/i) 
		{
		quest::say("Yea, she had mine made out of bloody rabbit fur.  It is barbaric.  I wish I had a better chair.  I could make one myself with better components.  I tell you what, you get me a pristine gorilla canine, pristine gorilla pelt and 2 pristine gorilla paws and I'll make one!");
		quest::say("You get me that stuff, and I'll make sure Jade treats you right.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 32755 => 1, 32754 => 2, 32753 => 1))
		{
		quest::say("Faboulous!  Heidi will be so envious!");
		plugin::Autovtell("laugh");
		$varname="SBBANK$charid";
		quest::setglobal($varname,1,5,"F");
		quest::shout("Jade!  Jade!  We have a customer!");
		plugin::Autovtell("help");
		quest::depop(110230);
		quest::spawn2(110230, 0, 0, -447, 1391, 1028, 306);
		}
	}
