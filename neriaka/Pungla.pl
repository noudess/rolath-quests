#Flaming Pungla

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Welcome! Drink you shall, some of de finest drinks of da lands! [Flaming Pungla], I suggest to you. It all me sells");
		}
	if($text=~/flaming pungla/i) 
		{
		quest::say("Greatest drink and Plunga's creation. Buy one you should. Dey so gud me gots da charge t'ree golds");
		}
	}

sub EVENT_ITEM 
	{
	if ($gold == 3)  #3 Gold
		{
		quest::say("Bottoms up!");
		quest::summonitem(13382); #Flaming Pungla
		}
	else 
		{
		quest::say("This not how much me ask for..."); #Text made up
		plugin::return_items(\%itemcount);
		}
	}

# End of Quest
