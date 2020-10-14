sub EVENT_ITEM 
	{ 
	if ($item1=="18762")
		{
		quest::say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes.  If you wish to start earning some armor, go see Conladan.");
		# Verified
		quest::summonitem("13513");
		quest::exp(10);
		quest::faction(305,100);
		quest::ding();
		} 
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:halas  ID:29069 -- Dun_McDowell 

