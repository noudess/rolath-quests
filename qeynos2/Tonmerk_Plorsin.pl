#Tonmerk_Plorsin.pl
#Cure Disease, Cure Poison, Heal Yourself, Errand for Tonmerk

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello. child.  Welcome to the Temple of Life. Here. you may pay homage to the [Prime Healer]. [Rodcet Nife].  If you are in need of [healing] or require me to [cure disease] or [cure poison]. please inform me.  I am the resident healer of all Qeynos citizens.");
	}
	
	if($text=~/cure disease/i) {
		quest::say("Yes. we can do that.  First. you must fetch me some bandages and brew me some bog juice.  I.. err.. require the bog juice to.. to dampen the bandages.. Yes that's it!  To dampen the bandages.");
	}
  
	if($text=~/cure poison/i) {
		quest::say("To cast the poison from your body I require one snake fang.  The fang will contain a hint of poison which will help me focus my casting.");
	}
	
	if ($text=~/healing/i) {
		quest::say("You must pay a tribute of five gold coins before I perform the binding of your wounds.");
	}
	
	if($text=~/prime healer/i) {
		quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	}

	if($text=~/academy of arcane science/i) {
		quest::say("The Academy of Arcane Science is the greatest school of magic in Antonica.  It houses a wealth of resources and knowledge pertaining to any of the circles of magic.  It is also a marvel of magical engineering.  If you should ever visit Freeport. be sure to let me know.  I seek a faithful cleric to [pickup a reagent].");
	}
	
	if($text=~/pickup a reagent/i) 
		{
		if ($faction >=6 ) # Tested at app - dubious worse messgage?
			{
			quest::say("Your mere presence disgusts me.  Please remove yourself from my sight.  Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
			}
		elsif ($faction == 5)
			{
			quest::say("The Temple of Like smiles upon you, friend... but such a delicate matter can only be entrusted to our most loyal members.");
			}
		else
			{
			quest::say("Please deliver this potion to Serna Tasknon in The Academy of Arcane Science, she will know what it is that I require.");
			quest::summonitem(13983);#Inert Potion
			}
	}
	
	if($text=~/rodcet nife/i) {
		quest::say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	}
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 12125 => 1)) {#Shark Powder
		quest::say("I thank you, my good friend.  Surely the road to Freeport was not easily trod.  Please take this as compensation for your costs and I also grant you the ability to call forth the power of Rodcet Nife to smite the enemy.  Go forth and defend life.");
		# Faction verified on live.
		quest::faction(219, 3);#Antonius Bayle
		quest::faction(262, 10);#Guards of Qeynos
		quest::faction(280, 6);#Knights of Thunder
		quest::faction(341, 20);#Priests of Life
		quest::faction(221, -5);#Bloodsabers
		quest::exp(100);
		quest::ding();
		quest::summonitem(quest::ChooseRandom(15016,26962,15048, 15225));
	}
	
	elsif(plugin::check_handin(\%itemcount, 16581 => 1, 13009 => 1)) {#Bog Juice, Bandages
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		$npc->CastSpell(96, $userid);
	}
	
	elsif(plugin::check_handin(\%itemcount, 13067 => 1)) {#Snake fang
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		$npc->CastSpell(213, $userid);
	}
	
	elsif($gold + ($silver/10) + ($copper/100) >= 5) {
		quest::say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		$npc->CastSpell(17, $userid);
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:qeynos2  ID:2081 -- Tonmerk_Plorsin
