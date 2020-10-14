sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("What!!? You [Craknek] or you [pest]?");
		}
	elsif ($text=~/craknek/i) 
		{
		quest::say("Good. Me not bash you. You help Horgus and Crakneks. Go smash lizards. Bring four tails. Greenbloods think they get all lizard tails. We take first. Taste good. You bring four tails. Me give you tings. Me gives armur. Now go!!");
		}
	elsif ($text=~/pest/i) 
		{
		quest::say("Bah!! You go join Greenbloods. You weak.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13354 => 4)) 
		{
		quest::say("You smash lizards good. Here is armur me promise. if yuz want sumtin else give back");
		quest::summonitem(quest::ChooseRandom(2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2172,2171));
		quest::exp(1000);
		quest::faction(228, 1);
		quest::faction(232, 10);
		quest::faction(261, -1);
		quest::ding();
		}

	#Added to allow newbie exchanges...  - DROOL

	elsif ($itemcount{2161} >= 1 || $itemcount{2162} >= 1 || $itemcount{2163} >= 1 || $itemcount{2164} >= 1 || $itemcount{2165} >= 1 || $itemcount{2166} >= 1 || $itemcount{2167} >= 1 || $itemcount{2168} >= 1 || $itemcount{2169} >= 1 || $itemcount{2170} >= 1 || $itemcount{2171}>=1  || $itemcount{2172}>= 1)
		{
		plugin::check_handin(\%itemcount,2161=>1);
		plugin::check_handin(\%itemcount,2162=>1);
		plugin::check_handin(\%itemcount,2163=>1);
		plugin::check_handin(\%itemcount,2164=>1);
		plugin::check_handin(\%itemcount,2165=>1);
		plugin::check_handin(\%itemcount,2166=>1);
		plugin::check_handin(\%itemcount,2167=>1);
		plugin::check_handin(\%itemcount,2168=>1);
		plugin::check_handin(\%itemcount,2169=>1);
		plugin::check_handin(\%itemcount,2170=>1);
		plugin::check_handin(\%itemcount,2171=>1);
		plugin::check_handin(\%itemcount,2172=>1);
		quest::say("Aha!  Have that already?  Try this piece on for size.  ROWR!");
		quest::summonitem(quest::ChooseRandom(2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2172,2171));
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:oggok  ID:49042 -- Horgus
