###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Shamus Felligan
## ID: 29070
## ZONE: halas
##
############################################


sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetin's! Justice speaks through us. We're the followers o' the Tribunal. We act as judge. jury and executioner fer all misled Northmen. Sometimes we must also execute our swift justice upon evil races. such as th' [ice goblins].");
		}
	elsif($text=~/ice goblins/i)
		{
		quest::say("The ice goblins are a weak race. They pose no threat to our community. but lately we've heard rumors of ice goblins that can cast spells. They're said to be as weak as the goblin warriors. so I seek to employ the talents of our young shamans to [hunt the goblin casters].");
		}
	elsif ($faction > 5) #Verified
		{
		quest::say("The scales o' the Shamans o' Justice dinnae tip in yer favor.  Ye'd best flee while ye still have the chance.");
		}
	elsif ($faction > 4)
		{
		quest::say("Ye're no criminal to the Shamans o' Justice, but ye're yet to prove yer devotion to justice.");
		}
	elsif($text=~/i will hunt the goblin casters/i)
		{
		quest::say("Aye. ye'll serve justice.  I must find the source o' their recent spellcasting ability.  I hear reports o' glowing necklaces upon these wicked beasts' necks. Get me one o' these casters' necklaces. Return them in any condition at all. Go! Justice awaits yer return."); 
		}
	}

sub EVENT_ITEM
	{
	if($faction < 5 && plugin::check_handin(\%itemcount, 13968 => 1)) #Shattered Caster Beads
		{
		quest::say("Shattered! This has happened frequently! These beads are very delicate. They're useless to me now, however, I'll reward ye fer the execution of yet more goblin casters. Continue yer work. The Tribunal watches ye!");
		quest::exp(800);
		quest::ding();
		# Verified on live
		quest::faction(328,1); #Merchants of Halas
		quest::faction(327,10); #Shamen of Justice
		quest::faction(223,-1); #Circle of Unseen Hands
		quest::faction(336,-1); #Coalition of Tradefolk Underground
		quest::faction(244,-2); #Hall of the Ebon Mask
		$randomspell = quest::ChooseRandom(15270,15275,15075,15271,15279,15212,15079, 15036, 15269, 15211);
		# : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : Gate : Feet Like Cat : Summon Drink : In that order
		if($class eq "Shaman" || $class eq "Beastlord")
			{
			quest::summonitem($randomspell,1); #A Random Spell Listed Above
			}
		}
	if($faction < 5 && plugin::check_handin(\%itemcount, 13969 => 1)) #Caster Beads
		{
		quest::say("Finally! Intact! This IS good news! I can continue me investigation now. As fer yer loyal deed, I'll offer ye this, the Gavel of Justice. May ye employ it well in the service o' justice.");
		quest::exp(2000);
		quest::ding();
		quest::faction(328,3); #Merchants of Halas
		quest::faction(327,25); #Shamen of Justice
		quest::faction(223,-3); #Circle of Unseen Hands
		quest::faction(336,-3); #Coalition of Tradefolk Underground
		quest::faction(244,-5); #Hall of the Ebon Mask
		if($class eq "Shaman" || $class eq "Beastlord")
			{
			quest::summonitem(6028); #Gavel of Justice
			}
		}
	plugin::return_items(\%itemcount); 
	}

#EoF
