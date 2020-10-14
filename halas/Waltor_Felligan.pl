# Quest for Waltor_Felligan in halas - Wooly Fungus, Poison Cure and Disease Cure 
# NPC ID 29058 -- Waltor_Felligan 

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{ 
		quest::say("Hello, me friend! I'm the resident healer o' Halas. Please inform me when ye've a need fer me talents to [bind wounds], [cure disease] or [cure poison]. Might I add, if ye're a young shaman o' Halas, ye can also [assist in gathering fungus]."); 
		}
	elsif ($faction > 5) #Verified
		{
		quest::say("The scales o' the Shamans o' Justice dinnae tip in yer favor.  Ye'd best flee while ye still have the chance.");
		}
	elsif($text=~/cure disease/i)
		{
		quest::say("Two small quantities o' wooly fungus are needed before we can cure yer malady.");
		}
	elsif($text=~/bind wounds/i)
		{
		quest::say("Before I bind yer wounds, ye must pay tribute to the Tribunal in the amount of ten gold coins.");
		}
	elsif($text=~/cure poison/i)
		{
		quest::say("I'll be needing mammoth steaks to feed the unfortunate.  Then we'll drain the poison from yer veins.");
		}
	elsif ($faction > 4)
		{
		quest::say("Ye're no criminal to the Shamans o' Justice, but ye're yet to prove yer devotion to justice.");
		}
	elsif($text=~/assist in gathering fungus/i)
		{
		quest::say("As the wooly spiderlings get ready to molt, they'll carry wooly fungus. Oftentimes, one can find wooly fungus growing on their bellies. I use this in me healing practices. I'll reward ye if ye can fill this jar full o' the valuable fungus. Don't forget to combine them before ye return it to me. And have yerself some rations handy, or ye may find yerself snacking on this tasteless food source.");
		quest::summonitem(17946); 
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 13966 => 1)) 
		{ # Jar of Fungus turn in for random spell 
		quest::summonitem(quest::ChooseRandom(15203, 15270, 15271, 15275, 15036, 15075)); 
		quest::say("Aye! Ye've filled the jar. I'll see to it that Holana locks this away. Tis difficult to obtain and we can only spare the talents of our young shamans. Allow me to give ye a reward. Thank ye kindly fer yer service."); 
		quest::faction(327, 10); #faction with Shamen of Halas increased 
		quest::faction(328, 10); #faction with Merchants of Halas increased 
		quest::faction(223, -30); #faction with Circle of Unseen Hands decreased 
		quest::faction(229,-30); #faction with Coalition of Tradefolk decreased 
		quest::faction(244,-30); #faction with Ebon Mask decreased 
		quest::givecash (0,0,4,0); 
		quest::exp(50); 
		quest::ding();
		} 
	elsif ($faction < 6 && plugin::check_handin(\%itemcount, 13445 => 1)) 
		{ # poison cure for steak
		quest::selfcast(203); 
		quest::say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved.");      
		} 
	elsif ($faction < 6 && plugin::check_handin(\%itemcount, 13967 => 2)) 
		{ # disease cure for wooly fungus
		quest::selfcast(213); 
		quest::say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved."); 
		} 
	elsif ($gold == 10 || $silver == 100 || $copper == 1000)
		{
		quest::selfcast(12); # Verified on Zam
		quest::say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved."); 
		}
	else 
		{ 
		quest::say("Why do ye give me these items?"); 
		plugin::return_items(\%itemcount); 
		} 
	} 
#END of FILE Zone:halas  ID:29058 -- Waltor_Felligan
