sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name.  What brings you to this neck of the woods?  You must have heard of my expert tanning skills.  I craft some of the finest skin garments this side of Highpass Hold.");
  }
  if ($text=~/garments/i) {
    quest::say("Well, more like [gloves] actually, they are my specialty.");
  }
  if ($text=~/gloves/i) {
    quest::say("Gloves are my specialty.  I make four varieties;  ratskin, wolfskin, bearskin, and my most sought after type, lionskin.");
  }
  if ($faction > 4) {
    quest::say("The people of Kithicor do not yet trust you enough to warrant the use of my skills to make you clothing.");
  }
  elsif ($text=~/bear/i) {
    quest::say("If you would like gloves from bear skin I require a high quality bear skin and 25 gold pieces.");
  }
  elsif ($text=~/rat/i) {
    quest::say("I will need 6 gold, and a giant rat pelt.");
  }
  elsif ($text=~/wolf/i) {
    quest::say("I will require 13 gold pieces and a hugh quality wolf pelt.");
  }
  elsif ($text=~/lion/i) {
    quest::say("I will require 96 gold pieces and a lion skin.");
  }
}

sub EVENT_ITEM 
	{
	if ($faction > 4) 
		{
		quest::say("Kithicor residence do not do buisiness with those that seek to trick us");
		}
	else
		{
		if (plugin::check_handin(\%itemcount, 13766 => 1, $gold >= 96)) 
			{
			quest::summonitem(2315);
			}
		elsif (plugin::check_handin(\%itemcount, 13752 => 1, $gold >= 25)) 
			{
			quest::summonitem(2314);
			}
		elsif (plugin::check_handin(\%itemcount, 13054 => 1, $gold >=6))	
			{
			quest::summonitem(2312);
			}
		if (plugin::check_handin(\%itemcount, 13755 => 1, $gold >=13))
			{
			quest::summonitem(2313);
			}
		FACTION();
		}
	}

sub FACTION
	{
	quest::faction(269,2);
	quest::faction(1601,1);
	quest::faction(272,1);
	quest::faction(324,-1);
	quest::ding();
	quest::exp(500);
	}
