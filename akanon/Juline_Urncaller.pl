sub EVENT_SPAWN
    {
    quest::set_proximity($x-50,$x+50,$y-50,$y+50);
    }

sub EVENT_ENTER
    {
    #:: Match a 18773 - Registration Letter
    if (plugin::check_hasitem($client, 18773))
        {
        $client->Message(15, "A beautiful gnomish woman stands before you. 'Welcome to the Library Mechanimagica young apprentice. I am Juline Urncaller, Master Enchanter. Read the note in your inventory and then hand it to me so that we can begin your training.");
        }
    }

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello $name.");
		}
	if ($text =~ /trades/i)
		{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");

		#:: GIve a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
		}
	if ($text =~ /second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");

		#:: GIve a 51122 - Tradeskill Basics : Volume I
		quest::summonitem(51122);
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 18773 => 1))
		{
        quest::say("Welcome! I am Juline Urncaller, I will help to guide you on your path to becoming a powerful enchanter. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of teh various [trades] you will have available to you.");
        quest::summonitem(13522);    #Dirty Gold Felt Robe
        #Factions verified on live
        quest::faction(245, 100);     #Eldritch Collective
        quest::faction(238, -15);     #Dark Reflection
        quest::faction(239, -5);      #The Dead
        quest::faction(255, 15);      #Gem Choppers
        quest::faction(333, 15);      #King Ak'Anon
        $client->AddLevelBasedExp(2.5, 1);
        quest::ding();
		}

	plugin::return_items(\%itemcount);
	}
