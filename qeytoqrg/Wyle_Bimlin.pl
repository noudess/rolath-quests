sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings, fine friend! I bet you are in need of some fine tonics. Feeling a little low? Take a drink of my fine Zap Doodle Tonic. It will give you the energy of five hill giants! You are in luck, my friend! I have it on sale today, and today only. Matter of fact, the sale ends in five minutes or five footsteps, whichever comes first. So don't be down... get an upside-down frown with my Zap Doodle Tonic! All sales are final.");
		}
	}

sub EVENT_WAYPOINT_ARRIVE {
if($wp eq 1) {
	quest::SetRunning(1)
	}
if($wp eq 4) {
	quest::SetRunning(0)
	}
if($wp eq 6) {
	quest::SetRunning(1)
	}
if($wp eq 7) {
	quest::SetRunning(0)
	}
}

