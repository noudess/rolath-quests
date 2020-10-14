# Broken Lute


sub EVENT_SAY {

if($text=~/Hail/i){

   quest::say("Hail!  What do think of [Lisera]?  She aint' much to look at, but soon she will be singing again.");

}

if($text=~/lisera/i){

   quest::say("Lisera is my lute.  She sounds horrible.  I need to get her tuned by a master tuner, but the League's Master Tuner is in the Plains of Karana for a while.  If only..  hey!!  You look like a fellow bard...  You [interested in the job]?");

}

if($text=~/interested in the job/i)
	{
	if ($faction >= 5) # Tested at indiff
		{
		quest::say("I will share this with you when you find some way to better server the League of Antonican Bards.");
		}
	else
		{
		quest::say("Great!!  Here.  Take Lisera to Vhalen Nostrolo.  He is in the plains near the well, composing.  He must tune it for me.  Be very careful! Lisera is all I've got.  If you complete this task and return with good news. I shall be glad to pass along an extra songsheet for a tune entitled 'Hymn of Restoration.");
		quest::summonitem(13114); # Lisera Lute
		}
	}

if($text=~/donate/i){

   quest::say("Donation... haha sure, I donate to my own cause every day!");

}

}
sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,18803 => 1)) { # Note To Cassius

   quest::say("Vhalen does such fine work. I can't wait till he comes back to Qeynos.");
   quest::summonitem(15007); # Song: Hymn of Restoration
   # Verified on live
   quest::faction(262,10); # Guards of Qeynos
   quest::faction(281,1); # Knights of Truth
   quest::faction(284,1); # League of Antonican Bards
   quest::faction(230,-1); # Corrupt Qeynos Guards
   quest::faction(330,-1); # Freeport Militia
   quest::exp(100);
   quest::ding();
}

}

#END of FILE Zone:qeynos  ID:1057 -- Cassius_Messus.pl
