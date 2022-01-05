sub EVENT_SPAWN
	{
	# Only saw this once, perhaps when I combined the box from Ernax?
	quest::settimer("souls", 120);
	}

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Hello.  Do you need something or did you merely wish to grace me with your oh-so-delightfully perfumed breath?");
		}
	elsif ($text =~ /cold/i)
		{
		quest::say("Who are you?  Bah.  Never mind.  The cold of lost souls chilling the spine.  Once this was Azrax Soulstealer's domain.  A crueler man there never was.  Binding and stealing souls was his forte.  Some of the souls he reaped still dwell in this place, seeking the promise of release fom their eternal suffering.");
		}
	}

sub EVENT_TIMER
	{
	quest::say("The cold of souls and stench of death!  Always, here, do I find it...");
	}

#END of FILE Zone:paineel  ID:75020 -- Elia_Athrex

