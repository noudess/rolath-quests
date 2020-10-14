sub EVENT_SAY
{
if ($text=~/hail/i)
	{
	quest::say("Hail, $name! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
	}
if ($text=~/What danger/i)
	{
	quest::say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");
	}
}

sub EVENT_ITEM 
{
if(plugin::check_handin(\%itemcount, 18733 => 1)) #Hand in Warrior Recuitment Letter
	{
	quest::say("Greetings $name! Welcome to the Guardians of the Vale.  I'm Roglio Bruth, and I run this proud little outfit.  You seem to be of hearty stock; let's put you to work.  Here's your guild tunic - hope it fits.  Start your training right away. Once you are ready to begin please make sure that you see Dalorio Blistbobble, he can assist you in developing your hunting and gathering skills."); 
	quest::summonitem(13540); #Old Tan Tunic
	#Factions verified on Live
	quest::faction(263, 1); #Guardians of the Vale faction
	quest::faction(286, 1); #Mayor Gubbin faction
	quest::faction(355, 1); #Storm Reapers faction
	quest::faction(292, 1); #Merchants of Rivervale faction
	quest::exp(100);
	quest::ding();
	}
elsif(plugin::check_handin(\%itemcount, 13931 => 4)) #Hand in Runnyeye Warbeads
	{
	quest::say("Good work, Deputy $name! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
	quest::summonitem(13023); #Bixie Berry Buns
	quest::summonitem(13024); #Tanglefoot Tingle Drink
	#Factions verified on Live
	quest::faction(263, 5); #Guardians of the Vale faction
	quest::faction(286, 1); #Mayor Gubbin faction
	quest::faction(355, 1); #Storm Reapers faction
	quest::faction(292, 1); #Merchants of Rivervale faction
	quest::faction(334, -1); #Dreadguard Outer faction
	quest::exp(6400);
	quest::ding();
	quest::givecash(0,8,0,0);
	} 
else 
	{
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
	}
}

#End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
