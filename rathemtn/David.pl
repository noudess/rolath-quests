sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("I, the keeper of the [Bracers of Ro],  welcome you.  Come and rest within our camp.  You have nothing to fear while such righteous might is gathered.");
		}
	elsif ($faction > 5)
		{
		quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can."); 
		}
	elsif($client->GetModCharacterFactionLevel(242) < 25)	
		{
		quest::say("You and I are not one yet.   Go to Erudin and serve the Deepwater Knights.  When you can ask Lord Weligon if you are an [honored member] and he answers yes, then this is when we are one with Prexus.");
		}
	elsif($text=~/bracers of ro/i)
		{
		quest::say("When you can swim the waters of Rathe and return two goblin nets from the elusive goblin net masters. then you will be rewarded the bracer mold.");
		}
	}

sub EVENT_ITEM 
	{ 
	if($client->GetModCharacterFactionLevel(242) > 24 && plugin::check_handin(\%itemcount,12311 => 2)) 
		{
		quest::say("You have done well. Take the mold for the bracer.  Go forth to speak with Thomas of [Lord Searfire].  Then all components shall be known.");
		quest::summonitem("12301");
		# Factions per Zam
		quest::faction(242,20);
		quest::faction(695,3);
		quest::faction(265,-3); 
		quest::exp(3000);
		quest::ding();
		} 

	plugin::return_items(\%itemcount);
	}
