#Hollow Skull

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("$name! Make it quick I am in a [hurry].");
		}
	elsif($text=~/hurry/i)
		{
		quest::say("I was in Paw receantly and stole a skull and now an [assassin] is hunting me down, even after returning the skull to him.");
		}
	elsif($text=~/assassin/i)
		{
		quest::say("Look $name, I don't have time to talk! If you want to help me deliver this [message].");
		}
	elsif($text=~/what message/i)
		{
		quest::say("Hurry now and take this to my brother, Hyrill Pon in Freeport, and before you go take that skull back from the assassin");
		quest::summonitem(18010);
		$diffx = $x + plugin::RandomRange(-500,500);
		$diffy = $y + plugin::RandomRange(-500,500);
		$diffz = $z + 20;
		quest::unique_spawn(12182,12,0,$diffx,$diffy,$diffz,218);
		quest::settimer("die", 300);
		}
	else
		{
		quest::say("There is no time... must keep moving... ugh.");
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("He has found me! Help meeeeeee!");
	}

sub EVENT_TIMER
	{
	quest::stoptimer("die");
	quest::spawn_condition("qey2hh1", 3, 0);
	quest::depop();
	}
#END of FILE zone: ID:12167 -- Yiz_Pon.pl 
