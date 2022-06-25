sub EVENT_SPAWN
	{
	$npc->RandomizeFeatures(1, 1);

	# High Elf Parts
	my $roll = plugin::RandomRange(1,100);
	if ($roll <= 6)
		{
		quest::addloot(13415, 1, 1);
		}

	# Elven Blood
	$roll = plugin::RandomRange(1,100);
	if ($roll <= 10)
		{
		quest::addloot(22515, 1, 1);
		}
	}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Slavedrivers are just lackeys for the [taskmaster]. He is the real orc in charge.");
	}
	elsif ($text=~/taskmaster/i) {
		quest::say("The taskmaster?? He is that large orc who runs around with that [brass earring] in his ear.");
	}
	elsif ($text=~/brass earring/i) {
		quest::say("Yeah, a brass earring; He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
	}
}

sub EVENT_ITEM {

	#:: Match one copper
	if ($copper == 1) {
		plugin::takeCopper(1);
		quest::say("What is this!!? Get me key number 21!!");
	}

	#:: Match a 10351 - Brass Earring
	if (plugin::takeItems(10351 =>1)) {
		#:: Match Female High Elf
		quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
		#:: Give a 18902 - Torn Drawing (Csb I.O.U. Hie 2)
		quest::summonitem(18902);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1500);
		#:: Create a timer 'depop' that triggers every 30 seconds
		quest::settimer("depop",30);
	}

	#:: Match a 20021 - Shackle Key 21 or master key
	if (plugin::takeItems(20021 => 1) || plugin::takeItems(27539 => 1)) {
		quest::say("Good work!! I shall be on my way. Farewell my friend!!");
		plugin::DoAnim("wave");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(275, 2); 		#:: + Keepers of the Art
		quest::faction(279, 1); 		#:: + King Tearis Thex
		quest::faction(246, 1); 		#:: + Faydark Champions
		quest::faction(239, -1); 		#:: - The Dead
		#:: Grant a moderate amount of experience
		$client->AddLevelBasedExp(14,10);
		#:: Create a hash for storing cash - 700 to 750cp
		my %cash = plugin::RandomCash(700,750);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Create a timer 'depop' that triggers every 30 seconds
		quest::settimer("depop",30);
	}

	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match the timer 'depop'
	if ($timer eq "depop") {
		#:: Stop the timer 'depop'
		quest::stoptimer("depop");
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_COMBAT 
	{
	if($combat_state == 1)
		{
		quest::say("Time to die, $name!");
		}
	}
