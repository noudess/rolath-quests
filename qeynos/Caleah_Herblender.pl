# Bat Fur
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i)
	{
	quest::say("Greetings, and welcome to my humble little shop. I sell and trade various goods for my fellow wizards of the Order of Three. My assistants, Hanlore and Drawna, specialize in magicians' and enchanters' goods and would be glad to help you, too.");  
	}
elsif($text=~/Nostahla/i)
	{
	quest::say("Nostahla is trying to help [Unsar] with his dilemna");  
	}
elsif($text=~/Unsar/i)
	{
	quest::say("Ahh yes poor Unsar has gotten himself into quite a pickle hasn't he!  I can make a rat curative that should help him, I'll need you to bring me some items.  Bring me some Liquidised Rat, Lucidem, Curzon and some Medicinal Herbs.");  
	}
elsif ($faction > 5)
	{
	quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions!  Now, begone!");
	}
elsif($text=~/bat fur/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}
elsif($text=~/rat whiskers/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}
elsif($text=~/fire beetle eye/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}
}

sub EVENT_ITEM 
	{

	if (plugin::check_handin(\%itemcount, 35084 => 1, 35085 => 1, 81127 => 1, 9761 =>1))
    	{
		quest::say("Just what I need $name to whip up some rat curative.  Here you go, this should help Unsar.");
		quest::summonitem(232626); #Vial of Rat Curative
		quest::updatetaskactivity(114,12);
		quest::ding();
		}

	if ($faction <= 5 && plugin::check_handin(\%itemcount, 13071 => 1, 13069 => 1, 10307 =>1)) # Rat Whiskers, Bat fur, Fire beetle eye
		{
		quest::say("Hmm. Good job, $name, let's give this a try. Flame and fire. Heat and spark. Touch of Ro, light this dark! Ahh. It stills needs a little work, I guess. Thanks for your help, here's a little something for your effort.");  
		# Factions on ZAM
		quest::faction(342,5); # Order of Three
		quest::faction(262,1); # Guards of Qeynos
		quest::faction(221,-1); # Bloodsabers
		quest::faction(296,-1); # Opal Dark Briar
		quest::exp(200);
		quest::ding();
		quest::givecash(8,0,0,0) # 8 Copper
		}
	plugin::return_items(\%itemcount);
	}

sub EVENT_SPAWN {
  quest::settimer("repeat", 350);
}

sub EVENT_TIMER {
    quest::say("Drawna.. Are we all out of bat fur again?");
	# Empty zones end up stacking signals and spamming
	if (plugin::zoneClientCount() > 0)
		{
		quest::signal(1051,1);
		}
}

sub EVENT_SIGNAL {
    quest::say("Hmmm.. Let's see if we can find someone to help replenish our stock of [rat whiskers] and [bat fur]. I need these items for a new little experiment I'm working on.");
}

# END of FILE Zone:qeynos ID:1118 -- Caleah_Herblender.pl

