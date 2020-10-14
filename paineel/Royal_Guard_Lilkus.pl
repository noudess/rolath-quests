#########################################################################
# ZONE: Paineel (paineel)
# DATABASE:  PEQ-YKESHA-beta1
# LAST EDIT DATE: November 8, 2007
# VERSION: 1.1
# DEVELOPER: Diuretic Effluent (Original Source Unknown but Not Me)
# REVISION NOTES: Fixed gross punctuation errors copied from Allakhazam.
#                 Fixed wrong factions. Added XP award to emulate live.
#
# *** NPC INFORMATION ***
#
# NAME: Royal_Guard_Lilkus
# ID: 75074
# RACE: 3
# CLASS: 1
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Kobold Molar ID-1761
#
# *** QUESTS INVOLVED IN ***
#
# Kobold Molars (evil)
#



sub EVENT_SAY 
	{
	if ($text=~/Hail/i)
		{
		quest::say("You tread upon sacred ground, $race. None may go further unless they [have business with the Overlord], or, if you're looking to gain favor with the heretics and need a little coin, I have a [job] for you.");
		}
	elsif ($text=~/business/i) # Need to see if faction plays in here.
		{
		quest::say("The Overlord only sees those he calls forward. If you have a summons from him, I will escort you and announce your arrival. If not, then forget whatever business you may have had here. If you wish an audience, then go speak to Sheltian below. He may be able to help you.....if you help him.");
		}
	elsif ($faction > 6)
		{
		quest::say("Royal Guard Lilkus says 'I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		}
	elsif ($text=~/job/i)
		{
		quest::say("There are many campaigns we administer from within our city, Paineel. Some of these campaigns are threatened or hindered by annoyances. One of these annoyances are the kobolds that live in the filth of a cave not far from here. Find that lair and kill as many of these beasts as you can. For every kobold molar you return, you shall be rewarded."); 
		}
	 }

sub EVENT_ITEM 
	{
	if ($faction <= 6 && $itemcount{1761} >=1)
		{
		plugin::mass_handin(1761, 1, \&MolarReward);
		quest::say("Not bad, $name. Here is your reward. If you slay enough of these dogs, Sheltuin may have a more important task for you to perform.");
		}
	plugin::return_items(\%itemcount);
	}

sub MolarReward
	{
	my $random_result = int(rand(7));
	if($random_result==1) 
		{
		quest::summonitem(plugin::RandomRange(3101, 3112));
		}
	# Made XP match other molar quest
	quest::exp(200);                 # Experience
	quest::ding();
	quest::givecash("8","2","0","0"); # Cash
	#Factions verified on Live
	quest::faction(231,"-7");        # Craftkeepers
	quest::faction(233,"-7");        # Crimson Hands
	quest::faction(265,"7");        # Heretics
	quest::faction(242,"-7");        # Deepwater Knights
	quest::faction(254,"-7");       # Gate Callers
	}


#END of FILE Zone:paineel  ID:75074 -- Royal_Guard_Lilkus
