sub EVENT_SAY 
	{ 

	if ($text=~/Hail/i)
		{
		quest::say("Welcome $name . This is the Temple of Marr and you must be another seeker of Passion and Valor. That is good. Become one with us and help us to defeat the [fallen knight]. It is he who has caused the demise of this city."); 
		}

	if ($text=~/knight/i)
		{
		quest::say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the [Crusade of Tears] this city would still be united in valour."); 
		}

	if ($text=~/crusade/i)
		{
		quest::say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade Freeport was left in the care of Sir Lucan D'Lere. How unfortunate."); 
		}
	}
sub EVENT_ITEM 
	{ 
	if ($item1=="18735")
		{
		quest::say("Welcome to the Priests of Marr. Here, you will be taught how powerful passion truly is. The passion of Erollisi Marr, the Queen of Love, shall flow through you and into all those you meet. Wear this tunic in the name of Love. Once you are ready to begin your training please make sure that you see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::summonitem("13556"); #White and Blue Tunic
		quest::exp("100");
        # Verified on live
        quest::faction(362,100); # Priests of Marr
        quest::faction(330,-10); # Freeport Militia
        quest::faction(281,15); # Knights of Truth
		quest::ding();
		}
	}
#END of FILE Zone:freportn  ID:8046 -- Tholius_Quey 

