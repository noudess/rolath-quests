
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Ah. hello there. friend!  Me an' Rebby here. we're a just couple o' regular merchants.  Though we've got nothin' to sell right now. we'd gladly take any donations.  Them's the breaks. I suppose.");
		}
	}

sub EVENT_ITEM
	{
	if ($itemcount{18015} == 1)
		{
		quest::emote(" scribbles out a note and says ");
		quest::summonitem("18016");
		quest::say("Please make sure that Harkin Duskfoot gets this right away, if you lose it, it could mean both of our heads. ");
		}
	else
		{
		quest::say("Thanks for the donations $name.");
		}

	}

#END of FILE Zone:freportw  ID:9116 -- Janam_Rekish
