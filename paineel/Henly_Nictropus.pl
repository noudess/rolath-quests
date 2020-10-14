sub EVENT_SPAWN
	{
	quest::set_proximity(687,736,947,1009,-82,-78);
	}

sub EVENT_ENTER
	{
	my $traitor = quest::istaskcompleted(97);
	if ($traitor)
		{
		quest::say("TRAITOR!!  How dare you show your face in our city, $name.");
		}
	else
		{
		quest::say("$class!  The Dark Truth reports the news without all the usual propaganda and lies spewed by the mouthpieces of other Kingdoms and principalities. Buy a copy today for just a few silver and find out the real truth behind what has happened to the dogs guarding our city.");
		}
	#quest::say("$class!  Don't miss your chance to get back issues of the Dark Truth!  Get them now while we still have stock!");
	}
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("The Dark Truth reports the news without all the usual propaganda and lies spewed by the mouthpieces of other Kingdoms and principalities. Buy a copy today for just a few silver and find out the real truth behind current events."); }
}
#END of FILE Zone:paineel  ID:75114 -- Henly_Nictropus 

