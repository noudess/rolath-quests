sub EVENT_SAY 
	{
	if ($faction > 7)
		{
		quest::say("Is that your BREATH, or did something die in here?  Now go away!");
		}
	elsif ($text=~/hail/i) 
		{
		quest::say("Errr. You smell funny. You bring us [toy]?");
		}

	elsif ($text=~/toy/i) 
		{
		quest::say("You go, bring us gnome toy. You not come back or we eat you and then you die like short one. Gnome toy! You bring. You good person.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 8 && plugin::check_handin(\%itemcount, 6344 => 1)) 
		{
		quest::say("Rreeee! Great toy. Shiny. We not need this old toy anymore. You take. Now go way, this our toy, we play.");
		quest::summonitem(13748);
        quest::exp(500);
		#Faction verified on ZAM
		quest::faction(382, 4); #Kerra Isle
		}
	}
