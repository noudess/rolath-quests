#Quest: Leatherfoot Raiders
#Note: All text made up until someone can capture from live.

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Stand at attention!! You don't look fit enough to toe-wrestle my grandma!! You cannot be in my squad!! Are you [petitioning] or are you a [visitor]?");
		}
	elsif($text=~/visitor/i) 
		{
		quest::say("Well, why didn't you say so?! Forgive me for hollering. Allow me to introduce myself. I am Marshal Anrey Leadladle, commander of the [Leatherfoot Raiders].");
		}
	elsif($text=~/leatherfoot raiders/i) 
		{
		quest::say("You must be a visitor. The Leatherfoot Raiders are the elite force of the Guardians of the Vale. I command them. It is good to meet an outsider.");
		}
	# There is alterate text for other cities.
	elsif ($text=~/I am From/i)
		{
		if ($text=~/Rivervale/i)
			{
			if ($faction > 4)
				{	
				FACMES();
				}
			else
				{
				quest::say("So you're from Rivervale?!! You must be some kind of freak. No halfling from Rivervale would look, smell and act anything like you. Well, freak, if you think you're stout enough to be a Leatherfoot Raider, you prove it!! You travel the lands and return to me a polar bear skin, a grizzly bear skin, a shark skin and an alligator skin. Then maybe, just maybe, I will let you wear the cap of a Leatherfoot Raider.");
				}
			}
		else
			{
			quest::say("What!  The only things from there are gnolls and trolls!  Which one are you?!  You kind of look like a troll, but you smell like a gnoll!  Get out of my sight or you will be cleaning the latrine with a toothbrush!");
			}
		}
	elsif($text=~/petitioning/i) 
		{
		if ($faction <= 4)
			{
			quest::say("So you want to be a [Leatherfoot Raider]? What kind of joke is this? Look at you! You're a mess! Where are you [from]?");
			}
		else
			{
			FACMES();
			}
		}
	}

sub EVENT_ITEM {
  if($faction <= 4 && plugin::check_handin(\%itemcount, 13761 => 1, 13756 => 1, 13075 => 1, 13749 => 1)) { #Polar Bear Skin, Thick Grizzly Bear Skin, Shark Skin, Alligator Skin
    quest::say("So I see the young $race has become a young warrior. You have stepped up to the challenge of the Leatherfood Raiderrs,you may wear the petioners Skullcap,but to receive the true cap of the Raiders,bring me the Dirk of a fallen Neriak Dragoon and the cap I have given you. Only then can I be sure that you can truly be one of the few and bold,the Leatherfood Raiders.");
    quest::summonitem(13941); #Leatherfoot Skullcap
    quest::exp(1000);
	quest::ding();
    quest::givecash(8,1,0,0); #Copper x 8, Silver x 1
  }
  elsif($faction <= 4 && plugin::check_handin(\%itemcount, 13941 => 1, 13942 => 1)) { #Leatherfoot Skullcap, Dragoon Dirk
    quest::say("Congratulations my young deputy. Welcome into the brotherhood of the Leatherfoot Raiders. You have earned your skullcap. Wear it with pride. You are now one of the elite. Remember our motto 'Those who risk, prevail'!");
    quest::summonitem(12259); #Leatherfoot Raider Skullcap
    quest::exp(5000);
	quest::ding();
    quest::givecash(7,3,2,1); #Copper x 7, Silver x 3, Gold x 2, Platinum x 1
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}

sub FACMES
	{
	if ($faction <= 5)
		{
		quest::say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
		}
	else
		{
		quest::say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
		}
	}
#END of FILE Zone:rivervale  ID:19059 -- Marshal_Anrey
