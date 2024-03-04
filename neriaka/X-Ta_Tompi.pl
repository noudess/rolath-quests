#############
#Quest Name: Necromancer Words - X`Ta Tompi
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 16 = (12 quest turn in items, 4 rewards)
#################
sub EVENT_SAY { 

if($faction > 6) {
	plugin::reject_say();
	return;
}

if($text=~/hail/i){
quest::say("We three are the [Sisters Dark] - [Necromancy] is our Art - Bonded dead, they serve our will - No beat of heart, yet faithful still.");
}

if($text=~/sisters dark/i){
quest::say("We three are the Sisters Dark - Keepers of the shadowed Dread - [Lore of Death]. we research now - Join with us and serve [the Dead].");
}

if($text=~/lore of death/i){
quest::say("The Lore of Death is shadow bound - Its [words] are [hid]. yet shall be found - Through our research into the dark - Old hexes found and parchment marked.");
}

if($text=~/the dead/i){
quest::say("The Dead are the shadowknights and necromancers of Neriak. They were formed by Queen Cristanos herself. Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate. I have heard they take orders only from the queen.");
}

if($text=~/necromancy/i){
quest::say("Necromancy - Art of the Dead - Binding bones to serve your will - We research now the [Lore of Death] - Ancient spells with power still."); 
}
if($text=~/hid/i){
quest::say("The Words are hid in tomes of old - Their yielded lore worth more than gold - Though we search both 'fore and 'hind - [Components] we can not yet find."); 
}
if($text=~/components/i){
quest::say("We need components for research - These are things that you could find - In return for [tasks] that you perform - Words of [reward] we have in mind."); 
}
if($text=~/tasks/i){
quest::say("Bring us components for our research - We give [Word]s by tasks performed - [Possession], [Detachment], [Allure], [Haunting], [Rupturing], [Dark Paths], [Suffering], [Collection], [Obligation], [Requisition] and [Acquisition]."); 
}
#same as 'tasks'
if($text=~/reward/i){
quest::say("Bring us components for our research - We give [Word]s by tasks performed - [Possession], [Detachment], [Allure], [Haunting], [Rupturing], [Dark Paths], [Suffering], [Collection], [Obligation], [Requisition] and [Acquisition]."); 
}
if($text=~/allure/i){
quest::say("From the Estate of Unrest, bring a Charred Pearl - From Castle Mistmoore, a wand charred - From a merchant bring a stone of blood and a ruby - Words of Allure will be your reward."); 
}
if($text=~/dark paths/i){
quest::say("From the Estate of Unrest, bring an globe of darkness - From Guk, an Eye of Urd - From a merchant bring a Star Rose Quartz - Then Words of Dark Paths will to you be given."); 
}
if($text=~/acquisition/i){
quest::say("From the Plane of Fear, bring Fetid Skin, Scare Straw and a Turmoil Wart - From a merchant bring a pearl - Then Words of Acquisition will to you be given."); 
}
if($text=~/obligation/i){
quest::say("From Guk, bring an Eye of Jin - From spectres, bring a Globe of Fear - From a merchant bring a jade stone - Then Words of Obligation will to you be given."); 
}
if($text=~/possession/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/detachment/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/rupturing/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/haunting/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/suffering/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/collection/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
if($text=~/requisition/i){
quest::say("The answer to that question is held by another - Ask again of my sister..."); 
}
}

sub EVENT_ITEM 
	{
	if($faction > 6)
		{
		quest::say("Perhaps I would trust you with the reward if you would but prove yourself further");
		}

	#Words of Possession
	#Words of Allure
	#Requires: 1 Charred Pearl, 1 Ruby, 1 A Wand (Charred Wood Wand?), 1 Bloodstone 
	elsif($faction > 5)
		{
		quest::say("Perhaps I would trust you with the reward if you would but prove yourself further");
		}

	elsif(plugin::check_handin(\%itemcount, 10083 => 1, 10035 => 1, 14160 => 1, 10019 => 1))
		{
		quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		quest::summonitem(11829);
        # Factions verified on ZAM
        quest::faction(239,10); #The Dead
        quest::faction(303,1); #Queen Cristanos Thex
        quest::faction(278,-1); #King Naythox Thex
        quest::faction(275,-1); #Keepers of the Art
        quest::faction(245,-1); #Eldritch Collective
		quest::exp(62000);
		quest::ding();
		}

	#Words of Dark Paths
	#Requires: 1 Sphere of Unrest, 1 Eye of Urd, 1 Star Rose Quartz 
	elsif(plugin::check_handin(\%itemcount, 10520 => 1, 10523 => 1, 10021 => 1))
		{
		quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		quest::summonitem(11850);
        # Factions verified on ZAM
        quest::faction(239,10); #The Dead
        quest::faction(303,1); #Queen Cristanos Thex
        quest::faction(278,-1); #King Naythox Thex
        quest::faction(275,-1); #Keepers of the Art
        quest::faction(245,-1); #Eldritch Collective
		quest::exp(62000);
		#Approx half a blue at level 31
		quest::exp(62000);
		quest::ding();
		}

	#Words of Acquisition (Beza)
	#Requires: 1 Fetid Skin, 1 Scare Straw, 1 Turmoil Warts, 1 Pearl 
	elsif(plugin::check_handin(\%itemcount, 13150 => 1, 13152 => 1, 8331 => 1, 10024 => 1))
		{
		quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		quest::summonitem(11866);
        # Factions verified on ZAM
        quest::faction(239,10); #The Dead
        quest::faction(303,1); #Queen Cristanos Thex
        quest::faction(278,-1); #King Naythox Thex
        quest::faction(275,-1); #Keepers of the Art
        quest::faction(245,-1); #Eldritch Collective
		quest::exp(62000);
		#Approx half a blue at level 31
		quest::exp(62000);
		quest::ding();
		}

	#Words of Obligation
	#Requires: 1 Globe of Fear, 1 Eye of Jin, 1 Jade 
	elsif(plugin::check_handin(\%itemcount, 10521 => 1, 10525 => 1, 10023 => 1))
		{
		quest::say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		quest::summonitem(11863);
        # Factions verified on ZAM
        quest::faction(239,10); #The Dead
        quest::faction(303,1); #Queen Cristanos Thex
        quest::faction(278,-1); #King Naythox Thex
        quest::faction(275,-1); #Keepers of the Art
        quest::faction(245,-1); #Eldritch Collective
		quest::exp(62000);
		#Approx half a blue at level 31
		quest::exp(62000);
		quest::ding();
		}

	#do all other handins first with plugin
	plugin::return_items(\%itemcount);
	quest::say("Thanks, but I do not need this...");
	}

#END of FILE Zone:neriaka -- X`Ta_Tompi
