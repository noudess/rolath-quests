sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello. Please leave me be. I am studying several interesting essays on mana storage devices.");
		}

	# The following works at dubious - verified
	if ($text =~ /i wish to speak to you on a matter of the soul/i)
		{
		quest::say("I haven't heard anyone say that in a while. I am surprised that you want to follow the legacy of Azraxs. Take this book and write down the instructions on how to complete your soul trap and then give the book back to me.");
		quest::summonitem(18956);    #Tattered Book
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 18956 => 1))
		{                            #Tattered Book
		quest::say("For your sake, I wish you a quick and painless death.  For mine, I wish you a slow and painful one, as a warning to any fool who wishes to follow in your path.");

		# No exp - verified live
		quest::ding();
		quest::summonitem(17803);    #Soul Trap
		}
	else
		{
		quest::say("I don't need this.");
		plugin::check_handin(\%itemcount);
		}
	}

sub EVENT_AGGRO
	{
	quest::say("Dullard.  I may be a scholar but I can still make your soul writhe in pain.");
	}

sub EVENT_DEATH
	{
	quest::say("The cold of souls and stench of death!  Always, here, do I find it...");
	}

#END of FILE Zone:paineel  ID:75029 -- Ernax_the_Scholar
