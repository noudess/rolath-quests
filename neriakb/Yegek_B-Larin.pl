sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome. A brother of the Indigo you must be. Why else would one dare to roam the corridors of the Cauldron of Hate? You were most likely sent to speak with Yegek. If so. speak up and tell Yegek who [sent] you."); 
		}
	if($text=~/Seloxia Punox/i)
		{
		if ($faction <= 4)
			{
			quest::say("You are new blood! I shall help you to face the dangers. For now, you must listen. First we must be sure to increase your skill by combat. Take this bag to the outside and fill it with three beetle eyes and three bone shards from the undead. Combine and return it. Then we shall reward you and continue. Do not lose the short sword you had upon entering our brotherhood. We just may need it later on.");
			quest::summonitem(17942); #Empty Bag
			}
		elsif ($faction <=5)
			{
			quest::say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
			}
		else
			{
			quest::say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");
			}
		}

    if($text=~/ready for the second test/i)
        {
        if ($faction <= 4)
            {
            quest::say("You will now learn what happens to those undesirables who once called themselves Indigo. But first, you will hand me your sword which was given to you by the Indigo Brotherhood. This battle must be fought without a blade. Show us your strength!");
            }
        elsif ($faction <=5)
            {
            quest::say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
            }
        else
            {
            quest::say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");
            }
        }

	}

sub EVENT_ITEM 
	{
    if (plugin::check_handin(\%itemcount, 13887 => 1))
        {
        quest::say("Very nice work. Here are some provisions. Now are you [ready for the second test]?");
        quest::summonitem(13005); #Food and water
        quest::summonitem(13006); #Food and water
        #Factions verified on ZAM
        quest::faction(270, 5); #Indigo Brotherhood
        quest::faction(326,-1); #Emerald Warriors
        quest::faction(311,-1); #Steel Warriors
        quest::faction(1522,-10); #Primordial Malice
        quest::exp("200");
		quest::givecash(4,0,0,0);
        quest::ding();
        }

    if (plugin::check_handin(\%itemcount, 9998 => 1))
        {
        quest::say("Those young warriors who dared to run from battle are now our fodder. They shall help us teach you that sometimes you must kill your own kind. In the center of the arena we have set a coward. Show me you can kill your own when required and bring me his head. Do not grant him mercy nor allow him to flee.");
		quest::unique_spawn(41098,0,0,-1215,-24,-25.87,260);
		}

    if (plugin::check_handin(\%itemcount, 13888 => 1))
        {
        quest::say("You have performed greatly. A coward deserves no pity or mercy. You will be a fine addition to our house. Let us replace your weapon with this, a sullied two handed sword! The weapon of a young brother of this hall. It is a finer weapon than your first. Go and spread the hate of Innoruuk.");
        quest::summonitem(10830); #Sullied Two Handed Sword
        #Factions verified on ZAM
        quest::faction(270, 15); #Indigo Brotherhood
        quest::faction(326,-2); #Emerald Warriors
        quest::faction(311,-1); #Steel Warriors
        quest::faction(1522,-30); #Primordial Malice
        quest::exp("500");
        quest::ding();
		}

	else
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:neriakb  ID:41031 -- Yegek_B`Larin 
