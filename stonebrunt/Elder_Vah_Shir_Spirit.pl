sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Where am I?  Who are you? Are my [people] safe?");
		}
	if ($text =~ /I am/i)
		{
		quest::say("I am please to meet you, $name.");
		quest::emote("still looks bewildered");
		}
	if ($text =~ /people/i)
		{
		quest::say("The Vah Shir are my people.");
		quest::emote("looks at himself");
		quest::say("Where is my body?  I have no form other than this??");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 2576) ||
		plugin::check_handin(\%itemcount, 2577)) # shattered <type> soul orb
		{
		# Count how many souls freed..
		$varname="Shattered$charid";
		if (!defined($qglobals{$varname}))
			{
			$spiritcount=1;
			}
		else
			{
			$spiritcount=$qglobals{$varname} + 1;
			}
		quest::setglobal($varname,$spiritcount,1,"F");

		if ($spiritcount == 1)
			{
			quest::say("What is this?!");
			quest::emote("steps back a step in shock");
			quest::say("This is the essense of a lost soul!  And the aura is strong.  I sense this person was a leader of the Erudite people. Where did this come from?");
			quest::emote("is silent for a time");
			quest::settimer("pausethink", 10);
			}
		else
			{
			quest::say("So, $name, you have returned with another spirit essesnce!  You have done the right thing.  I will assure that they find peace, regardless of their deeds in life.");
			}
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_TIMER
	{
	$varname="Shattered$charid";
	quest::stoptimer("pausethink");
	quest::say("$name.  The history imprinted on this orb is strong.  I can see some of what has transpired and it does not please me.  I thank you for bringing me this orb.  The foolishness of the Erudite people caused a horrible cataclysm.  If I am seeing this correctly, this soul, along with thousands of Erudites, and nearly all of my people were slain.");
	quest::say("Are the Erudite people still engaged in this stupidity?  I should hope not.  Again, I am grateful for your efforts in bringing the spirit's essence to me.  I hereby dub thee $name Soul Liberator.  If you encounter more such trapped spirits, I would welcome them.");
	quest::enabletitle(30);
	}
