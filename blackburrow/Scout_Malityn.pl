sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("In the name of the Rainkeeper, I strike at thee!!");
	}
}

sub EVENT_ITEM
	{
	if(plugin::check_handin(\%itemcount, 27498 => 1)) # Bag of Rations
		{
		quest::say("It's about time!  Take this report back to Filian, and SHHHH.  I do not wish to be discovered!");
		quest::summonitem(27420);
		quest::ding();
		quest::exp(500);
		}
	}

sub EVENT_DEATH {
	quest::say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
}
