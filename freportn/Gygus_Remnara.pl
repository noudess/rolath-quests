sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr.");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18738 => 1)) #A tattered note
		{
		quest::say("Welcome to the Sentries of Passion.  We are the protectors of the Temple of Marr.  Wear our tunic with pride, young knight!  Find your wisdom within these walls and in the words of our priests.  And remember to aid all who follow the twin deities, Mithaniel and Erollisi Marr. Once you are ready to begin your training please make sure that you see Edwardian Holyblade, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem("13556"); #White and Blue Tunic
		quest::exp("100");
		# Verified on live
		quest::faction(362,100); # Priests of Marr
		quest::faction(330,-10); # Freeport Militia
		quest::faction(281,15); # Knights of Truth
		quest::ding();
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara
