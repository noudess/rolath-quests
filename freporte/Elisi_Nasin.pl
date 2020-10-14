
sub EVENT_SAY
	{ 

	if($text=~/Hail/i)
		{
		quest::say("Listen. this is a pretty busy [operation] I run here.  I certainly don't have any spare time to sit around and chit-chat with you all day. got it?");
		}

	if($text=~/operation/i)
		{
		quest::say("Look. $name . I don't have time for this.  Let's just say importing exotic goods is our main interest. along with a few other profitable ventures.  Now quit pestering me. or you'll force me to sic Grenny here on ya.");
        quest::signal(10122,10);
		}

	}

sub EVENT_ITEM
	{ 
	# A tattered note ID-18745
	if (plugin::check_handin(\%itemcount, 18745 => 1))
		{
		quest::say("Welcome to the Coalition of Tradesfolk underground. We like to keep a low profile around here and not draw any unneeded attention to our operations. you following me? I hope so. for your sake. Anyways. Nestral T'Gaza is in charge with helping out our newest members. Go see her as soon as you get a chance.");
		# Brown Faded Tunic ID-13568
		quest::summonitem("13568");
		quest::exp("40");
		quest::ding();
		#factions verified on live
        # Coalition of TradeFolk Underground
        quest::faction(336,"100");
        # Coalition of Trade Folk 
        quest::faction(229,"100");
        # Carson McCabe 
        quest::faction(329,"10");
        # Corrupt Qeynos Guards
        quest::faction(230,"5");
        # Freeport Militia 
        quest::faction(330,"15");
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freporte  ID:10108 -- Elisi_Nasin


