
sub EVENT_SAY
	{
	if($text=~/Hail/i)
	{
	quest::say("I am Nexvok, master wizard of the Dismal Rage.  My associates Heneva and Konious and I provide our services to master Zarn on a regular basis.  People of our talent are in high demand. and Pietro pays well, so we are, of course, very loyal.");
	}
	}

sub EVENT_ITEM
	{

	# A tattered note ID- 18854
	if(plugin::check_handin(\%itemcount, 18854 => 1))
		{
		quest::say("Ah ha...  Fresh meat.  Here, put this on...  you're one of us now.  Do your best to do your worst. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::exp("100");
		quest::ding();
		quest::summonitem("13564"); #Dirty Torn Robe
        #Factions verified on live
        quest::faction(271,100); # Dismal Rage
        quest::faction(296,20); # Opal Dark Briar
        quest::faction(281,-15); # Knights of Truth
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Wizard');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freporte  ID:10119 -- Nexvok_Thirod

