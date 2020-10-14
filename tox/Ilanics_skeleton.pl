# Ilanic's Scroll

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		# This was tested at apprehensive.  Not sure when he starts saying yes.
		# Fails at dubious, works at amiable.
		if ($faction > 4)
			{
			quest::say("No friend of Crimson.  Join me... You will.");
			}
		else
			{
			quest::say("My scroll must find my [scroll] so I may finish my research.");
			}
		}

	if($text=~/scroll/i)
		{
		quest::say("Kobold! Kobold!");
		quest::spawn2(38172,0,0,$x,$y,$z,$h);
		}
	}

#END of FILE Zone:erudnint  ID:38150 --  Ilanics_skeleton
