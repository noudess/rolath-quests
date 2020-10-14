## Frenway_Marthank.pl
##
## Quests: The Bayle List
##		   Bonethunder Staff	- Dialog is made up
## edited by mrhodes

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings. stranger. Please excuse my melancholy state.  I have had some [bad news] that has brought me great sorrow.");
	}
	
	if($text=~/bayle list/i)
	{
		quest::emote("begins to tear up as he starts to reply...");
		quest::say("The [Bayle List] is gone.  It lies inside the belly of that beast, [Mammoth].");
	}
	
	if($text=~/Mammoth/i){
		quest::say("Mammoth is the great bear which inhabits the caves.  It was he that swallowed my son whole.  My son was using the scroll case as a play sword when Mammoth approached.  I know you need the list but my vows as a Protector of the Pine forbid me to harm the bear.  Help me ease my pain.  Kill Mammoth and bring me his hide.  You will find the list inside the beast."); 
	}

	if($text=~/bad news/i){
		quest::say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now. could you please just leave me be? <sniff>"); 
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13912 => 1))
	{
		quest::say("It is not right to feel satisfied at the sight of Mammoth's hide, but I do.  Thank you, $name.");
		# factions verified on live (guards assumed 1 - was max)
		quest::faction(302,5);
		quest::faction(272,1);
		quest::faction(262,1);
		quest::faction(306,-1);
		quest::ding();
		quest::exp(5000);
	} else {
		quest::say("I have no use for this.");
		plugin::return_items(\%itemcount);
	}
}


#END of FILE Zone:qrg  ID:1454 -- Frenway_Marthank 
