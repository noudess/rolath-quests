
sub EVENT_ITEM 
	{ 
	if(plugin::check_handin(\%itemcount, 18747 => 1))
		{
		quest::say("Welcome to the guild, here's your guild tunic. Once you are ready to begin your training please make sure that you see Sten Harnak, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem("13571");
		# Checked on live
		quest::faction(284,100);
		quest::faction(281,15);
		quest::faction(285,-5);
		quest::faction(304,-5);
		quest::faction(262,15);
		quest::exp(100);
		quest::ding();
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Bard');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:freportn  ID:8066 -- Caskin_Marsheart 

