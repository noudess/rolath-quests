#!/usr/bin/perl

# START of FILE Zone:kithicor  ID:20095 -- Gandari

sub EVENT_SAY 
	{ 
	if ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Most call me Gandari the Terse.  You here for [ivy armor]?");
		} 
	elsif($text=~/ivy armor/i) 
		{
		quest::say("I reward brave rangers with ivy etched armor - [Helm]s. [Tunic]s. [Sleeves] and [Bracers]. [Interested]?");
		} 
	elsif($text=~/interested/i) 
		{
		if($text=~/bracers/i) 
			{
			quest::say("I do not haggle, I do not bargain. The Bottom of the Rune of Ivy from the plains of Everfrost, a Watery Ring from the Cauldron of Tears and a Fire Emerald to warm my heart. Bring these to me and you shall earn your reward.");
			} 
		elsif($text=~/helm/i) 
			{
			quest::say("I do not haggle, I do not bargain. The Top of the Rune of Ivy from the Castle Mistmoore, a Cyclops Charm from Tarskuk and a Sapphire of Sky Blue. Bring these to me and you shall earn your reward.");
			} 
		elsif($text=~/sleeves/i) 
			{
			quest::say("I do not haggle, I do not bargain. A Heart of Fire from the Caverns of Solusek, the Left side of the Rune of Ivy from the Griffon Grimfeather and two Star Rubies of sparkling hue. Bring these to me and you shall earn your reward.");
			} 
		elsif($text=~/tunic/i) 
			{
			quest::say("I do not haggle, I do not bargain. The Skull of Meldrath, the Right side of the Rune of Ivy from the Thistle Brownie and two Rubies of Fiery Red. Bring these to me and you shall earn your reward.");
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 6)
		{
		if(plugin::check_handin(\%itemcount,10569 => 1,10546 => 1, 10033 => 1)) 
			{ # bracers
			REWARD(3189);
			} 
		if(plugin::check_handin(\%itemcount, 10566 => 1,10570 => 1, 10034 => 1))
			{ # helm
			REWARD(3181);
			} 
		if(plugin::check_handin(\%itemcount, 10548 => 1, 10568=> 1,10032 => 2)) 
			{ # sleeves
			REWARD(3188);
			}
		if(plugin::check_handin(\%itemcount,10571 => 1,10567 => 1,10035 => 2)) 
			{ # tunic
			REWARD(3184);
			} 
		}
	plugin::return_items(\%itemcount);
	}

sub REWARD
	{
	local($piece);
	($piece) = ($_[0]);

	quest::summonitem($piece);
	quest::ding();
	quest::say("Well done. May Karana bless your soul.");
	#Faction verified on Live
	quest::faction(269,+10); # kithicor residence
	quest::faction(302,+1); # protectors of the pine
	quest::faction(272,+1); # jaggedpine treefolk
	quest::faction(324,-1); # unkempt druids
	#Exp was .045% for level 75 Ranger.
	quest::exp(413550);
	}

# END of FILE Zone:kithicor  ID:20095 -- Gandari
