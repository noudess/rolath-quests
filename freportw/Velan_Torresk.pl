#1 - White Training Sash - Anyone with Kindly or better faction
#2 - Yellow Sash of Order - Anyone with a White Training Sash

sub EVENT_SAY 
	{
	$ashenorderfaction=$client->GetModCharacterFactionLevel(361);
	if($text=~/Hail/i) 
		{
		quest::say("Greetings. $name !  I am Velan Torresk of the Ashen Order.  I am in charge of training the newest members of our clan. and helping them advance their skills and rank.  When members perform certain tasks on behalf of the Order. they advance to a higher rank in our clan. and are awarded a special [sash].");
		}
	if($text=~/what sash/i) 
		{
		quest::say("The Sashes of Order are given out by the various trainers of our clan.  I give out the [white training sash] and the [yellow Sash of Order]. and [Reyia] is in charge of the [orange and red sashes].");
		}
	if($text=~/orcs/i) 
		{
		quest::say("The Deathfist Orcs are a large tribe of Orcs who live out in the desert. They are constantly sending small raiding parties and scouts to attack Freeport and its citizens. ");
		}
	elsif ($faction > 4)
		{
		plugin::reject_say();
		}
	elsif ($ashenorderfaction < 151)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/white training sash/i) 
		{
		quest::say("The white training sash of the Ashen Order is awarded to our new members for completing a few simple tasks to prove their devotion to our clan. As you know, Freeport is a very hostile place, under constant attack from [orcs], wild beasts, and even the undead. To help keep this city and its citizens relatively safe, we must help the Militia protect the main gates. Bring me two Deathfist pawn scalps from those vile [Deathfist orcs], a snake fang, and some bone chips from a skeleton. Good luck, $name, represent us well!");
		}
	elsif($text=~/yellow sash of order/i) 
		{
		quest::say("To earn the yellow sash, you must prove yourself to be very skilled in the art of fighting. The lands to the west and south of Freeport are filled with dangerous beasts that often prey upon innocent travelers. Help protect our merchant caravans and traveling citizens, while at the same time practicing your defensive skills, and eliminating these deadly creatures from the surrounding landscape. Bring me a giant snake rattle, a Deathfist slashed belt, the chitin of a desert tarantula, and turn in your white training sash, and I shall reward your noble work with our yellow Sash of Order. Good luck, $name !");
		}
	}

sub EVENT_ITEM 
	{
	$ashenorderfaction=$client->GetModCharacterFactionLevel(361);
	if($ashenorderfaction > 150 && plugin::check_handin(\%itemcount, 13794=> 2, 13067 => 1, 13073 =>1)) 
		{
		quest::say("Good work, $name , you've worked hard and proven yourself a valuable addition to the Ashen Order. Here's your white sash, wear it with pride.");
		# White Training Sash ID-10130
		quest::summonitem("10130");
		quest::exp("200");
		quest::ding();
		#Factions verified on ZAM
		# Faction Ashen Order ID-12
		quest::faction(361,"25");
		# Faction Knights of Truth ID-184
		quest::faction(281,"3");
		# Faction Silent Fist Clan ID-300
		quest::faction(309,"1");
		}
	# White Training Sash ID-10130 - Giant Snake Rattle ID-13058 - Deathfist Slashed Belt ID-13916 - Desert Tarantula Chitin ID-20901
	# No need to check faction again since they must have the White Training Sash
	elsif($ashenorderfaction > 150 && plugin::check_handin(\%itemcount, 10130=> 1, 13058 => 1, 13916 => 1, 20901 => 1)) 
		{
		quest::say("'Ah, well done, $name. You have proven that you are a very skillful fighter and it is a honor to have you as a member of the Ashen Order. On behalf of Master Closk, and under the watchful eyes of Quellious, I present you, $name, with this, the yellow Sash of Order. Go out and make us proud.");
		quest::ding();
		# Yellow Sash of Order ID-10131
		quest::summonitem("10131");
		quest::exp("400");
		#Factions verified on ZAM
		# Faction Ashen Order ID-12
		quest::faction(361,"50");
		# Faction Knights of Truth ID-184
		quest::faction(281,"7");
		# Faction Silent Fist Clan ID-300
		quest::faction(309,"2");
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Monk');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:freportw  ID:9065 -- Velan_Torresk

