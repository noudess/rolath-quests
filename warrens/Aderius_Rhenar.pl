my $letter=0;

sub EVENT_SAY 
	{ 
	if($text=~/hail/i) 
		{
		quest::say("Hail, $name, I am Aderius Rhenar, priest of Quellious and assistant to Lady Laraena. I have been fortunate to be imprisoned here with these Kejekan cat men, they are a very wise people. Are you planning on returning to Erudin soon my friend?");
		}

	if($text=~/kejekans/i) 
		{
		quest::emote("points towards one of the white furred cat men occupying the cell. 'These are the Kejekans. They are an honorable, wise, and spiritual people that reside somewhere in the Stonebrunt Mountains to the east. Unlike their yellow furred cousins the Kerrans they do not carry an animosity towards us High Men'");
		}

	if($text=~/erudin/i) 
		{
		quest::say("I have managed to prepare a message on this scrap of cloth for the priestess Laraena. It is a matter of great importance to the High Council of Erudin. Please deliver this message to her promptly. I must stay here for a while longer and converse further with my Kejekan friends.");
		quest::summonitem(2049); 
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 132504 => 1))
		{
		quest::faction(298,2); # Peace Keepers.
		quest::faction(473,2); # Kejek
		quest::faction(266,1); # High Council of Erudin.
		quest::faction(265,-1); # Heretics.
		quest::exp(1000);
		quest::ding();
		quest::emote("reads the letter from Leraena.");
		$letter = 132504;
		quest::settimer("letter", 4);
		}
	elsif (plugin::check_handin(\%itemcount, 232507 => 1))
		{
		quest::givecash(0,0,quest::ChooseRandom(3,4,5,6),0);
		quest::exp(1000);
		quest::ding();
		# Faction verified on ZAM
		quest::faction(284,5); #league of antonican bards
		quest::faction(473,2); # Kejek
		quest::faction(265,-1); # Heretics.
		quest::emote("reads the letter from Kejek Mountain.");
		$letter = 232507;
		quest::settimer("letter", 4);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "letter")
		{
		if ($letter == 132504)
			{
			quest::say("Ah, it is so nice to hear directly from Leraena.  Thank you for bringing her word back to me.  I will continue to endeavor to further the alliance by serving the cause here with my new brothers and sisters of Kejek.");
			}
		elsif ($letter == 232507)
			{
			quest::say("So, the mail route is up and running!  This is great news.  I am also honored to receieve word directly from the Kejeken people.  This is the beginning of a new age between our people.");
			quest::settimer("Owakanji", 1);
			}
		quest::stoptimer($timer);
		}

	if ($timer eq "Owakanji")
		{
		quest::signal(101066);
		quest::stoptimer($timer);
		}
	}

sub EVENT_SIGNAL
	{
	my $facemob = $entity_list->GetMobByNpcTypeID(101066);
    $npc->FaceTarget($facemob);
	quest::emote("turns to face his cellmate.");
	quest::say("Yes, my friend, change has begun.");
	}

#END of FILE Zone:warrens  ID:101087 -- Aderius_Rhenar
