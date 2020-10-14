sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Have you come for training young one?  The way of the Beastlord teaches many things about the forces of nature.  The [forces] in the thicket are very interesting.");
}
if($text=~/what forces?/i){
quest::say("Yes, the force that compels a creature to adjust to their surroundings in particular.  The Saruek have seem to adapted to their environment very well.  I am studying the effects of their claws.   It seems the different [variety] of Saruek have special enhancements.");
}
if($text=~/what variety?/i){
quest::say("Well, for example the Firefall Saruek can attack with claws that burn the flesh, the Deathmaw attack with poisonous claws. the shredder Saruek are especially skilled in fending off the Tegi that threaten them, and lastly there is a more uncommon Claw Beast that is very strong but does not appear that often.  I believe I could take their claws and affix them to a weapon to [enhance] it.");
}
if($text=~/how can you enhance it?/i){
quest::say("If you would like to test this theory go hunt these Saurek.  Bring me three claws each for Deathmaw, Firefall, and Shredder.  Due to the reported size of the Claw Beast I only need his talons.  Along with these claws bring me a wooden practice flail to fasten the claws to.  Go now I have many trainees waiting to be taught."); }
}


sub EVENT_ITEM 
	{
	if  (plugin::check_handin(\%itemcount, 7811 => 1, 30579 => 1))
		{
		quest::say("You have killed the Claw Beast!  Well done $name, you have shown a great ability to fight. I have not seen the like since the mightly Yalpeelor and Zunaloo!");
		quest::summonitem("7812","1");
		}
	elsif  (plugin::check_handin(\%itemcount, 7808 => 3, 30579 => 1))
		{
		quest::say("Well done $name.  Use your new weapon well.");
		quest::summonitem("7815","1");
		}
	elsif  (plugin::check_handin(\%itemcount, 7807 => 3, 30579 => 1))
		{
		quest::say("Well done $name.  Use your new weapon well.");
		quest::summonitem("7813","1");
		}
	elsif  (plugin::check_handin(\%itemcount, 7809 => 3, 30579 => 1))
		{
		quest::say("Well done $name.  Use your new weapon well.");
		quest::summonitem("7814","1");
		}

	  #do all other handins first with plugin, then let it do disciplines
	  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
	  plugin::return_items(\%itemcount);
	}

#END of FILE Zone:shadeweaver  ID:165168 -- Captain_Alim 
