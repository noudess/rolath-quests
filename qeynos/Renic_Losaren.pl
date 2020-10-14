sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome, $name .  Please feel at ease here in the Temple of Thunder.  We, the Knights of Thunder, are here to guide and serve."); 
		}

	if ($text=~/Karana/i)
		{
		quest::say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
		}
	}

sub EVENT_ITEM 
	{ 
	if ($item1=="18715")
		{
		quest::say("Welcome, friend, to the Temple of Thunder. Here, you can practice your skills and learn the ways of Karana. Take this tunic and wear it with pride, for you are now a Priest of Thunder. Guild Trainer Daedet Losaren will begin your tutoring, see him when you are ready. Once you are ready to begin your hunting training please see Vansted Rohenga, he will assist you in some tasks for your early adventures.");
		quest::summonitem("13505");
		quest::faction(280, 100);
		quest::faction(221, -100);
		quest::faction(341, 75);
		quest::faction(262, 75);
		quest::exp("100"); 
quest::ding();
		}
	}
#END of FILE Zone:qeynos  ID:1055 -- Renic_Losaren 

