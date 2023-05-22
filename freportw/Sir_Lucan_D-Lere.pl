
sub EVENT_SAY 
	{ 
	if($text=~/Hail/i) 
		{
		quest::say("Hail. citizen!  I am very busy. I do not have time to speak with you.  If you have any complaints. please direct them to City Hall.  Unless. of course. you have some personal business in which I might be interested.");
		}
	if ($text=~/shrine of innoruuk/i) 
		{
		quest::say("It is about time Pietro sent someone. You people should be lucky I allow you to conduct your business in this city. I will have you all locked up if you cannot be more prompt. Now, listen up! I want you to go out to the Commonlands. My guards have reported that a messenger from Qeynos is staying at an inn near the western edge of the Commonlands. I suspect he is carrying vital information to the Hall of Truth. I want him stopped. Bring me the message if you know what's good for you and the Dismal Rage. Now, get out of here!");
		}
	}


sub EVENT_DEATH_COMPLETE
	{
	quest::spawn(9147, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ());
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18822 => 1 )) 
		{
		quest::say("So I see you decided to bring me the message. Good. I would hate to have to hunt you down. It could have gotten really messy and I hate reading bloodstained messages. Well it seems Antonius Bayle and the Knights of Truth have begun an alliance. And it sounds as though I may have a traitor among my guards. If you wish to switch your allegiance to Freeport, then find me this traitor. Bring me his militia tunic. Try to keep the blood from staining it.");
		#Factions verified on ZAM
		quest::faction(330,25); #The Freeport Militia
		quest::faction(336,3); #Coalilition of Tradefolk Underground
		quest::faction(281,-2); #Knights of Truth
		quest::faction(362,-2); #Priests of Marr 
		quest::exp(5000);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 13926 => 1 )) 
		{
		quest::say("So, it was Alayle! He was of no importance to us. He knew nothing. I thank you for assisting the Freeport Militia. My men shall keep an eye out for you. Unfortunately, so will the Knights of Truth. Might I suggest you spend less time in North Freeport?"); 
		#Factions verified on ZAM
		quest::faction(330,25); #The Freeport Militia
		quest::faction(336,3); #Coalilition of Tradefolk Underground
		quest::faction(281,-2); #Knights of Truth
		quest::faction(362,-2); #Priests of Marr 
		quest::exp(7500);
		quest::ding();
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere
