sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith."); 
		}

	if ($text=~/militia/i) 
		{
		quest::say("The Freeport Militia is nothing more than a ragtag band of mercenaries and convicts. They act as the guards of this troubled city. Be well aware that they are not the honorable guards you may think they are. They are commanded by Sir Lucan D'Lere, the self-proclaimed ruler of Freeport. We of the Hall of Truth shall set this city free from the grip of the Militia one day. It is our duty as Knights of Truth.");
		}
	}

sub EVENT_ITEM 
	{

    if (plugin::check_handin(\%itemcount, 18735 => 1)) #guild note
        {
        quest::say("The Truthbringer welcomes you into his life. Here is the tunic of Marr. Wear it with pride and be sure to conduct yourself with valor. Once you are ready to begin your training please make sure that you see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
        quest::summonitem(13554);
        # Verified on live
        quest::faction(281,100); #knights of truth
        quest::faction(362,20); #priests of marr
        quest::faction(330,-15); #freeport militia
        quest::faction(271,-15); #Dismal Rage
        quest::faction(311,10); #Steel Warriors
		quest::ding();
        }

	if (plugin::check_handin(\%itemcount, 18822 =>1 )) 
		{
		quest::say("You must be the young member of the Hall of Truth who was sent by Theron. I am glad to see you avoided any interference. Please take this as a reward for your service.");
		quest::givecash(9,0,0,0);
		quest::summonitem(quest::ChooseRandom(13869,7681,15202,7682));
		#Faction verified on ZAM
		quest::faction(281, 10); #Knights of Truth
		quest::faction(271, -1); #Dismal Rage
		quest::faction(330, -1); #The Freeport Militia
		quest::faction(362, 2); #Priests of Marr
		quest::faction(311, 1); #Steel Warriors
		quest::exp(500);
		quest::ding();
		}
	if (plugin::check_handin(\%itemcount, 18816 => 1)) 
		{
		quest::say("Thank you, defender of Karana! We have heard rumors of the followers of Bertoxxulous gaining knowledge of our knight who infiltrated the ranks of the [Militia]. They would have tried to sell the information to the Militia. We will inform our knight immediately. As for you, here is a donation to your journey's expenses. Stay clear of the Freeport Militia. There is no doubt they have learned of your alliance with us.");
		#Faction verified on ZAM
		quest::faction(281, 20); #Knights of Truth
		quest::faction(271, -3); #Dismal Rage
		quest::faction(330, -3); #The Freeport Militia
		quest::faction(362, 4); #Priests of Marr
		quest::faction(311, 2); #Steel Warriors
		quest::exp(1000);
		quest::ding();
		quest::givecash(0,0,7,1);
		quest::summonitem(quest::ChooseRandom(6016,13296));
		}
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:freportn  ID:8045 -- Eestyana_Naestra 

