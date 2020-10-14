sub EVENT_SAY 
	{ 
	$won = $client->GetModCharacterFactionLevel(320);
	if($text=~/Hail/i)
		{
		quest::say("Hail, $name! Have ye come to train?  I train all warriors. All Wolves o' the North must be strong warriors and swift as well. Are ye a young wolf, then? If so, maybe ye can [assist Renth] with his wee problem, eh?");
		}
	elsif($faction > 5) 
		{
		quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		}
	elsif($won > 299) 
		{
		if($text=~/dangerous matter/i)
			{
			quest::say("A murder was done in Halas recently.  A couple were killed by a pair o' rogues fer a mere pouch o' copper.  The shaman gave chase and the main rogue, Paglan, fell beneath an ice floe.  One got away.  We must [hunt the murderer].  Will ye help?"); 
			}
		if($text=~/hunt the murderer/i)
			{
			quest::say("Twas good old Dok whose brother and wife were slain.  Speak with him at his shop.  Ask him if he has [any information about the crime].  Return the head of the murderer and I'll give ye a [Langseax]."); 
			}
		if($text=~/langseax/i)
			{
			quest::say("The Langseax was crafted to be wielded by a warrior only.  Tis a one-handed slashing weapon with great balance to assist the warrior who masters it."); 
			}
		}
	if($faction < 5) 
		{
		if($text=~/assist/i) 
			{
			quest::say("I was ordered by Kylan O'Danos to personally escort a young warrior sent to fetch the remains of his cousin, Ivan McMannus. I forgot and spent me greater time testing out the fine spirits. Now I must find the courier and the remains. Will ye [search fer the courier]?");
			}
		if($text=~/search fer the courier/i)
			{
			quest::say("Thank ye, $name! Go to Everfrost Peaks and seek out Arnis McLish. Ask him where Megan, the courier, is. Once ye find Megan, would ye ask her where Ivan's remains are? Please go, at once!");
			}
		}

	if($won < 299)
		{
		if ($faction <= 5) 
			{
			if(($text=~/dangerous matter/i) ||  ($text=~/hunt the murderer/i) || ($text=~/langseax/i)) 
				{
				quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
				}
			}
		if ($faction == 5) 
			{
			if(($text=~/assist/i) ||  ($text=~/courier/i)) 
				{
				quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
				}
			}
		}
	}

sub EVENT_ITEM 
	{
	$won = $client->GetModCharacterFactionLevel(320);
	if ($won > 299)
		{
		if(plugin::check_handin(\%itemcount, 12227 => 1)) 
			{
			quest::say("Nice work $name! Basil has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax for your efforts.");
			quest::ding();
			#shows neg faction hit on live.   possibly to avoid exploits
			quest::faction(320, 10); #Wolves of the North  
			quest::faction(327, 2); #Shamen of Justice
			quest::faction(328, 2); #Merchants of Justice
			quest::faction(311, 1); #Steel Warriors
			quest::exp(10000);
			quest::ding();
			quest::summonitem(5367);
			} 
		elsif(plugin::check_handin(\%itemcount, 12225 => 1)) 
			{
			quest::say("Nice work $name! Paglan has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax of the Wolves for your efforts.");
			quest::faction(320, 10); #Wolves of the North  
			quest::faction(327, 2); #Shamen of Justice
			quest::faction(328, 2); #Merchants of Justice
			quest::faction(311, 1); #Steel Warriors
			quest::exp(12000);
			quest::ding();
			quest::summonitem(5368);
			} 
		}
	if ($faction < 5) #Needs aimable, but not high aimable
		{
		if (plugin::check_handin(\%itemcount, 13246 => 1)) 
			{
			quest::say("Good work!! Kylan will never know o' me negligence. I owe ye one, young warrior. Let's call it even with this. Twas found by one of our foraging parties. It is still useful. And... I believe ye can assist with a more [dangerous matter] as well");
			quest::ding();
			quest::summonitem(quest::ChooseRandom(17009, 17001, 5014, 5022, 5020, 5016, 6015, 5024, 5019, 6011, 6016, 7008, 5021, 5015, 5013, 7010, 6013, 5023, 6014));
			quest::faction(320, 20); #Wolves of the North  
			quest::faction(327, 4); #Shamen of Justice
			quest::faction(328, 5); #Merchants of Justice
			quest::faction(311, 1); #Steel Warriors
			quest::exp(2000);
			quest::ding();
			}
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);			
	}

