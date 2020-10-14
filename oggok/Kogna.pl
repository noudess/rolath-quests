sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("You be tinking you be [real tuff Craknek]?");
		}
	if ($faction > 4)
		{
		plugin::reject_say();
		}
	elsif($text=~/i am a real tuff craknek/i)
		{
		quest::say("Me not tinking so. but maybe me wrongs.. no.. me neber wrongs.  You no tuff. only liddle Craknek is you.  You tink you be tuff Craknek. you bringed me four lizard meats.  Me like lizard meats.  You no tuff.  You bringed me lizard [meats].  I make you tuffer Craknek.  Me bestest Craknek.");
		}
	elsif ($text=~/meats/i) 
		{
		quest::say("Yup, meats.  You brings me four, me gives you sumting.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount, 13410 => 4)) 
		{
		quest::say("No, I donut tink so. Who gived you? Bah, me most tuffest Craknek, but me no lier. Me help you be tuffer Craknek. Who gived you dese? Maybe you finded dead lizards, yes, dat it. Bah, taking dis and kills more tings. You learned much, com see me, I teaches you best Craknek ways. Keep eye on dem Greenbloods, dey nasty and not so tuff.");
		quest::faction(228, 1);
		quest::faction(232, 5);
		quest::faction(261, -1);
		quest::exp(50);
		quest::summonitem(quest::ChooseRandom(5023,5025,6013));
		quest::ding();
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:oggok  ID:49041 -- Kogna 
