sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("What? What do you want? Are you here to assist me?");
		}

	if($text=~/assist/i)
		{
		if ($faction < 7)
			{
			quest::say("Yes..yes..of course you will. It is a matter of the utmost importance. I need this letter to be delivered to Master Whoopal in the Nektulos forest but I must also get these Brussels sprouts to my granny before they spoil. Please deliver this message for me?");
			quest::summonitem(18957);#Leatherfoot Raider Orders
			}
		else
			{
			plugin::reject_say();
			}
		}
	}

sub EVENT_ITEM
	{
	quest::say("I don't need this.");#text made up
	plugin::return_items(\%itemcount);
	}
