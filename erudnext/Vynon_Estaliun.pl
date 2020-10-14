sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("I welcome you to the temple of the Peacekeepers. The ways of peace and tranquility are ours to uphold. May you find a place among us. We have much work to do. If you are a paladin of this temple. you must [desire to face fear].");
		}

	if($text=~/i desire to face fear/i)
		{
		if ($faction <= 4)
			{
			quest::say("Very well. You shall face it. In Toxxulia Forest. you shall seek out Kerra Ridge. Once found. you will bring me the tail of a catfisher. Somehow. you shall find a way. They are weak. but they only work near the opposite side of the bridge. along the water's edge."); 
			}
		else 
			{
			quest::say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($faction <= 4)
		{
		if (plugin::check_handin(\%itemcount, 13884 => 1)) 
			{
			quest::say("Good work. I knew you could do it. Take this as reward.");
			quest::summonitem(quest::ChooseRandom(13053,13002));
			# Faction verified on live.
			quest::faction(298, 5);
			quest::faction(266, 1);
			quest::faction(265, -1);
			quest::exp(100);
			quest::ding();
			}
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:erudnext  ID:98043 -- Vynon_Estaliun 
