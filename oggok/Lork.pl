sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("You $name. We hear of you. We need help. You [help Crakneks] or you [help self]?");
		}
	elsif($text=~/help self/i) 
		{
		quest::say("You help self to leave Oggok before me bash you. We no need cowards.");
		}
	elsif($faction > 4)
		{
		quest::say("You help Crakneks more. Helps Horgus you must. Den we trusts yoo!");
		}
	elsif($text=~/help crakneks/i) 
		{
		quest::say("Ha!! We hear of great adventurer. You?!! Me no think so. You prove self to Crakneks before you help us. Go to Innoth.. Innotu.. Innooth.. Arghh!! You go to outside Oggok. Find fat alligator bit Lork brother in two. Bring brother, Nork, body back. Then me know you strong.");
		}
	elsif ($text=~/uglan/i) 
		{
		quest::say("Uglan brave warrior of Oggok. He now in Neriak. Work for dark elves. He NO LIKE dark elves!! He work because we make him. He spy for Crakneks.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 5)
		{
		if(plugin::check_handin(\%itemcount, 13356 => 1)) 
			{
			quest::say("Ahhh!! Boohoohoo. Nork!! That you arm. Me will take care of you now. Thank you for killing gator. You must be strong. Now you help Crakneks. We hear.. ohh, poor Nork, we hear trouble begins. Find ogre warrior [Uglan]. Give him this. It broken. He know where you from. Go. Nork.. Poor Nork.");
			#Faction verified on ZAM
			quest::faction(232,10);	#Craknek Warriors
			quest::faction(228,1);	#Clurg
			quest::faction(261,-1);	#Green Blood Knights
			quest::summonitem(13357);
			quest::exp(50);
			quest::ding();
			}
		elsif(plugin::check_handin(\%itemcount, 18840 => 1)) 
			{
			quest::say("What this!! So, dark elves think they can bash ogres. Replace with blue orcs. Dumb Zulort friend with dark elf ambassador in Oggok. We kill him. We kill Crushbone dark elf ambassador also. This slow down plan. We need a hero. Me guess you do. You go. Go bring Lork both Crushbone and Oggok dark elf hearts. Then you be hero.");
			#Faction verified on ZAM
			quest::faction(232,10);	#Craknek Warriors
			quest::faction(228,1);	#Clurg
			quest::faction(261,-1);	#Green Blood Knights
			quest::exp(100);
			quest::ding();
			quest::summonitem(quest::ChooseRandom(5026,5027,5028,5029, 5030,5031,5032,5033,5034,5035,5036,5037,6019,6021,6023,6024,6025));
			}
		elsif(plugin::check_handin(\%itemcount, 13358 => 1, 13227 => 1)) 
			{
			quest::say("That show dark elves who strongest. Me hope you kill many blue orcs. You Craknek Hero now. You take this. It mine. Hero reward. You great ogre now. Smash best.");
			#Faction verified on ZAM
			quest::faction(232,25);	#Craknek Warriors
			quest::faction(228,3);	#Clurg
			quest::faction(261,-3);	#Green Blood Knights
			quest::exp(1000);
			quest::ding();
			quest::summonitem(quest::ChooseRandom(13355,13359));
			}
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:oggok  ID:49040 -- Lork
