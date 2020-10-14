sub EVENT_SPAWN
	{
	#quest::set_proximity(732,780,691,792,-13,-9);
	}

sub EVENT_ENTER
	{
	quest::say("Out of Work $name??  Don't miss out on a new way to earn!  Buy the LATEST Odus Chronicles and find out how.");
	#quest::say("Back issues of the Chronicles!  Get them for your library.");
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You look like someone that has a nose for knowledge. You ought to buy a copy of the Odus Chronicle today and further your knowledge about current events."); }
}
#END of FILE Zone:erudnint  ID:24015 -- Sparlus_Penfold 

