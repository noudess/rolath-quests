
sub EVENT_SPAWN
	{
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name."); 
 }
}

sub EVENT_ENTER
	{
	quest::settarget("entity",$mobid);
	quest::settimer("struggle", 5);
	}

sub EVENT_LEAVE_AREA
	{
	quest::stoptimer("struggle");
	}

sub EVENT_ITEM 
	{#no handin text available
	if ((plugin::check_handin(\%itemcount, 19071 =>1, 19070 => 1 )) && ($platinum >=1000)) 
		{
		quest::summonitem(18302);
		}
	elsif ((plugin::check_handin(\%itemcount, 13718 =>1)))
		{
		quest::say("Oh I love a challenge.  Lets see what I can make of this...");
		quest::say("This is BAD.");
		quest::doanim(61);
		quest::say("I hope I can trust that you are an ally to the Temple of Life.  This should not get back to Sragg before either Jahnda or Roesager hears of this.  I have sealed the now deciphered note to prevent tampering.  Take this to one of them, and make haste.");
		quest::summonitem(1353);
		quest::updatetaskactivity(56,0,1);
		}
	}

sub EVENT_TIMER
	{
	quest::emote("struggles to decipher some old papers");
	quest::doanim(57);
	quest::settimer("struggle", 12);
	}

#END of FILE Zone:qeynos2  ID:2086 -- Rineval_Talyas 

