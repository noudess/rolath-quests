# nesiff's statue #

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hail, $name. I am Vesteri Namanoi. I provide training to the Jaggedpine Treefolk and their allies. If you are not busy, I would like to ask a small [favor] of you.");
		}

	if ($text=~/favor/i) 
		{
		if ($faction <= 4)
			{
			quest::say("I need you to take this claim check to Qeynos for me. Nesiff Talaherd is a woodcarver who owns a shop in South Qeynos. I am having him carve a small statue of Tunare for Te'Anara. With my training schedule, I can not make the journey to Qeynos. Please give this claim check to Nesiff and bring the statue to me. It is a surprise, so please do not say anything to Te'Anara about it.");
			quest::summonitem(18012);
			}
		elsif ($faction <= 5)
			{
			quest::say("We, the Jaggedpine Treefolk, appreciate the help you've given us in the past. But, we must trust you more before allowing you to handle such important matters.");
			}
		else
			{
			quest::say("You are an enemy of the Jaggedpine Treefolk, this forest, and the residents of it. Begone, before I am forced to take drastic measures!");
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($faction <= 4 && plugin::check_handin(\%itemcount, 13864 => 1)) 
		{
		quest::say("Oh thank you so much! Here. Take this reward for your time. I will also tell Te'Anara of you.");
		quest::exp(250);
		quest::ding();
		# Faction verified on Zam
		quest::givecash(10,2,0,0);
		quest::faction(272,5); #jaggedpine treefolk
		quest::faction(302,1); #protectors of pine
		quest::faction(343,1); #qrg protected animals
		quest::faction(324,-1); #unkempt druids
		quest::faction(262,1); #guards of qeynos
		}
	else 
		{
		plugin::return_items(\%itemcount);
		}
	}

# EOF zone: qrg ID: 3038 NPC: Vesteri_Nomanoi

