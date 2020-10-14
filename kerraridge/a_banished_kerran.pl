sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("Rrrrrr..  Away frrrom this isle of death and.. prrrr.. punishment.");
		}

	if ($text=~/puab/i)
		{
		quest::say("Prrr... Master Puab? Show me prrroof.");
		}

	if($text=~/remains of Thipt/i) 
		{
		quest::say("Clawknight Thipt wished to learn the ways of Ashen.  Prrr.. Together we go into green goblins' lair to train.  Prrr.. We find too many and he is too weak.  Separated and unable to find him, I hear his death cry.  Prr.. I cannot make it back, eyes upon me.  Now I must find one sent by Ashen to aid in the recoverrry of his remains.");
		}
	}

sub EVENT_ITEM {
     if(plugin::check_handin(\%itemcount, 12369 => 1)) {
        quest::say("Ashen Order!!  Prrr.. My order.  I have been expecting one of us.  Prrr.. Help me rejoin my native land.  Take this box.  Combine all the [remains of Thipt] within the box and return it to me.  This shall aid me in my redemption.");
        quest::exp("100");
        quest::ding();
        quest::summonitem("17985");
    }
    elsif(plugin::check_handin(\%itemcount, 12371 => 1)) {
        quest::say("Prrr.. Thank you brother of Ashen. I can now spend my time upon this island in peace, until my penance is serrrved. He dabs his paw into the mud and places it upon a tattered parchment. Take this message to Puab. Farrrwell.");
        quest::summonitem("28055");
        quest::exp("100");
        quest::ding();
    }
    else {
        plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:kerraridge  ID:74029 -- a_banished_Kerran


