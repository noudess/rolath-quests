sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Well met $name.  My name is Noudess, great scout of the North.  I am somewhat retired now, but I have develeoped a keen interest in gear with special abilities.  Specifically, abilities that disappear after a few [uses].");
		}
	elsif ($text=~/uses/i)
		{
		quest::say("Yes, say like that cap the halflings use to gate to the commonlands.  I have always wondered how that works and how the magic could be restored.  If you are also interested, you can give me an item you are curious about and I could look into it.");
		}
	}

sub EVENT_ITEM 
	{
	if (($platinum>=7) && plugin::check_handin(\%itemcount, 16875 => 1))
		{
		quest::say("Here is your recharged probe!  Thank you for the business");
		quest::summonitem(16875);
		}
	elsif ($itemcount{16875} => 1)
		{
		quest::say("Ah yes.  I will recharge that for 7 platinum coins");
		plugin::return_items(\%itemcount);
		}
	else
		{
		quest::say("Very well, I will look into that!  I will let you know as soon as I learn anything $name.  In the meantime, hang onto that!");
		quest::write("RechargeRequests", "$name wants $item1");
		plugin::return_items(\%itemcount);
		}
	}
