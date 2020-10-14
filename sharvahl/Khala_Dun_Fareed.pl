sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the royal court of King Raja Kerrath. King of Shar Vahl City. Descendant of the Great Vah Kerrath. Leader of all Vah Shir!  Please be respectful when you enter the royal throne room.");
		}
	}

sub EVENT_ITEM
	{
	if(plugin::check_handin(\%itemcount, 3647 => 1))
		{
		quest::say("Ah, you've arrived, good. Ayyad tells me you're a very quick learner and a skilled sculptor. The king has taken a fondness for a new game that has been very popular with the people of late. This game, called Brehad, requires the use of a set of 10 Runed Vah Shir figurines in order to play. The king's set was recently broken by a rather intrusive rhinobeetle. The king would be very pleased if you would create another set for him. Take this Padded Brehad Case and place 10 figurines in it. Return the completed set to me and I'm sure that the king will reward you nicely");
		quest::summonitem(17106);
		quest::exp(1000);
quest::ding();
		}
	if(plugin::check_handin(\%itemcount, 3644 => 1))
		{
		quest::say("Well done $name, this is a fine, fine set of Brehad figures. I'm sure the king will be very pleased. Here, take this note to Ayyad; he has instructions on how you should be rewarded");
		quest::summonitem(3643);
		quest::exp(3000);
quest::ding();
		}
	}

#END of FILE Zone:sharvahl  ID:155280 -- Khala_Dun_Fareed 

