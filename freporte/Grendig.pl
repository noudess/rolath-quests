sub EVENT_SAY
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hello there! If ya don't mind I'd like to get some rest in my room here. I just arrived from Kaladim and need some rest to recover from the journey. Dwarves were'nt meant to sail the ocean ya know. It's a good thing we've got strong stomachs though or I'd be a few pounds lighter!");
		plugin::SetAnim("stand");
		quest::settimer("laugh", 1);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "laugh")
		{
		quest::stoptimer("laugh");
		plugin::DoAnim("laugh");
		quest::settimer("sit", 5);
		}
	elsif ($timer eq "sit")
		{
		quest::stoptimer("sit");
		plugin::SetAnim("sit");
		}
	}

#END of FILE Zone:freporte  ID:10127 -- Grendig
