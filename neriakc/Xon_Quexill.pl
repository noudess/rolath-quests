#Last part of Sir Arium's Bridal quest.


sub EVENT_SPAWN 
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}

sub EVENT_ENTER 
	{
	if(plugin::check_hasitem($client, 18758)) 
		{ 
		$client->Message(15,"Xon Quexill turns towards you. 'Welcome to the Lodge of the Dead. I am Xon Quexill and with my training you will learn to master the Necromantic arts. Read the note in your inventory and hand it to me when you are ready to begin your training.'");
		}
	}


sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Lodge of the Dead. May you serve our Queen with the bleeding of others.");
		}
	if($text=~/befallen/i)
		{
		quest::say("It is true that the return of Marnek could create difficulties for us, especially if this has the blessing of Solusek Ro himself. Therefore, I command you to deliver to me any further information you uncover regarding the plans of the Burning Dead, and likewise I order you to return here at my bidding for further instructions in this matter. Now, begone.");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount,18474 =>1))
		{
		quest::say("The egg is hatching! It's a miracle! Er, I mean, I knew my Incubate-O-Matic would work!");
		quest::say("Very interesting, servant of the Queen. This deed has stayed my wrath for this interruption of my business. Where did you find this?");
		MarnekFaction();
		quest::givecash(0,8,0,0);
		}

	if(plugin::check_handin(\%itemcount,31492 => 1))
		{
		quest::say("Ha ha ha ha! Oh the poor steed of a noble paladin! Bah, it will find no rest yet. I who can command the spirits of the dead demand it serve you once again.");
		quest::summonitem(31496);
		MarnekFaction();
		}

	if(plugin::check_handin(\%itemcount,18758 => 1)) #A Tattered Note
		{
		quest::say("Just what I need in this outfit, another waste of flesh. Here, put this on. Go bother Talorial for a while - I'm sure he has some menial task for you. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks. You'd better prove yourself of value to me. I hear I can get few plat for the skull of an idiot on the black market, and I could make a fortune from your type. Now, get outta here!");
		quest::summonitem(13587); #Dark Stained Training Robe
		#Factions verified on Live
		quest::faction(239, 100);#The Dead
		quest::faction(303, 15);#Queen Cristanos Thex
		quest::faction(278, -15);#King Naythox Thex
		quest::faction(275, -15);#Keepers of the Art
		quest::faction(245, -15);#Eldritch Collective
		quest::faction(1522, -200);#Primordial Malice
		quest::exp(100);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}

sub MarnekFaction
	{
	quest::faction(239,5);
	quest::faction(303,1);
	quest::faction(278,-1);
	quest::faction(275,-1);
	quest::faction(245,-1);
	quest::faction(1522,-10);
	quest::exp(6400);
	quest::ding();
	}
