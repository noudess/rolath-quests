sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50,$z-50, $z+50);
	}

sub EVENT_SAY {
	if($text =~/mistress anna/i) {
		quest::say("Mistress!  Aptly named, that one.  You are speaking of the Highpass hussy.  That is what everyone calls her, at least behind her back, that is.  Just as Highpass, she is beautiful and frequently traveled.  I have heard rumors that Carson has been seeing her, but how can that be true?  He has Lady McCabe.  What else does he need?");
	}
}

sub EVENT_ENTER
	{
	quest::say("Do you have any copper?");
	}
