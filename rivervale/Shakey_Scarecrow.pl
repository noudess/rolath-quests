sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::emote("rustles and looks up at you in acknowledgment.");
		quest::signalwith(19052, 0, 0);
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 6 && plugin::check_handin(\%itemcount, 14321 => 1))
		{
		quest::emote("shakes his head around and beams a smile at you");
		quest::say("New Hay! New Hay!  This makes Shakey Happy!");

		quest::ding();
		quest::exp(500);
		my %cash = plugin::RandomCash(4500,4600);
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});

		quest::faction(324, -3);    #Unkempt druids
		quest::faction(286, 2);     #Mayor Gubbin faction
		quest::faction(355, 25);    #Storm Reapers faction
		quest::faction(292, 3);     #Merchants of Rivervale faction
		quest::summonitem(quest::ChooseRandom(13980, 13980, 14031));
		}
	if ($faction < 6 && plugin::check_handin(\%itemcount, 11139 => 1))
		{
		quest::emote("You remove the dilapidated pumpkin from Shakey's wooden neck post and replace it with the new one. A haunting voice rings in your ears");
		quest::say("Who has given me a voice once again? I can sense your presence but cannot see your form. Allow me but a moment to explain. I have been trapped in this golem of hay for many years. Ever since the horrible bloodbath in the forest I have been bound to this horrible fate, and I cannot find rest until the person responsible for my murder has been dealt with! Our fates are intertwined, you and I. We can both find peace if you listen to what I have to say. Find the blue orb. It yet retains its dark power. Go into the woods and seek out the one with a fragment.");
		quest::summonitem(52355);
		}
	plugin::return_items(\%itemcount);
	}
