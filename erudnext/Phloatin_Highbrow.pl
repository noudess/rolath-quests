sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Ahoy there. [sailor]!"); 
		}

	if($text=~/not a sailor/i)
		{
		quest::say("You must be a sailor after all the time you spent on the boat to get here!"); 
		quest::doanim(63);
		}

	if($text=~/bookworm/i)
		{
		quest::say("That'd be my sister Sinnkin. She's not interested in anything but booze and books."); 
		quest::updatetaskactivity(25,5,1);
		}
	}

sub EVENT_SIGNAL 
	{
	quest::emote("looks up sharply.");
	quest::say("Ha! The closest you will get to tonic is in the library. That's assuming you know how to spell tonic. Bwaha ha! When you see the bookworm give her a KISS for me! HAHA!!");
	quest::settimer("letnextguyspeak", 2);
	}

sub EVENT_TIMER
	{
	quest::stoptimer("letnextguyspeak");	
	quest::signalwith(24067,51);
	}

#END of FILE Zone:erudnext  ID:98037 -- Phloatin_Highbrow 

