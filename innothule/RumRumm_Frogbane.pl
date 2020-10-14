sub EVENT_SAY
	{
	quest::settimer("doit", 1);
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 22646 =>2, 22645 =>2)) 
		{
		quest::emote("licks his lips");
		quest::say("AHHH! This will make a fine stew!  Yuz go away now, me plan to make big pot!  Hmmm now where be dat nice big oven to make da stew.");
		quest::LearnRecipe(27801);
		plugin::Autovtell("part");
		plugin::DoAnim("wave");
		$client->AddLevelBasedExp(5,5);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 22646 =>2, 60010 =>2)) 
		{
		quest::emote("licks his lips");
		quest::say("Deez vials are smaller den Rummer expected, but Rummer guess they will be better den using spices.  Hmmm now where is dat oven... needs da oven to make dis stew.");
		quest::LearnRecipe(27801);
		plugin::Autovtell("part");
		plugin::DoAnim("wave");
		$client->AddLevelBasedExp(5,5);
		quest::ding();
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer("doit");

	if ($faction > 6)
		{
		plugin::Autovtell("part");
		quest::say("You and yer kind stay around here long, and me bash yuz good.  You can't count dat on all of your toes and be sure the total be 5.");
		plugin::DoAnim("rude");
		}
	elsif ($text =~ /hail/i)
		{
		plugin::Autovtell("greet");
		plugin::DoAnim("wave");
		quest::say("It's great to be back home, and to have the frogloks in their place, but I sure do miss the taste of halfling.");
		}
	elsif ($text =~ /taste/i || $text =~ /halfling/i)
		{
		plugin::Autovtell("agree");
		plugin::DoAnim("nodyes");
		quest::say("Oh yes, scrumptible.  I knows a great way to cook dem up.  I tells you wat.  You bring me two of der toes and a sample of blood to cover each toe, and me teach you da recipe.");
		}
	}

