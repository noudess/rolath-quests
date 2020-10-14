sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{
		quest::say("Hi there $name . Think you could help me out a bit? I was hired to get rid of all these pesky rodents running around town but there seems to be no end to them! They are ruining the jumjum field and worse yet, if I dont get rid of them all, my boss wont give me the muffins he promised me! Think you could hunt some of the rodents down and bring me back four rat whiskers? I would pay you of course!");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13071 => 4))
		{
		quest::say('Nice work! Take these coins. Oh no, there are still more rodents! I better get to work. Farewell, friend!');
		#Factions verified on live
		quest::faction(263,1); 
		quest::faction(286,1); 
		quest::faction(355,1);
		quest::faction(292,1);
		quest::faction(334,-1);
		quest::exp(145);
		quest::ding();
		quest::givecash(1,1,1,0);
		}
	plugin::return_items(\%itemcount);
	}

