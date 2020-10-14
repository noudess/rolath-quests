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
			quest::say("Mrrooww I am very busy?  All this work for the [banker]?");
			}
		}
	if($text =~ /banker/i) 
		{
		quest::say("Yes, banker!  You know, Jade.  She's always off here and there and yet she claimed the best [chair].");
		quest::emote("sighs");
		}
	if($text =~ /chair/i) 
		{
		quest::say("She commissioned 3 chairs, and then claimed the only one made with the wonderfully soft gorilla fur.  She had mine made out of pieces of rabbit fur.  All those little pieces sewn together doesnt make a very comfortable seat!  I could make a much better one, but I'm much too busy to go collect the items I need. You look like you have some time on your hands, why don't you go get me a pristine gorilla pelt and 2 pristine gorilla paws... oh and a pristine gorilla canine too and I'll make my own!");
		quest::say("You get me my new chair parts, and I'll make sure Jade treats you right.");
		quest::emote("smiles happily");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 32755 => 1, 32754 => 2, 32753 => 1))
		{
		quest::say("Ohhh how faboulous!  Johnny will be so envious!");
		plugin::Autovtell("laugh");
		$varname="SBBANK$charid";
        quest::setglobal($varname,1,5,"F");
		quest::shout("Jade!  Jade!  We have a customer!");
		plugin::Autovtell("help");
		quest::depop(110230);
		quest::spawn2(110230, 0, 0, -447, 1391, 1028, 306);
		}
	}
