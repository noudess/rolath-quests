#Brother_Nallin.pl
#Cure Disease, Cure Poison

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("May the Prime Healer watch over your body as you pass through these dangerous lands.  I am Brother Nallin of the [Temple of Life].  I was dispatched to aid the guards and residents of the plains.  I can assist you if you have need of me to [cure poison] or [cure disease].");
	}
	
	if ($text=~/cure/i)
		{
		if ($faction > 5) # Tested at App(6)
			{
			quest::say("Your mere presense disgusts me.  Please remove yourself from my sight.  Until you change yourself and prove your ways, you are unwelcome in the temple of life.");
			}
		else
			{
			if($text=~/cure disease/i) 
				{
				quest::say("Yes I can cast the disease from your body with the power of the Prime Healer.  First, you must make an offering to the Temple of Life.  The offering is 5 gold coins.");
				}
			elsif($text=~/cure poison/i) 
				{
				quest::say("If you would like me to cure poison, you must offer me 4 water flasks.  I shall see that the residents of the plains get your donation and we shall try to cast the toxin from your body.");
				}
			}
		}
	
	if($text=~/temple of life/i) {
		quest::say("With the walls of Qeynos can be found the home of the Priests of Life, the Temple of Life.  It is there that the good people pay tribute to the great Prime Healer, Rodcet Nife.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 13006 => 4)) 
		{
		quest::say("May Rodcet nife breath upon your body and soul and banish the evil from within.");
		$npc->CastSpell(203, $userid);
		}
	
	elsif($gold + ($silver/10) + ($copper/100) >= 5) 
		{
		quest::say("May Rodcet nife breath upon your body and soul and banish the evil from within.");
		$npc->CastSpell(213, $userid);
		}
	
	else 
		{
		plugin::return_items(\%itemcount);
		}
}
