sub EVENT_SAY 
	{
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i) 
		{
		quest::say("I am Romar Sunto, servant of Solusek Ro. I am searching for the [Coin] of the mighty enchanter [Tash] - if you are interested in helping me acquire it, I will [reward] you with a powerful spell. I am also dispenser of [Darkwood Staves] - sometimes also called the Staff of Ro.");
		}
	elsif($text=~/darkwood staves/i) 
		{
		quest::say("Bring me a Lambent Stone from a Hill Gant, a Sand Giant or a Griffon and I will give you a Darkwood Staff.");
		}
	elsif($text=~/tash/i) 
		{
		quest::say("Tash was a mighty enchanter and a master jewelcrafter.");
		}
	elsif($text=~/coin pouch/i) 
		{
		quest::say("I will gladly lend you this coin pouch - put all 10 antique silver coins into it and combine them into the Coin of Tash.");
		quest::summonitem(17511); # A coin pouch - to combine the coins in
		}
	elsif($text=~/coin/i) 
		{
		quest::say("Tash had a collection of ten antique silver coins that were left in different cities around the world. If you were to collect all 10 coins, I would give you a [coin pouch] that would let you combine them into the master Coin of Tash. If you are interested I will sell you a copy of the Tome of Tash, detailing where the coins were reportedly left, for a mere 50 gold.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		# Darkwood Staff
		if($itemcount{10000} == 1) 
			{
			quest::say("A stone for a staff - very well.");
			quest::summonitem(6048);
			# Faction verified via live research
			quest::faction(415,"1");
			quest::faction(416,"-1");
			quest::exp(1000);
			quest::ding();
			}

		if($itemcount{10793} == 1) 
			{
			quest::say("The Coin of Tash - fully enchanted! I am in your debt. Here is the scroll of Tashania that was promised to you.");
			quest::summonitem(15678);
			quest::exp(1000);
			quest::ding();
			}

		if($itemcount{10790} == 1) 
			{
			quest::say("The Coin of Tash. It is of no use to me like this. You must take the coin to Tarn Visilin in High Keep to get it enchanted.");
			quest::summonitem(10790);
			}

		if($gold >= 50) 
			{
			quest::summonitem(18032);
			quest::say("Once you combine the coins within the pouch, you must take the Coin of Tash to Tarn Vislin in the HighKeep library to get it enchanted. Give him the coin and he will enchant it for you");
			#Faction from ZAM
			quest::faction(415,1);
			quest::faction(416,-1);
			}
		}
	}
