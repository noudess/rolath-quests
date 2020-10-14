sub EVENT_SAY 
	{
	if($text =~ /Hail/i) 
		{
		quest::say("May [Karana] guide you. Are you a [citizen of Qeynos] or a [visitor]?");
		}

	if($text =~ /citizen of Qeynos/i) 
		{
		quest::say("Then I would urge you to attend daily services in the Temple of Thunder.  You are a [member of Thunder], are you not?  Or maybe I am mistaken and you are just [lost].");
		}

	if($text =~ /visitor/i) 
		{
		quest::say("Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is");
		}

	if($text =~ /lost/i) 
		{
		quest::say("Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is.");
		}

	if ($text=~/member of thunder/i) 
		{
		if ($faction > 6) 
			{
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat.");
			}
		elsif ($faction < 5) 
			{
			quest::say("I welcome you. Karana cares for all of His flock. He bestows a touch of His power upon the souls of the Clerics and Paladins of our temple. We look after His flock. Speaking of which, I require the assistance of a young paladin to [deliver provisions to needy members].");
			}
		else
			{
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
			}
		}

	if($text =~ /bandit/i) 
		{
		quest::say("In the Plains of Karana can be found the Karana bandits.  They plague our followers and dare to use the name of the Rainkeeper as title.  For this, Karana commands their deaths.  I have a bounty for every returned Bandit Sash, collectible by members only.  For clerics, Gehna has a bounty on Binder Spectacles.");
		}
	elsif($text =~/Karana/i)
		{
		quest::say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
		}

	if($text =~ /Cheslin/i) 
		{
		quest::say("My son, Cheslin, is currently in training to be a Qeynos Guard.  I fear it was not his calling.  He is not quite in our realm of reality.  He spent too many years of playing games of warriors and dragons.  He will be doing his first patrols in Qeynos Hills this week.  If you are near there, I would appreciate it if you would watch and see him safely through his first patrols, I fear for his safety from the [karana bandits].  Tell him I sent you.");
		}

	if ($text=~/deliver provisions to needy members/i) 
		{
		if ($faction < 5) 
			{
			quest::say("Good show!! Here you are, young knight. Take these blankets to any resident who desires warmth. Ask them if they are followers of Karana, then ask if they require temple blankets. Be careful, the plains are quite dangerous for a young knight.");
			quest::summonitem(12102);
			}
		else
			{
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
			}
		}
	}

sub EVENT_ITEM 
	{

	# Works at aprehensive.
	if(defined($itemcount{12100}) && $itemcount{12100} >= 1) #Bandit Sash
		{
		quest::say("Good work $class. The Karana Bandits have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
		plugin::mass_handin(12100, 1, \&SashReward);
		}
	elsif (plugin::check_handin(\%itemcount, "18839" => 1)) #Sealed Letter
		{
		quest::say("Hmmph!! My son is living in a fantasy world. Still, you have done well. Take this as a token of appreciation. It is not much, but it may come in handy.");

		## Backpack, Cast-Iron Warhammer, Raw-hide Gorget, Small Raw-hide Mask, Buckler
		quest::summonitem(quest::ChooseRandom(17005, 6041, 2139, 2150, 9001)); 
		#faction and exp verified on live
		quest::faction(280, 10);    # Knights of Thunder
		quest::faction(221, -10);   	# Bloodsabers
		quest::faction(341, 7);     # Priests of Life
		quest::faction(262, 7);     # Guards of Qeynos
		quest::exp(5278);
		quest::ding();
		}
	else
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		plugin::return_items(\%itemcount);
		}
	}

sub SashReward
	{
	quest::exp(1847);
	# Exp verified on live
	quest::ding();
	#random bronze item reward/verified on live
	quest::summonitem(quest::ChooseRandom(4201,4202,4203,4204,4205,4206,4207,4208,4209,4209,4210, 4211,4212,6019,6021,6022,6025,9001,9002,9003,9004,9006,9007));
	# 1 platinum, 1 gold, 2 silver/verified on live for 1pp, 1 gp, 1-3 sp
	quest::givecash("0","2","1","1"); 
	# Faction verified on allas/live
	quest::faction(280,"20"); # Knights of Thunder
	quest::faction(221,"-20"); # Blood Sabers
	quest::faction(341,"15"); # Priests of Life
	quest::faction(262,"15"); # Guards of Qeynos
	}
