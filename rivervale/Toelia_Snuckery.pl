sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Oh. hi.  Listen. um.. $name. was it?  Listen. pal.  I really don't have time for the friendly-friendly. so why don't you just move on?"); 
		}
	elsif($faction >= 6)
		{
		plugin::reject_say();
		}
	elsif($faction == 5)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/I am the new dishwasher/i)
		{
		quest::say("Dishwasher, huh?  You must not mind getting your feet wet then, huh?  Well, I do have a job for you.  It seems one of our younger employees got a little nevous around a Deputy and ditched his um..  recent purchase into the river.  We sent the fool after it but ol' [Chomper] got him.  He said he had dropped it off the docks but the currents might have moved it from there.  It should be in an old pouch.  Return the merchandise to me.  Well?  Get going!");
		}
	elsif($text=~/Who is chomper/i)
		{
		quest::say("Chomper is a big, mean ol' fish.  He looks like a normal fish, but a little bigger, and boy, oh boy, is he mean!"); 
		}
	}

sub EVENT_ITEM 
	{

	if($faction <5 && plugin::check_handin(\%itemcount, 13785 => 1))
		{
		quest::say("'What is this?  The pouch is empty!  Where is the Ruby?!  What do you mean you don't have it?  Oh no.  I bet [Chomper] swallowed it!  Get it back and bring it to me.");
		#faction verified per ZAM
		quest::faction(241,5); #Deeppockets
		quest::faction(223,1); #Circle of Unseen Hands
		quest::faction(292,-1);  #Merchants of Rivervale
		quest::faction(336,1); #Coalition of Tradefolf Underground
		quest::faction(329,1); #Carson McCabe
		#exp verified on live - turn in at level 1 was 14%
		$client->AddLevelBasedExp(14,3)
		quest::ding();
		quest::givecash(3,0,0,0);
		} 
	elsif($faction <5 && plugin::check_handin(\%itemcount, 13786 => 1))
		{
		quest::say("'You found it!  Heh.  Good thing you brought it back bub.  This thing isn't priceless, its worthless but at least you proved you are loyal.  Poor ol' Chomper..");
		#faction verified per ZAM
		quest::faction(241,10); #Deeppockets
		quest::faction(223,1); #Circle of Unseen Hands
		quest::faction(292,-1);  #Merchants of Rivervale
		quest::faction(336,1); #Coalition of Tradefolf Underground
		quest::faction(329,1); #Carson McCabe
		#exp verified on live - turn in at level 1 was 14%
		$client->AddLevelBasedExp(14,3)
		quest::ding();
		quest::givecash(5,0,0,0);
		} 

	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	}

#END of FILE Zone:rivervale  ID:19063 -- Toelia_Snuckery 
