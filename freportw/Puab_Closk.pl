
sub EVENT_SPAWN 
	{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}

sub EVENT_ENTER 
	{
	if ($ulevel == 1) 
		{
		quest::echo(15, "As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am Puab Closk. If you wish to learn the ways of the Ashen Order, read the note in your inventory and hand it to me to begin your training.'");
		}
	}

sub EVENT_SAY
	{
	$ashenorderfaction=$client->GetModCharacterFactionLevel(361);

	if($text=~/Hail/i)
		{
		quest::say("Greetings. I am Puab Closk, Master of the Ashen Order.  Our home is your home, friend. Feel free to stay as long as you like.  Learn our ways as many have done in the past.  To fight like the tiger and strike like the cobra are your goals.");
		}

	if($text=~/treant fists/i)
		{
		quest::say("You desire the treant fists?  I have them and I will offer them to any [skilled monk of the Ashen House].");
		}

	if ($faction > 4)
		{
		plugin::reject_say();
		}
	elsif ($ashenorderfaction < 151)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/skilled monk of the Ashen House/i)
		{
		quest::say("Then you shall aid our family. My former pupil [Clawfist] has been banished by his people. You will go to him and hand him this token as proof of your origin. He shall be expecting you.");
		# Puab's Token ID-12369
		quest::summonitem("12369");
		}
	elsif($text=~/Clawfist/i)
		{
		quest::say("Clawfist is a Kerran, a catman. He braved the dangers of Norrath to reach the Ashen Order. He sought knowledge of our disiples. He learned well.");
		}
	elsif($text=~/Where is Clawfist/i)
		{
		quest::say("Clawfist has been banished by the Kerrans of Odus. Where they have sent him I am unsure");
		}
	}

sub EVENT_ITEM
	{
	$ashenorderfaction=$client->GetModCharacterFactionLevel(361);

	# A tattered note ID-18746
	if (plugin::check_handin(\%itemcount, 18746 => 1))
		{
		quest::say("Welcome to the house of the Ashen Order. We are a small guild of monks who have devoted our lives to refining our minds, souls, and physical beings to their maximum potential. Please see Brother Torresk as soon as you get a chance. He is in charge of helping our newer members begin their training. Good luck, $name. Brother Jysun can also get you started with some armor.");
		# Torn Cloth Tunic ID-13507
		quest::summonitem("13507");
		# Factions Verified
		quest::faction(361,100); #Ashen Order
		quest::faction(281,15); #Knights of Truth
		quest::faction(309,5); #Silent Fist Clan
		quest::exp("100");
		quest::ding();
		}
	# Tattered Parchment ID-28055
	elsif ($ashenorderfaction > 150 && plugin::check_handin(\%itemcount, 28055 => 1))
		{
		quest::ding();
		quest::say("You have performed a great service to one who is your brother. Your loyalty shines brightly, as does your skill. Take the treant fists. They are yours now.");
		# Treant Fists ID-12344
		quest::summonitem("12344");
		quest::exp("100");
		# Factions Verified
		quest::faction(361,20);
		quest::faction(281,3);
		quest::faction(309,1);
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Monk');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:freportw  ID:9086 -- Puab_Closk


