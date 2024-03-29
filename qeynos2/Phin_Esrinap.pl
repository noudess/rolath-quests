############################################
# ZONE: North Qeynos (qeynos2)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: May 6, 2010
# VERSION: 1.1
# DEVELOPER: MWMDRAGON, Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Phin_Esrinap
# ID: 2771
# TYPE: Monk Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Gnoll Pup Scalp ID-13789
# White Headband ID-10110
# Putrid Rib Bone ID-13722
# Yellow Headband ID-10111
# Blackburrow Gnoll Pelt ID-13027
# Blackburrow Gnoll Skin ID-13028
# Orange Headband ID-10112
# Message to Konem ID-18921
# Grathin's Invoice ID-18922
# Flask of Water ID-13006
#
# *** QUESTS INVOLVED IN ***
#
# White Headband
# Yellow Headband
# Orange Headband
# Note for Konem
#
# *** QUESTS AVAILABLE TO ***
#
# Headbands - Anyone with Kindly or better faction
# Konem - Anyone not KOS
#
############################################

sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("Hello, my name is Phin. Practice, practice, practice.. That's my motto. It is my responsibility to train our members, and help them to advance their skills and abilities. I also reward our members with colored [Headbands] for completing certain tasks.");
		}
	elsif($text=~/Headbands/i) 
		{
		quest::say("Yes, I give the [White, Yellow, and Orange Headbands] to our newer members, and Togahn gives out [Red, Purple, and Blue Headbands] to our elder members.");
		}
	elsif($text=~/Tomer Instogle/i) 
		{
		quest::say("Tomer? I think Seta needs someone to go find him... Go ask her.");
		}
	elsif($text=~/Konem/i) 
		{
		quest::say("Ah yes, Konem. I had him run an errand out to Surefall Glade over two days ago, and he still hasn't returned. Knowing Konem, he probably found a nice shady tree to take a nap under. If you happen to pass by him, could you please take him this note? Thanks, $name, and be safe.");
		quest::summonitem("18921");
		}
	elsif($text=~/gnoll/i) 
		{
		quest::say("Those vile creatures are constantly attacking our city.. and often killing innocent citizens. It is our duty to help defend Qeynos from their vicious raids.");
		}
	# Requires Amiable Faction for Headband Quests
	elsif($faction <= 4) 
		{
		if($text=~/white headband/i) 
			{
			quest::say("That is our training headband.. Beginning students can earn this by slaying four [gnoll] pups, and bringing their scalps back to me.");
			}
		if($text=~/yellow headband/i) 
			{
			quest::say("This is awarded to our students for helping clear out the evil that inhabits the old ruins of the Qeynos Hills. Just bring me back three putrid rib bones as proof of your good deeds and turn in your [training headband], and then I will give you the yellow headband.");
			}
		if($text=~/orange headband/i) 
			{
			$sf=$client->GetModCharacterFactionLevel(309);
			if ($sf > 299)
				{
				quest::say("This is a difficult award to obtain. The city of Qeynos is, as you know, under constant attack by the gnolls of Blackburrow. The Silent Fist Clan rewards its members who venture deep into this gnoll stronghold and bring swift justice to these vile creatures. Please return two Blackburrow gnoll pelts - make sure they aren't ruined - and a Blackburrow gnoll skin as proof of your noble actions. Also, turn in your [yellow headband], and then I shall give you the orange one. Good luck.");
				}
			else
				{
				quest::say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
				}
			}
		}
	elsif ($text=~/headband/i) 
		{
		quest::say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
		}
	}

sub EVENT_ITEM 
{
	$sf=$client->GetModCharacterFactionLevel(309);

# White Headband ID-10110 requires four Gnoll Pup Scalp ID-13789 and amiable or better faction
#factions and exp verified on live 9/19/15
	if($faction <= 4 && plugin::check_handin(\%itemcount, 13789 => 4)) 
		{
		quest::ding();
		quest::say("Good job, $name, keep up the good work! Here is your white training headband. Wear it with honor, and make Lu'Sun proud.");
		quest::summonitem("10110");
		# Silent Fist Clan faction
		quest::faction(309,"25");
		# Guards of Qeynos faction
		quest::faction(262,"3");
		# Ashen Order faction
		quest::faction(361,"1");
		quest::exp("145");
		}

# Yellow Headband ID-10111 requires three Putrid Rib Bone ID-13722 and the White Headband ID-10110.  We don't need to check faction again because they must have the White Headband
	elsif(plugin::check_handin(\%itemcount, 13722 => 3) && plugin::check_handin(\%itemcount, 10110 => 1)) 
		{
		quest::ding();
		quest::say("Good work.. and, as promised, here is your reward. It is an honor to present this yellow headband to $name, for recent acts of courage and heroism, on behalf of the Silent Fist Clan.");
		#Factions and exp verified on live.
		quest::summonitem("10111");
		# Silent Fist Clan faction
		quest::faction(309,"50");
		# Guards of Qeynos faction
		quest::faction(262,"7");
		# Ashen Order faction
		quest::faction(361,"2");
		quest::exp("650");
		}

# Orange Headband ID-10112 requires two Blackburrow Gnoll Pelt ID-13027, one Blackburrow Gnoll Skin ID-13028 and the Yellow Headband ID-10111
	elsif($sf > 299 && plugin::check_handin(\%itemcount, 13027 => 2) && plugin::check_handin(\%itemcount, 13028 => 1) && plugin::check_handin(\%itemcount, 10111 => 1)) 
		{
		#Faction verified on live
		quest::ding();
		quest::say("It is an honor to present the orange headband of the Silent Fist Clan to one of our finest members, $name the mighty!");
		quest::summonitem("10112");
		# Silent Fist Clan faction
		quest::faction(309,"50");
		# Guards of Qeynos faction
		quest::faction(262,"7");
		# Ashen Order faction
		quest::faction(361,"2");
		quest::exp("300");
		}
# Note from Konem, Grathins Invoice ID-18922
	elsif(plugin::check_handin(\%itemcount, 18922 => 1)) 
		{
		quest::say("Oh this is not good. Too many inoccent traders have been getting robbed lately by those vile bandits out in the Karanas. Something must be done soon. Anyway, thank you for delivering the message... you did very well, young $name. Here's a little something to quench your thirst from all that running around.");
		quest::summonitem("13006"); #Water Flask
		#Factions verified on live Nov 7, 2015
		# Silent Fist Clan faction
		quest::faction(309,"5");
		# Guards of Qeynos faction
		quest::faction(262,"1");
		# Ashen Order faction
		quest::faction(361,"1");
		quest::exp("100");
		quest::ding();
		}

#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Monk');
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  NPC:Phin_Esrinap 

